package imdb.sergiu;


import java.sql.*;

public class DBUtil {

    private static final String URL = "jdbc:mysql://localhost:3306/imdb_sergiu";
    private static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
    private static final String USER = "root";
    private static final String PASSWORD = "";

    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        Connection conn;
        Class.forName(JDBC_DRIVER);
        conn = DriverManager.getConnection(URL, USER, PASSWORD);
        return conn;
    }

    public static void closeAll(Connection con, Statement stmt, ResultSet rs) {
        if (rs != null)
            try {
                rs.close();
            } catch (SQLException e) {
                System.out.println("Nu a mers inchiderea");
            }
        if (stmt != null)
            try {
                stmt.close();
            } catch (SQLException e) {
                System.out.println("Nu a mers inchiderea");
            }
        if (con != null)
            try {
                con.close();
            } catch (SQLException e) {
                System.out.println("Nu a mers inchiderea");
            }
    }
}
