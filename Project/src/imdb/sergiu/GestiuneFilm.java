package  imdb.sergiu;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class GestiuneFilm {

    public Film getDateFilm(int idFilm) {

        Film filmulCautat = null;
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {


            connection = DBUtil.getConnection();
            preparedStatement = connection.prepareStatement("select TITLU, DURATA, AN_APARITIE, RATING, DESCRIERE from Film where ID= ? ");
            preparedStatement.setInt(1, idFilm);

            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                filmulCautat = new Film();

                filmulCautat.setTitlu(resultSet.getString("TITLU"));
                filmulCautat.setDurata(resultSet.getTime("DURATA"));
                filmulCautat.setAnAparitie(resultSet.getInt("AN_APARITIE"));
                filmulCautat.setRating(resultSet.getFloat("RATING"));
                filmulCautat.setDescriere(resultSet.getString("DESCRIERE"));
                filmulCautat.setId(idFilm);
                System.out.println("Am gasit un Film cu id = " + idFilm);
            } else
                System.out.println("NU am gasit un Film cu id = " + idFilm);


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
        return filmulCautat;
    }
    public ArrayList<Film> getListaFilme() {

        ArrayList<Film> filme = new ArrayList<>();
        Film filmulCautat;
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {


            connection = DBUtil.getConnection();
            preparedStatement = connection.prepareStatement("select ID, TITLU,DURATA, AN_APARITIE, RATING, DESCRIERE from FILM");


            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                filmulCautat = new Film();
                filmulCautat.setIdFilm(resultSet.getInt("ID"));
                filmulCautat.setTitlu(resultSet.getString("TITLU"));
                filmulCautat.setDurata(resultSet.getTime("DURATA"));
                filmulCautat.setAnAparitie(resultSet.getInt("AN_APARITIE"));
                filmulCautat.setRating(resultSet.getFloat("RATING"));
                filmulCautat.setDescriere(resultSet.getString("DESCRIERE"));
                filme.add(filmulCautat);
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
        return filme;
    }

    public void salveazaFilm(Film filmNou) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;


        try {
            connection = DBUtil.getConnection();
            preparedStatement = connection.prepareStatement(
                    "INSERT INTO Film( ID, TITLU, DURATA, AN_APARITIE, RATING, DESCRIERE) values(NULL, ?, ?, ?, ?, ?)");


            preparedStatement.setString(1, filmNou.getTitlu());
            preparedStatement.setTime(2, filmNou.getDurata());
            preparedStatement.setInt(3, filmNou.getAnAparitie());
            preparedStatement.setFloat(4, filmNou.getRating());
            preparedStatement.setString(5, filmNou.getDescriere());


            preparedStatement.executeUpdate();

            System.out.println("Succes la adaugarea unui film nou");

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


    public void stergeFilm(int idFilm) {

        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try {
            connection = DBUtil.getConnection();
            preparedStatement = connection.prepareStatement("DELETE FROM Film  WHERE id= ?");
            preparedStatement.setInt(1, idFilm);
            preparedStatement.executeUpdate();
            System.out.println("Succes la stergere Film");
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

    public void modificaTitluFilm(int idFilm, String titluNou) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {

            connection = DBUtil.getConnection();

            preparedStatement = connection.prepareStatement("UPDATE Film SET TITLU = ? WHERE ID = ?");
            preparedStatement.setString(1, titluNou);
            preparedStatement.setInt(2, idFilm);

            preparedStatement.executeUpdate();

            System.out.println("Succes la modificarea filmului");

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

    public void modificaRatingFilm(int idFilm, Float ratingNou) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {

            connection = DBUtil.getConnection();

            preparedStatement = connection.prepareStatement("UPDATE Film SET RATING = ? WHERE ID = ?");
            preparedStatement.setFloat(1, ratingNou);
            preparedStatement.setInt(2, idFilm);

            preparedStatement.executeUpdate();

            System.out.println("Succes la modificarea filmului");

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

    public void modificaDescriereFilm(int idFilm, String descriereNoua) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {

            connection = DBUtil.getConnection();

            preparedStatement = connection.prepareStatement("UPDATE Film SET DESCRIERE = ? WHERE ID = ?");
            preparedStatement.setString(1, descriereNoua);
            preparedStatement.setInt(2, idFilm);

            preparedStatement.executeUpdate();

            System.out.println("Succes la modificarea filmului");

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



