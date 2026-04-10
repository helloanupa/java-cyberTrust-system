package controller;

import dao.LoanApplicationDAO;
import model.LoanApplication;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class LoanManagementServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private LoanApplicationDAO loanDAO;

    @Override
    public void init() throws ServletException {
        loanDAO = new LoanApplicationDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String action = request.getParameter("action");

        try {
            if (session != null && session.getAttribute("admin") != null) {
                if ("view".equals(action)) {
                    // View specific loan application
                    int loanId = Integer.parseInt(request.getParameter("id"));
                    LoanApplication loan = loanDAO.getById(loanId);
                    if (loan != null) {
                        request.setAttribute("loan", loan);
                        request.getRequestDispatcher("admin_view_loan.jsp").forward(request, response);
                        return;
                    }
                }
                // Show all loan applications
                List<LoanApplication> loans = loanDAO.getAll();
                request.setAttribute("loans", loans);
                request.getRequestDispatcher("admin_loan_applications.jsp").forward(request, response);
            } else {
                response.sendRedirect("AdminLoginServlet");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String action = request.getParameter("action");

        try {
            if (session != null && session.getAttribute("admin") != null) {
                if ("updateStatus".equals(action)) {
                    int loanId = Integer.parseInt(request.getParameter("id"));
                    String status = request.getParameter("status");
                    String adminComment = request.getParameter("adminComment");
                    
                    try {
                        if (loanDAO.updateStatus(loanId, status, adminComment)) {
                            response.sendRedirect("LoanManagementServlet?success=true");
                        } else {
                            response.sendRedirect("LoanManagementServlet?error=true");
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                        response.sendRedirect("LoanManagementServlet?error=true");
                    }
                } else if ("delete".equals(action)) {
                    int loanId = Integer.parseInt(request.getParameter("id"));
                    if (loanDAO.delete(loanId)) {
                        response.sendRedirect("admin_dashboard.jsp");
                    } else {
                        response.sendRedirect("LoanManagementServlet?error=true");
                    }
                }
            } else {
                response.sendRedirect("AdminLoginServlet");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
} 