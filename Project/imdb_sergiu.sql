-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.8-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for imdb_sergiu
CREATE DATABASE IF NOT EXISTS `imdb_sergiu` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `imdb_sergiu`;

-- Dumping structure for table imdb_sergiu.actor
CREATE TABLE IF NOT EXISTS `actor` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Prenume` varchar(50) NOT NULL,
  `Nume` varchar(50) NOT NULL,
  `Data_Nasterii` date NOT NULL,
  `Locul_Nasterii` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table imdb_sergiu.actor: ~11 rows (approximately)
/*!40000 ALTER TABLE `actor` DISABLE KEYS */;
INSERT IGNORE INTO `actor` (`ID`, `Prenume`, `Nume`, `Data_Nasterii`, `Locul_Nasterii`) VALUES
	(1, 'Morgan', 'Freeman', '1937-06-01', 'Memphis, Tennessee'),
	(2, 'Tim', 'Robbins', '1958-10-16', 'West Covina, California, USA'),
	(3, 'Al', 'Pacino', '1940-04-25', 'New York, USA'),
	(4, 'George', 'Clooney', '1961-05-06', 'Lexington, Kentucky, USA'),
	(5, 'Matt', 'Damon', '1970-10-08', 'Boston, Massachussets, USA'),
	(6, 'Brian', 'Cranston', '1956-03-07', 'Hollywood, California, USA'),
	(7, 'Ben', 'Afleck', '1972-08-15', 'Berkeley, California, USA'),
	(8, 'Robert', 'De Niro', '1943-08-17', 'New York, USA'),
	(9, 'Cate', 'Blanchett', '1969-05-14', ' Melbourne, Victoria, Australia'),
	(10, 'Joe', 'Pesci', '1943-02-09', 'Newark, New Jersey, USA'),
	(16, 'Hyde', 'Sam', '1985-04-16', ' Fall River, Massachusetts, US'),
	(23, 'Marsh', 'Randy', '1990-01-22', 'South Park'),
	(24, 'c', 'd', '2000-11-11', 'c'),
	(25, 'random', 'random', '1111-11-11', 'randomo');
/*!40000 ALTER TABLE `actor` ENABLE KEYS */;

-- Dumping structure for table imdb_sergiu.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_title` varchar(50) NOT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- Dumping data for table imdb_sergiu.categories: ~7 rows (approximately)
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT IGNORE INTO `categories` (`cat_id`, `cat_title`) VALUES
	(4, 'Ulei motor'),
	(5, 'Baterii auto'),
	(7, 'Antigel'),
	(8, 'Becuri auto'),
	(11, 'Jante auto'),
	(13, 'Odorizante auto'),
	(16, 'Covorase auto');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- Dumping structure for table imdb_sergiu.distributie
CREATE TABLE IF NOT EXISTS `distributie` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Film` int(11) NOT NULL,
  `ID_Actor` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Column 2` (`ID_Film`),
  KEY `Column 3` (`ID_Actor`),
  CONSTRAINT `FK_Distributie_actor` FOREIGN KEY (`ID_Actor`) REFERENCES `actor` (`ID`),
  CONSTRAINT `FK_Distributie_film` FOREIGN KEY (`ID_Film`) REFERENCES `film` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table imdb_sergiu.distributie: ~13 rows (approximately)
/*!40000 ALTER TABLE `distributie` DISABLE KEYS */;
INSERT IGNORE INTO `distributie` (`ID`, `ID_Film`, `ID_Actor`) VALUES
	(1, 4, 5),
	(2, 3, 5),
	(3, 1, 2),
	(4, 1, 1),
	(5, 2, 3),
	(6, 3, 4),
	(7, 5, 1),
	(8, 6, 4),
	(9, 6, 6),
	(10, 8, 6),
	(11, 9, 8),
	(12, 10, 9),
	(13, 11, 10),
	(15, 11, 8);
/*!40000 ALTER TABLE `distributie` ENABLE KEYS */;

