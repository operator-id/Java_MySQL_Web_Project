package  imdb.sergiu;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class GestiuneActor {
    public Actor getDateActor(int idActor) {

        Actor actorulCautat = null;
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {


            connection = DBUtil.getConnection();
            preparedStatement = connection.prepareStatement("select NUME,PRENUME,LOCUL_NASTERII, DATA_NASTERII from ACTOR where ID= ? ");
            preparedStatement.setInt(1, idActor);

            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                actorulCautat = new Actor();
                actorulCautat.setNume(resultSet.getString("NUME"));
                actorulCautat.setPrenume(resultSet.getString("PRENUME"));
                actorulCautat.setLoculNasterii(resultSet.getString("LOCUL_NASTERII"));
                actorulCautat.setDataNasterii(resultSet.getDate("DATA_NASTERII"));
                actorulCautat.setIdActor(idActor);
                System.out.println("Am gasit un actor cu id = " + idActor);
            } else
                System.out.println("NU am gasit un actor cu id = " + idActor);


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
        return actorulCautat;
    }
    public ArrayList<Actor> getListaActori() {

        ArrayList<Actor> actori = new ArrayList<>();
        Actor actorulCautat;
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {


            connection = DBUtil.getConnection();
            preparedStatement = connection.prepareStatement("select ID, NUME, PRENUME, LOCUL_NASTERII, DATA_NASTERII from ACTOR");


            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                actorulCautat = new Actor();
                actorulCautat.setIdActor(resultSet.getInt("ID"));
                actorulCautat.setNume(resultSet.getString("NUME"));
                actorulCautat.setPrenume(resultSet.getString("PRENUME"));
                actorulCautat.setLoculNasterii(resultSet.getString("LOCUL_NASTERII"));
                actorulCautat.setDataNasterii(resultSet.getDate("DATA_NASTERII"));
                actori.add(actorulCautat);
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
        return actori;
    }

    public void salveazaActor(Actor actorNou) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;


        try {
            connection = DBUtil.getConnection();
            preparedStatement = connection.prepareStatement(
                    "INSERT INTO ACTOR( ID, PRENUME, NUME, DATA_NASTERII, LOCUL_NASTERII) values(NULL, ?, ?, ?, ?)");


            preparedStatement.setString(1, actorNou.getPrenume());
            preparedStatement.setString(2, actorNou.getNume());
            preparedStatement.setDate(3, actorNou.getDataNasterii());
            preparedStatement.setString(4, actorNou.getLoculNasterii());

            preparedStatement.executeUpdate();

            System.out.println("Succes la adaugarea unui actor nou");

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


    public void stergeActor(int idActor) {

        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try {
            connection = DBUtil.getConnection();
            preparedStatement = connection.prepareStatement("DELETE FROM ACTOR  WHERE id= ?");
            preparedStatement.setInt(1, idActor);
            preparedStatement.executeUpdate();
            System.out.println("Succes la stergere actor");
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

    public void modificaNumeActor(int idActor, String numeNou) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {

            connection = DBUtil.getConnection();

            preparedStatement = connection.prepareStatement("UPDATE Actor SET NUME = ? WHERE ID = ?");
            preparedStatement.setString(1, numeNou);
            preparedStatement.setInt(2, idActor);

            preparedStatement.executeUpdate();

            System.out.println("Succes la modificarea actorului");

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
    public void modificaPrenumeActor(int idActor, String prenumeNou) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {

            connection = DBUtil.getConnection();

            preparedStatement = connection.prepareStatement("UPDATE Actor SET PRENUME = ? WHERE ID = ?");
            preparedStatement.setString(1, prenumeNou);
            preparedStatement.setInt(2, idActor);

            preparedStatement.executeUpdate();

            System.out.println("Succes la modificarea actorului");

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
