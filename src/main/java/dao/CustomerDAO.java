package dao;
import model.Customer;
import util.DBUtil;
import java.sql.*;

public class CustomerDAO {
    public boolean register(Customer c) throws SQLException {
        String sql = "INSERT INTO customer (Username, Email, Password, Phone, NIC, Country) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection con = DBUtil.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, c.getUsername());
            ps.setString(2, c.getEmail());
            ps.setString(3, c.getPassword());
            ps.setString(4, c.getPhone());
            ps.setString(5, c.getNic());
            ps.setString(6, c.getCountry());
            return ps.executeUpdate() > 0;
        }
    }

    public Customer login(String username, String password) throws SQLException {
        String sql = "SELECT * FROM customer WHERE Username=? AND Password=?";
        try (Connection con = DBUtil.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Customer c = new Customer();
                c.setCustomerId(rs.getInt("CustomerId"));
                c.setUsername(rs.getString("Username"));
                c.setEmail(rs.getString("Email"));
                c.setPassword(rs.getString("Password"));
                c.setPhone(rs.getString("Phone"));
                c.setNic(rs.getString("NIC"));
                c.setCountry(rs.getString("Country"));
                return c;
            }
        }
        return null;
    }

    public boolean update(Customer c) throws SQLException {
        String sql = "UPDATE customer SET Username=?, Email=?, Phone=?, NIC=?, Country=? WHERE CustomerId=?";
        try (Connection con = DBUtil.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, c.getUsername());
            ps.setString(2, c.getEmail());
            ps.setString(3, c.getPhone());
            ps.setString(4, c.getNic());
            ps.setString(5, c.getCountry());
            ps.setInt(6, c.getCustomerId());
            return ps.executeUpdate() > 0;
        }
    }

    public boolean delete(int customerId) throws SQLException {
        String sql = "DELETE FROM customer WHERE CustomerId=?";
        try (Connection con = DBUtil.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, customerId);
            return ps.executeUpdate() > 0;
        }
    }

    public int getTotalUsers() throws SQLException {
        String sql = "SELECT COUNT(*) FROM customer";
        try (Connection con = DBUtil.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        }
        return 0;
    }
} 