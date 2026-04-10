package dao;
import model.SupportTicket;
import util.DBUtil;
import java.sql.*;
import java.util.*;

public class SupportTicketDAO {
    public int create(SupportTicket ticket) throws SQLException {
        String sql = "INSERT INTO support_ticket (customerId, subject, message, status, created_at, updated_at) VALUES (?, ?, ?, ?, NOW(), NOW())";
        try (Connection con = DBUtil.getConnection(); PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setObject(1, ticket.getCustomerId());
            ps.setString(2, ticket.getSubject());
            ps.setString(3, ticket.getMessage());
            ps.setString(4, ticket.getStatus());
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) return rs.getInt(1);
        }
        return -1;
    }

    public SupportTicket getById(int id) throws SQLException {
        String sql = "SELECT * FROM support_ticket WHERE id=?";
        try (Connection con = DBUtil.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return extract(rs);
        }
        return null;
    }

    public List<SupportTicket> getAll(Integer customerId) throws SQLException {
        String sql = (customerId != null) ? "SELECT * FROM support_ticket WHERE customerId=? ORDER BY created_at DESC" : "SELECT * FROM support_ticket ORDER BY created_at DESC";
        List<SupportTicket> list = new ArrayList<>();
        try (Connection con = DBUtil.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            if (customerId != null) ps.setInt(1, customerId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) list.add(extract(rs));
        }
        return list;
    }

    public boolean update(SupportTicket ticket) throws SQLException {
        String sql = "UPDATE support_ticket SET subject=?, message=?, status=?, updated_at=NOW() WHERE id=?";
        try (Connection con = DBUtil.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, ticket.getSubject());
            ps.setString(2, ticket.getMessage());
            ps.setString(3, ticket.getStatus());
            ps.setInt(4, ticket.getId());
            return ps.executeUpdate() > 0;
        }
    }

    public boolean delete(int id) throws SQLException {
        String sql = "DELETE FROM support_ticket WHERE id=?";
        try (Connection con = DBUtil.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        }
    }

    public List<SupportTicket> getAllByStatus(String status) throws SQLException {
        List<SupportTicket> list = new ArrayList<>();
        String sql = "SELECT * FROM support_ticket WHERE status=? ORDER BY created_at DESC";
        try (Connection con = DBUtil.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, status);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) list.add(extract(rs));
        }
        return list;
    }

    private SupportTicket extract(ResultSet rs) throws SQLException {
        SupportTicket t = new SupportTicket();
        t.setId(rs.getInt("id"));
        t.setCustomerId((Integer)rs.getObject("customerId"));
        t.setSubject(rs.getString("subject"));
        t.setMessage(rs.getString("message"));
        t.setStatus(rs.getString("status"));
        t.setCreatedAt(rs.getTimestamp("created_at"));
        t.setUpdatedAt(rs.getTimestamp("updated_at"));
        return t;
    }
} 