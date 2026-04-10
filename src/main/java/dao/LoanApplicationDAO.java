package dao;
import model.LoanApplication;
import util.DBUtil;
import java.sql.*;
import java.util.*;

public class LoanApplicationDAO {
    public int create(LoanApplication app) throws SQLException {
        String sql = "INSERT INTO loan_application (fname, lname, status, dob, gender, email, mobile, home, address, province, loanType, purpose, amount, term, job, salary, incomeProof, pastLoans) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection con = DBUtil.getConnection(); PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setString(1, app.getFname());
            ps.setString(2, app.getLname());
            ps.setString(3, app.getStatus());
            ps.setDate(4, new java.sql.Date(app.getDob().getTime()));
            ps.setString(5, app.getGender());
            ps.setString(6, app.getEmail());
            ps.setString(7, app.getMobile());
            ps.setString(8, app.getHome());
            ps.setString(9, app.getAddress());
            ps.setString(10, app.getProvince());
            ps.setString(11, app.getLoanType());
            ps.setString(12, app.getPurpose());
            ps.setDouble(13, app.getAmount());
            ps.setInt(14, app.getTerm());
            ps.setString(15, app.getJob());
            ps.setDouble(16, app.getSalary());
            ps.setString(17, app.getIncomeProof());
            ps.setString(18, app.getPastLoans());
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) return rs.getInt(1);
        }
        return -1;
    }

    public LoanApplication getById(int id) throws SQLException {
        String sql = "SELECT * FROM loan_application WHERE id=?";
        try (Connection con = DBUtil.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return extract(rs);
        }
        return null;
    }

    public boolean update(LoanApplication app) throws SQLException {
        String sql = "UPDATE loan_application SET fname=?, lname=?, status=?, dob=?, gender=?, email=?, mobile=?, home=?, address=?, province=?, loanType=?, purpose=?, amount=?, term=?, job=?, salary=?, incomeProof=?, pastLoans=? WHERE id=?";
        try (Connection con = DBUtil.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, app.getFname());
            ps.setString(2, app.getLname());
            ps.setString(3, app.getStatus());
            ps.setDate(4, new java.sql.Date(app.getDob().getTime()));
            ps.setString(5, app.getGender());
            ps.setString(6, app.getEmail());
            ps.setString(7, app.getMobile());
            ps.setString(8, app.getHome());
            ps.setString(9, app.getAddress());
            ps.setString(10, app.getProvince());
            ps.setString(11, app.getLoanType());
            ps.setString(12, app.getPurpose());
            ps.setDouble(13, app.getAmount());
            ps.setInt(14, app.getTerm());
            ps.setString(15, app.getJob());
            ps.setDouble(16, app.getSalary());
            ps.setString(17, app.getIncomeProof());
            ps.setString(18, app.getPastLoans());
            ps.setInt(19, app.getId());
            return ps.executeUpdate() > 0;
        }
    }

    public boolean delete(int id) throws SQLException {
        String sql = "DELETE FROM loan_application WHERE id=?";
        try (Connection con = DBUtil.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        }
    }

    public List<LoanApplication> getAllByEmail(String email) throws SQLException {
        List<LoanApplication> list = new ArrayList<>();
        String sql = "SELECT * FROM loan_application WHERE email=? ORDER BY id DESC";
        try (Connection con = DBUtil.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) list.add(extract(rs));
        }
        return list;
    }

    public List<LoanApplication> getAll() throws SQLException {
        List<LoanApplication> list = new ArrayList<>();
        String sql = "SELECT * FROM loan_application ORDER BY id DESC";
        try (Connection con = DBUtil.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) list.add(extract(rs));
        }
        return list;
    }

    public List<LoanApplication> getAllByStatus(String status) throws SQLException {
        List<LoanApplication> list = new ArrayList<>();
        String sql = "SELECT * FROM loan_application WHERE status=? ORDER BY id DESC";
        try (Connection con = DBUtil.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, status);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) list.add(extract(rs));
        }
        return list;
    }

    public boolean updateStatus(int id, String status, String adminComment) throws SQLException {
        String sql = "UPDATE loan_application SET status=?, adminComment=? WHERE id=?";
        try (Connection con = DBUtil.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, status);
            ps.setString(2, adminComment);
            ps.setInt(3, id);
            return ps.executeUpdate() > 0;
        }
    }

    private LoanApplication extract(ResultSet rs) throws SQLException {
        LoanApplication app = new LoanApplication();
        app.setId(rs.getInt("id"));
        app.setFname(rs.getString("fname"));
        app.setLname(rs.getString("lname"));
        app.setStatus(rs.getString("status"));
        app.setDob(rs.getDate("dob"));
        app.setGender(rs.getString("gender"));
        app.setEmail(rs.getString("email"));
        app.setMobile(rs.getString("mobile"));
        app.setHome(rs.getString("home"));
        app.setAddress(rs.getString("address"));
        app.setProvince(rs.getString("province"));
        app.setLoanType(rs.getString("loanType"));
        app.setPurpose(rs.getString("purpose"));
        app.setAmount(rs.getDouble("amount"));
        app.setTerm(rs.getInt("term"));
        app.setJob(rs.getString("job"));
        app.setSalary(rs.getDouble("salary"));
        app.setIncomeProof(rs.getString("incomeProof"));
        app.setPastLoans(rs.getString("pastLoans"));
        return app;
    }
} 