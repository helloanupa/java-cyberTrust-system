package controller;
import dao.CustomerDAO;
import model.Customer;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        try {
            Customer c = new CustomerDAO().login(username, password);
            if (c != null) {
                HttpSession session = req.getSession();
                session.setAttribute("customer", c);
                session.setAttribute("customerId", c.getCustomerId());
                resp.sendRedirect("index.jsp");
            } else {
                req.setAttribute("error", "Invalid credentials!");
                req.getRequestDispatcher("login.jsp").forward(req, resp);
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
} 