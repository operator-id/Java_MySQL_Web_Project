package imdb.sergiu;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class GestiuneRegizor {

    public Regizor getDateRegizor(int idRegizor) {

        Regizor regizorulCautat = null;
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {


            connection = DBUtil.getConnection();
            preparedStatement = connection.prepareStatement("select NUME,PRENUME,LOCUL_NASTERII, DATA_NASTERII from Regizor where ID = ? ");
            preparedStatement.setInt(1, idRegizor);

           // System.out.println(sql);

            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                regizorulCautat = new Regizor();
                regizorulCautat.setNume(resultSet.getString("NUME"));
                regizorulCautat.setPrenume(resultSet.getString("PRENUME"));
                regizorulCautat.setLoculNasterii(resultSet.getString("LOCUL_NASTERII"));
                regizorulCautat.setDataNasterii(resultSet.getDate("DATA_NASTERII"));
                regizorulCautat.setId(idRegizor);
                System.out.println("Am gasit un Regizor cu id = " + idRegizor);
            } else
                System.out.println("NU am gasit un Regizor cu id = " + idRegizor);


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
        return regizorulCautat;
    }
    public ArrayList<Regizor> getListaRegizori() {

        ArrayList<Regizor> regizori = new ArrayList<>();
        Regizor regizorulCautat;
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {


            connection = DBUtil.getConnection();
            preparedStatement = connection.prepareStatement("select ID, NUME, PRENUME, LOCUL_NASTERII, DATA_NASTERII from REGIZOR");


            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                regizorulCautat = new Regizor();
                regizorulCautat.setIdRegizor(resultSet.getInt("ID"));
                regizorulCautat.setNume(resultSet.getString("NUME"));
                regizorulCautat.setPrenume(resultSet.getString("PRENUME"));
                regizorulCautat.setLoculNasterii(resultSet.getString("LOCUL_NASTERII"));
                regizorulCautat.setDataNasterii(resultSet.getDate("DATA_NASTERII"));
                regizori.add(regizorulCautat);
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
        return regizori;
    }

    public void salveazaRegizor(Regizor regizorNou) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;


        try {
            connection = DBUtil.getConnection();
            preparedStatement = connection.prepareStatement(
                    "INSERT INTO Regizor( ID, PRENUME, NUME, DATA_NASTERII, LOCUL_NASTERII) values(NULL, ?, ?, ?, ?)");


            preparedStatement.setString(1, regizorNou.getPrenume());
            preparedStatement.setString(2, regizorNou.getNume());
            preparedStatement.setDate(3, regizorNou.getDataNasterii());
            preparedStatement.setString(4, regizorNou.getLoculNasterii());

            preparedStatement.executeUpdate();

            System.out.println("Succes la adaugarea unui regizor nou");

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


    public void stergeRegizor(int idRegizor) {

        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try {
            connection = DBUtil.getConnection();
            preparedStatement = connection.prepareStatement("DELETE FROM Regizor  WHERE id= ?" );
            preparedStatement.setInt(1, idRegizor);
            preparedStatement.executeUpdate();
            System.out.println("Succes la stergere Regizor");
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
    public void modificaNumeRegizor(int idRegizor, String numeNou) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {

            connection = DBUtil.getConnection();

            preparedStatement = connection.prepareStatement("UPDATE Regizor SET NUME = ? WHERE ID = ?");
            preparedStatement.setString(1, numeNou);
            preparedStatement.setInt(2, idRegizor);

            preparedStatement.executeUpdate();

            System.out.println("Succes la modificarea Regizorului");

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
    public void modificaPrenumeRegizor(int idRegizor, String prenumeNou) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {

            connection = DBUtil.getConnection();

            preparedStatement = connection.prepareStatement("UPDATE Regizor SET PRENUME = ? WHERE ID = ?");
            preparedStatement.setString(1, prenumeNou);
            preparedStatement.setInt(2, idRegizor);

            preparedStatement.executeUpdate();

            System.out.println("Succes la modificarea Regizorului");

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
