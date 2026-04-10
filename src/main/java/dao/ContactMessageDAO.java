package dao;

import java.sql.*;
import java.util.*;
import util.DBUtil;

public class ContactMessageDAO {
    private Connection getConnection() throws SQLException {
        return DBUtil.getConnection();
    }

    public int create(String name, String email, String subject, String message) {
        String sql = "INSERT INTO contact_messages (name, email, subject, message, status, timestamp) VALUES (?, ?, ?, ?, 'New', NOW())";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, subject);
            ps.setString(4, message);
            int affectedRows = ps.executeUpdate();
            if (affectedRows > 0) {
                try (ResultSet generatedKeys = ps.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        return generatedKeys.getInt(1);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

    public boolean delete(int id) {
        String sql = "DELETE FROM contact_messages WHERE id=?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Map<String, String>> getAll() {
        List<Map<String, String>> list = new ArrayList<>();
        String sql = "SELECT * FROM contact_messages ORDER BY timestamp DESC";
        try (Connection conn = getConnection(); Statement st = conn.createStatement()) {
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                Map<String, String> msg = new HashMap<>();
                msg.put("id", String.valueOf(rs.getInt("id")));
                msg.put("name", rs.getString("name"));
                msg.put("email", rs.getString("email"));
                msg.put("subject", rs.getString("subject"));
                msg.put("message", rs.getString("message"));
                msg.put("timestamp", rs.getString("timestamp"));
                msg.put("status", rs.getString("status"));
                list.add(msg);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean update(int id, String name, String email, String subject, String message) {
        String sql = "UPDATE contact_messages SET name=?, email=?, subject=?, message=? WHERE id=?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, subject);
            ps.setString(4, message);
            ps.setInt(5, id);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public Map<String, String> getById(int id) {
        String sql = "SELECT * FROM contact_messages WHERE id=?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Map<String, String> msg = new HashMap<>();
                    msg.put("id", String.valueOf(rs.getInt("id")));
                    msg.put("name", rs.getString("name"));
                    msg.put("email", rs.getString("email"));
                    msg.put("subject", rs.getString("subject"));
                    msg.put("message", rs.getString("message"));
                    msg.put("timestamp", rs.getString("timestamp"));
                    msg.put("status", rs.getString("status"));
                    return msg;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
} 