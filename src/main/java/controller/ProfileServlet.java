package controller;
import dao.LoanApplicationDAO;
import dao.SupportTicketDAO;
import dao.CustomerDAO;
import model.Customer;
import model.LoanApplication;
import model.SupportTicket;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class ProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private SupportTicketDAO ticketDAO = new SupportTicketDAO();
    private CustomerDAO customerDAO = new CustomerDAO();

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("customer") == null) {
            resp.sendRedirect("login.jsp");
            return;
        }
        Customer c = (Customer) session.getAttribute("customer");
        try {
            List<LoanApplication> myLoans = new LoanApplicationDAO().getAllByEmail(c.getEmail());
            List<SupportTicket> myTickets = new SupportTicketDAO().getAll(c.getCustomerId());
            req.setAttribute("myLoans", myLoans);
            req.setAttribute("myTickets", myTickets);
        } catch (Exception e) {
            req.setAttribute("error", e.getMessage());
        }
        req.getRequestDispatcher("profile.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("customer") == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        String action = req.getParameter("action");
        if (action != null) {
            try {
                if ("update".equals(action)) {
                    // Get the current customer from session
                    Customer currentCustomer = (Customer) session.getAttribute("customer");
                    
                    // Update customer details
                    currentCustomer.setUsername(req.getParameter("username"));
                    currentCustomer.setEmail(req.getParameter("email"));
                    currentCustomer.setPhone(req.getParameter("phone"));
                    currentCustomer.setNic(req.getParameter("nic"));
                    currentCustomer.setCountry(req.getParameter("country"));
                    
                    // Update in database
                    customerDAO.update(currentCustomer);
                    
                    // Update session
                    session.setAttribute("customer", currentCustomer);
                    
                    // Set success message
                    req.setAttribute("success", "Profile updated successfully!");
                } else if ("delete_profile".equals(action)) {
                    // Get the current customer from session
                    Customer currentCustomer = (Customer) session.getAttribute("customer");
                    
                    // Delete from database
                    if (customerDAO.delete(currentCustomer.getCustomerId())) {
                        // Invalidate session
                        session.invalidate();
                        // Redirect to login page
                        resp.sendRedirect("register.jsp");
                        return;
                    } else {
                        req.setAttribute("error", "Failed to delete profile. Please try again.");
                    }
                } else if ("update_ticket".equals(action)) {
                    int ticketId = Integer.parseInt(req.getParameter("id"));
                    String status = req.getParameter("status");
                    SupportTicket ticket = ticketDAO.getById(ticketId);
                    if (ticket != null) {
                        ticket.setStatus(status);
                        ticketDAO.update(ticket);
                    }
                } else if ("delete_ticket".equals(action)) {
                    int ticketId = Integer.parseInt(req.getParameter("id"));
                    ticketDAO.delete(ticketId);
                }
            } catch (Exception e) {
                req.setAttribute("error", e.getMessage());
            }
        }
        
        // Refresh the page with updated data
        doGet(req, resp);
    }
} 