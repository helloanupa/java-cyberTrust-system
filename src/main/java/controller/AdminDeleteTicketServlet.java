package controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.SupportTicket;
import dao.SupportTicketDAO;

public class AdminDeleteTicketServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private SupportTicketDAO ticketDAO;

    public void init() {
        ticketDAO = new SupportTicketDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Check if user is logged in as admin
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect("AdminLoginServlet");
            return;
        }

        try {
            List<SupportTicket> tickets = ticketDAO.getAll(null);
            request.setAttribute("tickets", tickets);
            request.getRequestDispatcher("admin_delete_tickets.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", "Error loading tickets: " + e.getMessage());
            request.getRequestDispatcher("admin_delete_tickets.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Check if user is logged in as admin
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect("AdminLoginServlet");
            return;
        }

        try {
            int ticketId = Integer.parseInt(request.getParameter("ticketId"));
            boolean deleted = ticketDAO.delete(ticketId);
            
            if (deleted) {
                request.setAttribute("success", "Ticket deleted successfully");
            } else {
                request.setAttribute("error", "Failed to delete ticket. Ticket may not exist.");
            }
            
            // Refresh the ticket list
            List<SupportTicket> tickets = ticketDAO.getAll(null);
            request.setAttribute("tickets", tickets);
            request.getRequestDispatcher("admin_delete_tickets.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", "Error deleting ticket: " + e.getMessage());
            request.getRequestDispatcher("admin_delete_tickets.jsp").forward(request, response);
        }
    }
} 