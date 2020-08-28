package imdb.sergiu;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class GestiuneRegie {
    public Regie getDateRegie(int idRegie) {

        Regie regieCautata = null;
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {


            connection = DBUtil.getConnection();
            preparedStatement = connection.prepareStatement("select ID_FILM, ID_REGIZOR from REGIE where ID= ? ");
            preparedStatement.setInt(1, idRegie);

            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                regieCautata = new Regie();
                regieCautata.setIdFilm(resultSet.getInt("ID_FILM"));
                regieCautata.setIdRegizor(resultSet.getInt("ID_REGIZOR"));


            }

            System.out.println("Cautarea a functionat cu succes.");
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("NU este OK SQL -ul!");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.out.println("Probleme cu driverul !");
        } finally {
            DBUtil.closeAll(connection, preparedStatement, resultSet);

        }
        return regieCautata;
    }

    public ArrayList<Regie> getListaRegiei() {

        ArrayList<Regie> regie = new ArrayList<>();
        Regie distributiaCautata;
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {


            connection = DBUtil.getConnection();
            preparedStatement = connection.prepareStatement("select ID, ID_FILM, ID_REGIZOR from Regie");


            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                distributiaCautata = new Regie();
                distributiaCautata.setId(resultSet.getInt("ID"));
                distributiaCautata.setIdFilm(resultSet.getInt("ID_FILM"));
                distributiaCautata.setIdRegizor(resultSet.getInt("ID_REGIZOR"));


                regie.add(distributiaCautata);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("NU este OK SQL -ul!");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.out.println("Probleme cu driverul !");
        } finally {
            DBUtil.closeAll(connection, preparedStatement, resultSet);

        }
        return regie;
    }

    public void salveazaRegie(Regie regieNoua) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;


        try {
            connection = DBUtil.getConnection();
            preparedStatement = connection.prepareStatement(
                    "INSERT INTO REGIZOR( ID, ID_FILM, ID_REGIZOR) values(NULL, ?, ?)");

            preparedStatement.setInt(1, regieNoua.getIdFilm());
            preparedStatement.setInt(2, regieNoua.getIdRegizor());

            preparedStatement.executeUpdate();

            System.out.println("Succes la adaugarea unui regie nou");

        } catch (SQLException ex) {
            System.out.println("NU este OK SQL -ul!");
            ex.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.out.println("Probleme cu driverul !");

        } finally {
            DBUtil.closeAll(connection, preparedStatement, null);
        }
    }


    public void stergeRegie(int idRegie) {

        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try {
            connection = DBUtil.getConnection();
            preparedStatement = connection.prepareStatement("DELETE FROM REGIE  WHERE ID = ?");
            preparedStatement.setInt(1, idRegie);
            preparedStatement.executeUpdate();
            System.out.println("Succes la stergere regie");
        } catch (SQLException ex) {
            System.out.println("NU este OK SQL -ul!");
            ex.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.out.println("Probleme cu driverul !");

        } finally {
            DBUtil.closeAll(connection, preparedStatement, null);
        }
    }

    public void modificaRegiIdFilm(int idRegie, int idFilmNou) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {

            connection = DBUtil.getConnection();

            preparedStatement = connection.prepareStatement("UPDATE Regie SET ID_FILM = ? WHERE ID = ?");
            preparedStatement.setInt(1, idFilmNou);
            preparedStatement.setInt(2, idRegie);

            preparedStatement.executeUpdate();

            System.out.println("Succes la modificarea distributiaui");

        } catch (SQLException ex) {
            System.out.println("NU este OK SQL -ul!");
            ex.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.out.println("Probleme cu driverul !");

        } finally {
            DBUtil.closeAll(connection, preparedStatement, null);
        }

    }
    public void modificaRegieIdRegizor(int idRegie, int idRegizorNou) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {

            connection = DBUtil.getConnection();

            preparedStatement = connection.prepareStatement("UPDATE Regie SET ID_REGIZOR = ? WHERE ID = ?");
            preparedStatement.setInt(1, idRegizorNou);
            preparedStatement.setInt(2, idRegie);

            preparedStatement.executeUpdate();

            System.out.println("Succes la modificarea distributiaui");

        } catch (SQLException ex) {
            System.out.println("NU este OK SQL -ul!");
            ex.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.out.println("Probleme cu driverul !");

        } finally {
            DBUtil.closeAll(connection, preparedStatement, null);
        }

    }
}
