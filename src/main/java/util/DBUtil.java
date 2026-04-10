package util;
import java.sql.*;

public class DBUtil {
    private static final String URL = "jdbc:mysql://localhost:3306/cyber_trust";
    private static final String USER = "root"; // change if needed
    private static final String PASS = "1234";     // change if needed

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new SQLException(e);
        }
        return DriverManager.getConnection(URL, USER, PASS);
    }
} 