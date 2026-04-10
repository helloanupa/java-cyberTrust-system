package controller;

import dao.LoanApplicationDAO;
import model.LoanApplication;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public class AdminLoanServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private LoanApplicationDAO loanDAO;

    @Override
    public void init() throws ServletException {
        loanDAO = new LoanApplicationDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect("AdminLoginServlet");
            return;
        }
        try {
            List<LoanApplication> loans = loanDAO.getAll();
            request.setAttribute("loans", loans);
            request.getRequestDispatcher("admin_loans.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect("AdminLoginServlet");
            return;
        }
        String action = request.getParameter("action");
        try {
            if ("approve".equals(action)) {
                int loanId = Integer.parseInt(request.getParameter("id"));
                LoanApplication loan = loanDAO.getById(loanId);
                if (loan != null) {
                    loan.setStatus("Approved");
                    loanDAO.update(loan);
                }
            } else if ("reject".equals(action)) {
                int loanId = Integer.parseInt(request.getParameter("id"));
                LoanApplication loan = loanDAO.getById(loanId);
                if (loan != null) {
                    loan.setStatus("Rejected");
                    loanDAO.update(loan);
                }
            }
            response.sendRedirect("AdminLoanServlet");
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
} 