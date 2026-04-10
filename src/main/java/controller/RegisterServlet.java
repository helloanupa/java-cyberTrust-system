package controller;
import dao.CustomerDAO;
import model.Customer;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Forward to register.jsp for GET requests
        req.getRequestDispatcher("register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Customer c = new Customer();
        c.setUsername(req.getParameter("username"));
        c.setEmail(req.getParameter("email"));
        c.setPassword(req.getParameter("password"));
        c.setPhone(req.getParameter("phone"));
        c.setNic(req.getParameter("nic"));
        c.setCountry(req.getParameter("country"));

        try {
            if (new CustomerDAO().register(c)) {
                resp.sendRedirect("login.jsp");
            } else {
                req.setAttribute("error", "Registration failed!");
                req.getRequestDispatcher("register.jsp").forward(req, resp);
            }
        } catch (Exception e) {
            req.setAttribute("error", e.getMessage());
            req.getRequestDispatcher("register.jsp").forward(req, resp);
        }
    }
} 

