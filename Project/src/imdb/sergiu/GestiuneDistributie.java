package imdb.sergiu;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class GestiuneDistributie {
    public Distributie getDateDistributie(int idDistributie) {

        Distributie distributieCautata = null;
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {


            connection = DBUtil.getConnection();
            preparedStatement = connection.prepareStatement("select ID_FILM, ID_ACTOR from DISTRIBUTIE where ID= ? ");
            preparedStatement.setInt(1, idDistributie);

            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                distributieCautata = new Distributie();
                distributieCautata.setIdFilm(resultSet.getInt("ID_FILM"));
                distributieCautata.setIdActor(resultSet.getInt("ID_ACTOR"));


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
        return distributieCautata;
    }

    public ArrayList<Distributie> getListaDistributiei() {

        ArrayList<Distributie> distributie = new ArrayList<>();
        Distributie distributiaCautata;
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {


            connection = DBUtil.getConnection();
            preparedStatement = connection.prepareStatement("select ID, ID_FILM, ID_ACTOR from Distributie");


            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                distributiaCautata = new Distributie();
                distributiaCautata.setId(resultSet.getInt("ID"));
                distributiaCautata.setIdFilm(resultSet.getInt("ID_FILM"));
                distributiaCautata.setIdActor(resultSet.getInt("ID_ACTOR"));


                distributie.add(distributiaCautata);
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
        return distributie;
    }

    public void salveazaDistributie(Distributie distributieNoua) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;


        try {
            connection = DBUtil.getConnection();
            preparedStatement = connection.prepareStatement(
                    "INSERT INTO DISTRIBUTIE( ID, ID_FILM, ID_ACTOR) values(NULL, ?, ?)");

            preparedStatement.setInt(1, distributieNoua.getIdFilm());
            preparedStatement.setInt(2, distributieNoua.getIdActor());

            preparedStatement.executeUpdate();

            System.out.println("Succes la adaugarea unui distributie nou");

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


    public void stergeDistributie(int idDistributie) {

        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try {
            connection = DBUtil.getConnection();
            preparedStatement = connection.prepareStatement("DELETE FROM DISTRIBUTIE  WHERE ID = ?");
            preparedStatement.setInt(1, idDistributie);
            preparedStatement.executeUpdate();
            System.out.println("Succes la stergere distributie");
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

    public void modificaDistributieIdFilm(int idDistributie, int idFilmNou) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {

            connection = DBUtil.getConnection();

            preparedStatement = connection.prepareStatement("UPDATE Distributie SET ID_FILM = ? WHERE ID = ?");
            preparedStatement.setInt(1, idFilmNou);
            preparedStatement.setInt(2, idDistributie);

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
    public void modificaDistributieIdActor(int idDistributie, int idActorNou) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {

            connection = DBUtil.getConnection();

            preparedStatement = connection.prepareStatement("UPDATE Distributie SET ID_ACTOR = ? WHERE ID = ?");
            preparedStatement.setInt(1, idActorNou);
            preparedStatement.setInt(2, idDistributie);

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
