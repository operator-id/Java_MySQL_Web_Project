package  imdb.sergiu;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class GestiuneOscar {


    public Oscar getDateOscar(int idOscar) {

        Oscar oscarulCautat = null;
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {


            connection = DBUtil.getConnection();

            preparedStatement = connection.prepareStatement("select ID_FILM, ID_ACTOR, ANUL, CATEGORIE from Oscar where ID= ?");
            preparedStatement.setInt(1, idOscar);


            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                oscarulCautat = new Oscar();

                oscarulCautat.setIdFilm(resultSet.getInt("ID_FILM"));
                oscarulCautat.setIdActor(resultSet.getInt("ID_ACTOR"));
                oscarulCautat.setAnul(resultSet.getInt("ANUL"));
                oscarulCautat.setCategorie(resultSet.getString("CATEGORIE"));
                oscarulCautat.setId(idOscar);
                System.out.println("Am gasit un Oscar cu id = " + idOscar);
            } else
                System.out.println("NU am gasit un Oscar cu id = " + idOscar);


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
        return oscarulCautat;
    }
    public ArrayList<Oscar> getListaOscaruri() {

        ArrayList<Oscar> oscaruri = new ArrayList<>();
        Oscar oscarulCautat;
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {


            connection = DBUtil.getConnection();
            preparedStatement = connection.prepareStatement("select ID, ID_FILM, ID_ACTOR, ANUL, CATEGORIE from Oscar");


            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                oscarulCautat = new Oscar();
                oscarulCautat.setIdOscar(resultSet.getInt("ID"));
                oscarulCautat.setIdFilm(resultSet.getInt("ID_FILM"));
                oscarulCautat.setIdActor(resultSet.getInt("ID_ACTOR"));
                oscarulCautat.setAnul(resultSet.getInt("ANUL"));
                oscarulCautat.setCategorie(resultSet.getString("CATEGORIE"));

                oscaruri.add(oscarulCautat);
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
        return oscaruri;
    }

    public void salveazaOscar(Oscar oscarNou) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;


        try {
            connection = DBUtil.getConnection();
            preparedStatement = connection.prepareStatement(
                    "INSERT INTO Oscar(ID, ID_FILM, ID_ACTOR, ANUL, CATEGORIE) values(NULL, ?, ?, ?, ?)");


            preparedStatement.setInt(1, oscarNou.getIdFilm());
            preparedStatement.setInt(2, oscarNou.getIdActor());
            preparedStatement.setInt(3, oscarNou.getAnul());
            preparedStatement.setString(4, oscarNou.getCategorie());


            preparedStatement.executeUpdate();

            System.out.println("Succes la adaugarea unui oscar nou");

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


    public void stergeOscar(int idOscar) {

        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try {
            connection = DBUtil.getConnection();
            preparedStatement = connection.prepareStatement("DELETE FROM Oscar  WHERE id= ?");
            preparedStatement.setInt(1, idOscar);
            preparedStatement.executeUpdate();
            System.out.println("Succes la stergere Oscar");
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

    public void modificaCategorieOscar(int idOscar, String categorieNoua) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {

            connection = DBUtil.getConnection();

            preparedStatement = connection.prepareStatement("UPDATE Oscar SET CATEGORIE = ? WHERE ID = ?");
            preparedStatement.setString(1, categorieNoua);
            preparedStatement.setInt(2, idOscar);

            preparedStatement.executeUpdate();

            System.out.println("Succes la modificarea oscarului");

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

    public void modificaAnulOscar(int idOscar, int anNou) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {

            connection = DBUtil.getConnection();

            preparedStatement = connection.prepareStatement("UPDATE Oscar SET ANUL = ? WHERE ID = ?");
            preparedStatement.setInt(1, anNou);
            preparedStatement.setInt(2, idOscar);

            preparedStatement.executeUpdate();

            System.out.println("Succes la modificarea oscarului");

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