-- Dumping structure for table imdb_sergiu.employee
CREATE TABLE IF NOT EXISTS `employee` (
  `id_angajat` int(11) NOT NULL AUTO_INCREMENT,
  `nume` varchar(50) NOT NULL DEFAULT '',
  `prenume` varchar(50) NOT NULL DEFAULT '',
  `id_manager` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_angajat`),
  KEY `id_manageer` (`id_manager`),
  CONSTRAINT `FK_employee_employee` FOREIGN KEY (`id_manager`) REFERENCES `employee` (`id_angajat`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table imdb_sergiu.employee: ~4 rows (approximately)
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT IGNORE INTO `employee` (`id_angajat`, `nume`, `prenume`, `id_manager`) VALUES
	(1, 'Cartman', 'Eric', NULL),
	(2, 'Marsh', 'Stan', 1),
	(3, 'Foster', 'Dan', 2),
	(4, 'Broflowski', 'Kyle', 1);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;

-- Dumping structure for table imdb_sergiu.film
CREATE TABLE IF NOT EXISTS `film` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Titlu` varchar(75) NOT NULL,
  `Durata` time NOT NULL,
  `An_Aparitie` year(4) NOT NULL DEFAULT 0000,
  `Rating` float NOT NULL DEFAULT 0,
  `Descriere` varchar(200) DEFAULT 'Descriere',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table imdb_sergiu.film: ~11 rows (approximately)
/*!40000 ALTER TABLE `film` DISABLE KEYS */;
INSERT IGNORE INTO `film` (`ID`, `Titlu`, `Durata`, `An_Aparitie`, `Rating`, `Descriere`) VALUES
	(1, 'The Shawshank Redemption1', '02:22:00', '1994', 9.77, 'Descriere'),
	(2, 'The Godfather', '02:55:00', '1972', 9, 'Descriere'),
	(3, 'Ocean\'s Thirteen', '02:02:00', '2007', 7, 'Descriere'),
	(4, 'The Martian ', '02:24:00', '2015', 8.3, 'Descriere'),
	(5, 'Million Dollar Baby', '02:12:00', '2004', 8, 'Descriere'),
	(6, 'Argo', '02:00:06', '2012', 8.5, 'Descriere'),
	(7, 'Good Night, and Good Luck.', '01:33:00', '2005', 7, 'Descriere'),
	(8, 'Breaking Bad', '00:49:00', '2008', 10, 'Descriere'),
	(9, 'Raging Bull', '02:09:25', '1980', 8.2, 'Descriere'),
	(10, 'The Aviator ', '02:50:56', '2004', 7.5, 'Descriere'),
	(11, 'Goodfellas', '02:26:50', '1990', 8.7, 'Descriere');
/*!40000 ALTER TABLE `film` ENABLE KEYS */;

-- Dumping structure for table imdb_sergiu.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_amount` float NOT NULL,
  `order_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_romanian_ci NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;

-- Dumping data for table imdb_sergiu.orders: ~3 rows (approximately)
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT IGNORE INTO `orders` (`order_id`, `order_amount`, `order_status`) VALUES
	(46, 78.97, 'FINISATA CU SUCCES'),
	(47, 1673.94, 'FINISATA CU SUCCES'),
	(48, 276.95, 'FINISATA CU SUCCES');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;

-- Dumping structure for table imdb_sergiu.oscar
CREATE TABLE IF NOT EXISTS `oscar` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Film` int(11) NOT NULL,
  `ID_Actor` int(11) NOT NULL,
  `Anul` year(4) NOT NULL,
  `Categorie` varchar(75) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `ID_Film` (`ID_Film`),
  KEY `ID_Actor` (`ID_Actor`),
  CONSTRAINT `FK__actor_oscar` FOREIGN KEY (`ID_Actor`) REFERENCES `actor` (`ID`),
  CONSTRAINT `FK__film_oscar` FOREIGN KEY (`ID_Film`) REFERENCES `film` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table imdb_sergiu.oscar: ~7 rows (approximately)
/*!40000 ALTER TABLE `oscar` DISABLE KEYS */;
INSERT IGNORE INTO `oscar` (`ID`, `ID_Film`, `ID_Actor`, `Anul`, `Categorie`) VALUES
	(1, 5, 1, '2005', 'Best Performance by an Actor in a Supporting Role'),
	(2, 6, 4, '2013', 'Best Motion Picture of the Year'),
	(4, 7, 4, '2010', 'Best Achievement in Directing'),
	(5, 6, 7, '2013', 'Best Motion Picture of the Year'),
	(6, 9, 8, '1981', 'Best Actor in a Leading Role'),
	(8, 10, 9, '2005', 'Best Performance by an Actress in a Supporting Role'),
	(9, 11, 10, '1991', 'Best Actor in a Supporting Role');
/*!40000 ALTER TABLE `oscar` ENABLE KEYS */;

-- Dumping structure for table imdb_sergiu.products
CREATE TABLE IF NOT EXISTS `products` (
  `prod_id` int(11) NOT NULL AUTO_INCREMENT,
  `prod_cat_id` int(11) NOT NULL,
  `prod_title` varchar(50) NOT NULL,
  `prod_price` float NOT NULL,
  `prod_description` text NOT NULL,
  `prod_img` varchar(255) NOT NULL,
  `prod_short_desc` text NOT NULL,
  `prod_quantity` int(11) NOT NULL,
  PRIMARY KEY (`prod_id`),
  KEY `prod_cat_id` (`prod_cat_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`prod_cat_id`) REFERENCES `categories` (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;

-- Dumping data for table imdb_sergiu.products: ~35 rows (approximately)
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT IGNORE INTO `products` (`prod_id`, `prod_cat_id`, `prod_title`, `prod_price`, `prod_description`, `prod_img`, `prod_short_desc`, `prod_quantity`) VALUES
	(7, 4, 'Ulei motor Dacia 1L', 23.99, 'Specificatie: API: SL,ACEA: A3/B4\r\nCompatibilitate: Benzina\r\nVascozitate: 10W40\r\nCapacitate (L): 1', 'ulei-motor-10w40-original-dacia-oil-plus-extra-1l-db9961ffc6a00a0fa6-0-0-0-0-03597.jpg', 'Ulei motor Dacia Oil Plus Extra, 10W40, 1L', 23),
	(8, 4, 'Ulei motor Champion 1L', 16.99, 'Specificatie: API: SL/CF,MB: 229.1,VW: 501.01,VW: 505.00,ACEA: A3/B4-08,ACEA: A3/B3-10\r\nVascozitate: 15W40\r\nCapacitate (L): 1', '8200410CHP9752.jpg', 'Ulei motor Champion Active Defence A3/B4, 15W40, 1L', 17),
	(9, 4, 'Ulei motor Elf 1L', 16.99, 'Vascozitate: 20W50\r\nCapacitate (L): 1', 'res_c72df16169eff84e1599544f313e1cab_full4480.jpg', 'Ulei motor Elf Sporti TXI, 20W50, 1L', 16),
	(10, 4, 'Ulei motor Castrol 1L', 20.99, 'Vascozitate: 15W40\r\nCapacitate (L): 1', '0310670_l1606.jpg', 'Ulei motor Castrol GTX A3/B3, 15W40, 1L', 21),
	(11, 4, 'Ulei motor Shell 1L', 21.99, 'Specificatie: ACEA: A3/B3,API: SN/CF,Renault: RN 0700,VW: 502 00 / 505 00,ACEA: A3/B4,FIAT: 9.55535-G2,MB: 229.3\r\nVascozitate: 10W40\r\nCapacitate (L): 1', 'helix-hx7-10w40-1l6406.jpg', 'Ulei motor Shell Helix HX7, 10W40, 1L', 22),
	(12, 5, 'Baterie auto Varta ', 180.99, 'Tensiune [V]: 12\r\nFixare: B13\r\nAmperaj (Ah): 41\r\nCurent pornire (A): 360\r\nPolaritate: Normala\r\nLungime (mm): 207\r\nLatime (mm): 175\r\nInaltime (mm): 175', 'baterie-auto-varta-black-dynamic-41ah-360a-54140003631221393.jpg', 'Baterie auto Varta A17, Black dynamic, 41Ah, 360A, 5414000363122', 18),
	(13, 5, 'Baterie auto QWP', 192.99, 'Tensiune [V]: 12\r\nFixare: B13\r\nAmperaj (Ah): 45\r\nCurent pornire (A): 400\r\nPolaritate: Normala\r\nLungime (mm): 207\r\nLatime (mm): 175\r\nInaltime (mm): 190', 'baterie-auto-qwp-45ah-400a-wep54401993.jpg', 'Baterie auto QWP, 45Ah, 400A, WEP5440', 19),
	(14, 5, 'Baterie auto Bosch', 219.99, 'Tensiune [V]: 12\r\nFixare: B01\r\nAmperaj (Ah): 40\r\nCurent pornire (A): 330\r\nPolaritate: Normala\r\nLungime (mm): 187\r\nLatime (mm): 127\r\nInaltime (mm): 227', 'baterie-auto-bosch-40ah-0092s403006200.jpg', 'Baterie auto Bosch, S4, 40Ah, 330A, 0092S40300', 21),
	(15, 5, 'Baterie auto VW-AUDI', 329.99, 'Tensiune [V]: 12\r\nAmperaj (Ah): 61\r\nCurent pornire (A): 540\r\nPolaritate: Normala\r\nLungime (mm): 245\r\nLatime (mm): 175\r\nInaltime (mm): 190', 'JZW9151056063.jpg', 'Baterie auto originala VW-AUDI, 61Ah, 540A', 23),
	(16, 5, 'Baterie auto XT', 338.99, 'Tensiune [V]: 12\r\nAmperaj (Ah): 97\r\nCurent pornire (A): 800\r\nPolaritate: Normala\r\nLungime (mm): 353\r\nLatime (mm): 175\r\nInaltime (mm): 190', 'XTBAT972518.jpg', '\r\nBaterie auto XT Classic, 97Ah, 800A', 13),
	(17, 7, 'Antigel concentrat Dynamax', 9.99, 'Tip antigel: G11\r\nCapacitate (L): 1L\r\nCuloare: Albastru', 'antigel-dynamax-albastru-g11-1l1421.jpg', 'Antigel concentrat Dynamax, albastru, G11, 1L', 20),
	(18, 7, 'Antigel TOTAL', 16.99, 'Tip antigel: G12\r\nCapacitate (L): 1L\r\nCuloare: Rosu', 'res_b7d9f9e9ab8ca1cef6bb0564835b382c_full1147.jpg', 'Antigel TOTAL Glacelf Supra, rosu, G12, 1L', 14),
	(19, 7, 'Antigel concentrat Mobil', 25.99, 'Tip antigel: G11\r\nCapacitate (L): 1L\r\nCuloare: Albastru', 'mobil_antifreeze_extra1967.jpg', 'Antigel concentrat Mobil Antifreeze Extra, albastru, G11, 1L', 16),
	(20, 7, 'Antigel concentrat Starline', 12.99, 'Tip antigel: G12\r\nCapacitate (L): 1L\r\nCuloare: Rosu', 'antigel-starline-rosu-g12-1l7210.jpg', 'Antigel concentrat Starline, rosu, G12, 1L', 3),
	(21, 7, 'Antigel concentrat HEPU', 94.99, 'Tip antigel: G11\r\nCapacitate (L): 5\r\nCuloare: Albastru', '490815924_w640_h640_48d1beed1f73ee__284c78ee454654.jpg', 'Antigel concentrat HEPU, albastru, G11, 5L', 4),
	(22, 8, 'Bec Bosch Xenon', 28.99, 'Putere bec: 55W\r\nTip bec: Halogen\r\nModel bec: H7', '1987301013-1-large2386.jpg', 'Bec Bosch Xenon Blue, H7, 12V, 55W, Blister', 2),
	(23, 8, 'Bec xenon General Electric', 205.99, 'Putere bec: 35W\r\nTip bec: Xenon\r\nModel bec: D1S\r\nCuloare (k): 4300', 'ge_d1s_1_edit_19945.jpg', 'Bec xenon D1S, General Electric, GE53630', 4),
	(24, 8, 'Bec Philips Premium', 9.99, 'Putere bec: 55W\r\nTip bec: Halogen\r\nModel bec: H1\r\nInformare: +30% putere iluminare', '12258prc1-pid-global-0015770.jpg', 'Bec Philips Premium, H1, 12V, 55W', 16),
	(25, 8, 'Bec xenon original VW', 179.99, 'Putere bec: 35W\r\nTip bec: Xenon\r\nModel bec: D2S\r\nCuloare (k): 4300', 'res_ee53c5affb155668e64c17d0c23bc12d_full2403.jpg', 'Bec xenon D2S, original VW, N10445701, Made by Philips', 21),
	(26, 8, 'Bec Narva', 14.99, 'Putere bec: 51W\r\nTip bec: Halogen\r\nModel bec: HB4', 'bel_kozlik_48006_23279.jpg', 'Bec Narva, HB4, 12V, 51W', 3),
	(27, 11, 'Janta tabla Dacia Duster', 333.99, 'Latime: 6.5J\r\nMarca Masina: Dacia\r\nTip: Otel\r\nModel Masina: Duster\r\nDiametru (inch): 16 inch\r\nET.: 50\r\nCuloare: Gri', '403002241r-poza-noua1646.jpg', 'Janta tabla originala Dacia Duster, 16 inch, PCD 5x114,3', 6),
	(28, 11, 'Janta Aliaj Dacia Logan Sandero', 409.99, 'Latime: 6J\r\nMarca Masina: Dacia\r\nTip: Aliaj\r\nModel Masina: Logan\r\nDiametru (inch): 15 inch\r\nET.: 43', 'res_8dc2a62e394c2f2d138a84a6131e4be2_full3527.jpg', 'Janta Aliaj originala Dacia Logan Sandero MCV (2009 - 2017) ET 43 6 J X 15 8200698222', 12),
	(29, 11, 'Janta otel Roller VW Jetta', 155.99, 'Latime: 6.5J\r\nMarca Masina: VW\r\nTip: Otel\r\nModel Masina: Jetta\r\nDiametru (inch): 16 inch\r\nET.: 50', 'off3627825802.jpg', 'Janta otel Roller pentru VW Jetta (09.05-), 6.5Jx16, PCD 5x112-57, ET 50', 8),
	(30, 11, 'Janta otel Roller Audi A3', 165.99, 'Latime: 6J\r\nMarca Masina: Audi\r\nModel Masina: A3\r\nDiametru (inch): 16 inch\r\nET.: 50', 'off3627824472.jpg', 'Janta otel Roller pentru Audi A3 (05.03-), 6Jx16, PCD 5x112-57, ET 50', 4),
	(31, 11, 'Janta tabla originala Dacia Logan', 247.99, 'Latime: 6J\r\nMarca Masina: Dacia\r\nTip: Otel\r\nModel Masina: Logan 2\r\nDiametru (inch): 15 inch\r\nET.: 40\r\nCuloare: Gri', 'res_66c2905287bc6e569370f9f72a58e4d5_450x450_hiv83026.jpg', 'Janta tabla originala Dacia Logan 2, 15 inch, PCD 4x100', 8),
	(32, 16, 'Set 2 covorase auto Audi Q5', 59.99, 'Tip: Cauciuc\r\nMarca Masina: Audi\r\nModel Masina: Q5', 'NVFAUBL20085973.jpg', 'Set 2 covorase auto din cauciuc Novline pentru AUDI Q5 01/2009 -> prezent, NVFAUBL2008', 9),
	(33, 16, 'Set 2 covorase cauciuc BMW X5', 349.99, 'Tip: Cauciuc\r\nMarca Masina: BMW\r\nModel Masina: X5', 'res_aa54c8e6c14f248c77f2cf4415872348_450x450_tpvq8030.jpg', 'Set 2 covorase cauciuc fata, originale BMW X5 (F15) 2013 -> prezent, 51472458439', 8),
	(34, 16, 'Set 4 covorase mocheta gri', 36.99, 'Tip: Mocheta\r\nMarca Masina: Universale', '14081.JPG290504.jpg', 'Set 4 covorase mocheta gri, Bottari, 14081', 15),
	(35, 16, 'Set 2 covorase auto VW Caddy', 61.99, 'Tip: Cauciuc\r\nMarca Masina: VW\r\nModel Masina: Caddy', '64110PX855174.jpg', 'Set 2 covorase auto fata din cauciuc Petex pentru VW Caddy 2004 -> prezent, 64110PX', 6),
	(36, 16, 'Set 4 covorase auto cauciuc Umbrella', 53.99, 'Tip: Cauciuc\r\nMarca Masina: Universale', '451408396.png', 'Set 4 covorase auto cauciuc Umbrella Hawaii Negru, 45140', 4),
	(37, 13, 'Odorizant auto bradut', 8.99, 'Odorizant auto bradut Wunder-Baum Everfresh (aer proaspat)', '458358587.png', 'Odorizant auto bradut Wunder-Baum Everfresh (aer proaspat)', 42),
	(38, 13, 'Odorizant original Audi', 84.99, 'Odorizant original Audi, Gecko galben', '000087009c-odorizant-original-audi-gecko-galben-700x7004664.jpg', 'Odorizant original Audi, Gecko galben', 3),
	(39, 13, 'Odorizant Ambi Pur ', 74.99, 'Odorizant Ambi Pur cu miros de primavara si flori', 'ws_serve_pic-25-5739.jpg', 'Odorizant Ambi Pur cu miros de primavara si flori', 1),
	(40, 13, 'Odorizant auto original BMW', 69.99, 'Odorizant auto original BMW', '831222856739718.png', 'Odorizant auto original BMW', 3),
	(41, 13, 'Odorizant auto California Scents ', 13.99, 'Odorizant auto California Scents Newport New Car\r\nUtilizare: Odorizant', 'ccs-1222ctmc2492.jpg', 'Odorizant auto California Scents Newport New Car', 13);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;

-- Dumping structure for table imdb_sergiu.regie
CREATE TABLE IF NOT EXISTS `regie` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Film` int(11) NOT NULL,
  `ID_Regizor` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Column 2` (`ID_Film`),
  KEY `Column 3` (`ID_Regizor`),
  CONSTRAINT `FK__film_regie` FOREIGN KEY (`ID_Film`) REFERENCES `film` (`ID`),
  CONSTRAINT `FK__regizor_regie` FOREIGN KEY (`ID_Regizor`) REFERENCES `regizor` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table imdb_sergiu.regie: ~8 rows (approximately)
/*!40000 ALTER TABLE `regie` DISABLE KEYS */;
INSERT IGNORE INTO `regie` (`ID`, `ID_Film`, `ID_Regizor`) VALUES
	(2, 3, 3),
	(3, 2, 4),
	(4, 4, 1),
	(5, 1, 2),
	(6, 6, 5),
	(7, 8, 6),
	(8, 9, 7),
	(9, 10, 7),
	(10, 11, 7),
	(11, 5, 8);
/*!40000 ALTER TABLE `regie` ENABLE KEYS */;

-- Dumping structure for table imdb_sergiu.regizor
CREATE TABLE IF NOT EXISTS `regizor` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Prenume` varchar(50) NOT NULL,
  `Nume` varchar(50) NOT NULL,
  `Data_Nasterii` date NOT NULL,
  `Locul_Nasterii` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table imdb_sergiu.regizor: ~8 rows (approximately)
/*!40000 ALTER TABLE `regizor` DISABLE KEYS */;
INSERT IGNORE INTO `regizor` (`ID`, `Prenume`, `Nume`, `Data_Nasterii`, `Locul_Nasterii`) VALUES
	(1, 'Ridley', 'Scott', '1937-11-30', 'South Shields, County Durham, England, UK'),
	(2, 'Frank', 'NumeNou', '1959-01-28', 'Montbeliard, Doubs, France'),
	(3, 'Steven ', 'Soderbergh', '1963-01-14', 'Atlanta, Georgia, USA'),
	(4, 'Francis', 'Ford Coppola', '1939-04-07', 'Detroit, Michigan, USA'),
	(5, 'Ben', 'Affleck', '1972-08-15', 'Berkeley, California, USA'),
	(6, 'Vince', 'Gilligan', '1967-02-10', 'Richmond, Virginia, USA'),
	(7, 'Martin', 'Scorsese', '1942-11-07', 'Queens, New York, USA'),
	(8, 'Clint', 'Eastwood', '1930-05-31', 'San Francisco, California, USA'),
	(9, 'Sam', 'Hyde', '1985-04-16', ' Fall River, Massachusetts, US'),
	(10, 'Sam', 'Hyde', '1985-04-16', ' Fall River, Massachusetts, US');
/*!40000 ALTER TABLE `regizor` ENABLE KEYS */;

-- Dumping structure for table imdb_sergiu.reports
CREATE TABLE IF NOT EXISTS `reports` (
  `report_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `prod_id` int(11) NOT NULL,
  `prod_title` varchar(255) NOT NULL,
  `prod_price` float NOT NULL,
  `prod_quantity` int(11) NOT NULL,
  PRIMARY KEY (`report_id`),
  KEY `order_id` (`order_id`),
  KEY `prod_id` (`prod_id`),
  CONSTRAINT `reports_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `reports_ibfk_2` FOREIGN KEY (`prod_id`) REFERENCES `products` (`prod_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

-- Dumping data for table imdb_sergiu.reports: ~7 rows (approximately)
/*!40000 ALTER TABLE `reports` DISABLE KEYS */;
INSERT IGNORE INTO `reports` (`report_id`, `order_id`, `prod_id`, `prod_title`, `prod_price`, `prod_quantity`) VALUES
	(28, 46, 22, 'Bec Bosch Xenon', 28.99, 2),
	(29, 46, 10, 'Ulei motor Castrol 1L', 20.99, 1),
	(30, 47, 7, 'Ulei motor Dacia 1L', 23.99, 1),
	(31, 47, 17, 'Antigel concentrat Dynamax', 9.99, 1),
	(32, 47, 28, 'Janta Aliaj Dacia Logan Sandero', 409.99, 4),
	(33, 48, 7, 'Ulei motor Dacia 1L', 23.99, 4),
	(34, 48, 12, 'Baterie auto Varta ', 180.99, 1);
/*!40000 ALTER TABLE `reports` ENABLE KEYS */;

-- Dumping structure for table imdb_sergiu.services
CREATE TABLE IF NOT EXISTS `services` (
  `service_id` int(11) NOT NULL AUTO_INCREMENT,
  `service_title` varchar(255) NOT NULL,
  PRIMARY KEY (`service_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Dumping data for table imdb_sergiu.services: ~8 rows (approximately)
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT IGNORE INTO `services` (`service_id`, `service_title`) VALUES
	(1, 'Inspectie'),
	(2, 'Service motor'),
	(3, 'Service frane'),
	(4, 'Service roti'),
	(5, 'Service sistem incalzire si climatizare'),
	(6, 'Service parabriz'),
	(7, 'Test lumini'),
	(8, 'Reparatii mecanice');
/*!40000 ALTER TABLE `services` ENABLE KEYS */;

-- Dumping structure for table imdb_sergiu.users
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `user_img` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Dumping data for table imdb_sergiu.users: ~2 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT IGNORE INTO `users` (`user_id`, `username`, `email`, `password`, `user_img`) VALUES
	(6, 'admin', 'admin@autoservice.con', 'admin', ''),
	(7, 'root', 'root@mail.com', 'root', '');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
