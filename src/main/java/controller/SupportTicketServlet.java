package controller;
import dao.SupportTicketDAO;
import model.SupportTicket;
import model.Customer;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.text.SimpleDateFormat;

public class SupportTicketServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private SupportTicketDAO dao = new SupportTicketDAO();

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        HttpSession session = req.getSession(false);
        Integer customerId = null;
        if (session != null && session.getAttribute("customer") != null) {
            customerId = ((Customer)session.getAttribute("customer")).getCustomerId();
        }
        try {
            if ("view".equals(action)) {
                int id = Integer.parseInt(req.getParameter("id"));
                SupportTicket ticket = dao.getById(id);
                req.setAttribute("ticket", ticket);
                req.getRequestDispatcher("support_ticket_view.jsp").forward(req, resp);
            } else if ("edit".equals(action)) {
                int id = Integer.parseInt(req.getParameter("id"));
                SupportTicket ticket = dao.getById(id);
                req.setAttribute("ticket", ticket);
                req.getRequestDispatcher("support_ticket_update.jsp").forward(req, resp);
            } else {
                List<SupportTicket> tickets = dao.getAll(customerId);
                req.setAttribute("tickets", tickets);
                req.getRequestDispatcher("support_ticket_list.jsp").forward(req, resp);
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        HttpSession session = req.getSession(false);
        Integer customerId = null;
        if (session != null && session.getAttribute("customer") != null) {
            customerId = ((Customer)session.getAttribute("customer")).getCustomerId();
        }
        try {
            if ("create".equals(action)) {
                SupportTicket ticket = getTicketFromRequest(req);
                ticket.setCustomerId(customerId);
                ticket.setStatus("Open");
                dao.create(ticket);
                resp.sendRedirect("ProfileServlet");
            } else if ("update".equals(action)) {
                SupportTicket ticket = getTicketFromRequest(req);
                ticket.setId(Integer.parseInt(req.getParameter("id")));
                dao.update(ticket);
                resp.sendRedirect("ProfileServlet");
            } else if ("delete".equals(action)) {
                int id = Integer.parseInt(req.getParameter("id"));
                dao.delete(id);
                resp.sendRedirect("ProfileServlet");
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    private SupportTicket getTicketFromRequest(HttpServletRequest req) throws Exception {
        SupportTicket t = new SupportTicket();
        t.setSubject(req.getParameter("subject"));
        t.setMessage(req.getParameter("message"));
        t.setStatus(req.getParameter("status") != null ? req.getParameter("status") : "Open");
        return t;
    }
} 