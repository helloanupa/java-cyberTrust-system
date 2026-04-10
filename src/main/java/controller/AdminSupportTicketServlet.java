package controller;

import dao.SupportTicketDAO;
import model.SupportTicket;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public class AdminSupportTicketServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private SupportTicketDAO ticketDAO;

    @Override
    public void init() throws ServletException {
        ticketDAO = new SupportTicketDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect("AdminLoginServlet");
            return;
        }
        try {
            List<SupportTicket> tickets = ticketDAO.getAll(null); // all tickets
            request.setAttribute("tickets", tickets);
            request.getRequestDispatcher("admin_tickets.jsp").forward(request, response);
        } catch (SQLException e) {
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("admin_tickets.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect("AdminLoginServlet");
            return;
        }
        try {
            int ticketId = Integer.parseInt(request.getParameter("id"));
            String action = request.getParameter("action");
            SupportTicket ticket = ticketDAO.getById(ticketId);
            if (ticket != null && action != null) {
                if ("close".equals(action)) {
                    ticket.setStatus("Closed");
                    ticketDAO.update(ticket);
                } else if ("open".equals(action)) {
                    ticket.setStatus("Open");
                    ticketDAO.update(ticket);
                } else if ("delete".equals(action)) {
                    ticketDAO.delete(ticketId);
                }
            }
            response.sendRedirect("AdminSupportTicketServlet");
        } catch (SQLException e) {
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("admin_tickets.jsp").forward(request, response);
        }
    }
} 