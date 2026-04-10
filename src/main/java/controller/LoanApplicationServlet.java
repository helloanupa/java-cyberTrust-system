package controller;
import dao.LoanApplicationDAO;
import model.LoanApplication;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

public class LoanApplicationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private LoanApplicationDAO dao = new LoanApplicationDAO();

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        try {
            if ("view".equals(action)) {
                int id = Integer.parseInt(req.getParameter("id"));
                LoanApplication app = dao.getById(id);
                req.setAttribute("app", app);
                req.getRequestDispatcher("loan_application_view.jsp").forward(req, resp);
            } else if ("edit".equals(action)) {
                int id = Integer.parseInt(req.getParameter("id"));
                LoanApplication app = dao.getById(id);
                req.setAttribute("app", app);
                req.getRequestDispatcher("loan_application_update.jsp").forward(req, resp);
            } else {
                req.getRequestDispatcher("loan_application_form.jsp").forward(req, resp);
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        try {
            if ("create".equals(action)) {
                LoanApplication app = getAppFromRequest(req);
                int id = dao.create(app);
                req.setAttribute("id", id);
                req.getRequestDispatcher("loan_application_success.jsp").forward(req, resp);
            } else if ("update".equals(action)) {
                LoanApplication app = getAppFromRequest(req);
                app.setId(Integer.parseInt(req.getParameter("id")));
                dao.update(app);
                resp.sendRedirect("index.jsp");
            } else if ("delete".equals(action)) {
                int id = Integer.parseInt(req.getParameter("id"));
                dao.delete(id);
                req.getRequestDispatcher("loan_application_form.jsp").forward(req, resp);
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    private LoanApplication getAppFromRequest(HttpServletRequest req) throws Exception {
        LoanApplication app = new LoanApplication();
        app.setFname(req.getParameter("fname"));
        app.setLname(req.getParameter("lname"));
        app.setStatus(req.getParameter("status"));
        app.setDob(new SimpleDateFormat("yyyy-MM-dd").parse(req.getParameter("dob")));
        app.setGender(req.getParameter("gender"));
        app.setEmail(req.getParameter("email"));
        app.setMobile(req.getParameter("mobile"));
        app.setHome(req.getParameter("home"));
        app.setAddress(req.getParameter("address"));
        app.setProvince(req.getParameter("province"));
        app.setLoanType(req.getParameter("loanType"));
        app.setPurpose(req.getParameter("purpose"));
        app.setAmount(Double.parseDouble(req.getParameter("amount")));
        app.setTerm(Integer.parseInt(req.getParameter("term")));
        app.setJob(req.getParameter("job"));
        app.setSalary(Double.parseDouble(req.getParameter("salary")));
        app.setIncomeProof(req.getParameter("incomeProof"));
        app.setPastLoans(req.getParameter("pastLoans"));
        return app;
    }
} 