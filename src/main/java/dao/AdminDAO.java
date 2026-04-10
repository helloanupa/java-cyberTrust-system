package dao;
import model.Admin;
import util.DBUtil;
import java.sql.*;

public class AdminDAO {
    public Admin login(String username, String password) throws SQLException {
        String sql = "SELECT * FROM admin WHERE username=? AND password=?";
        try (Connection con = DBUtil.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Admin a = new Admin();
                a.setId(rs.getInt("id"));
                a.setUsername(rs.getString("username"));
                a.setPassword(rs.getString("password"));
                return a;
            }
        }
        return null;
    }
} 