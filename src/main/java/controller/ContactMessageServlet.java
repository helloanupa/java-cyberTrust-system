package controller;

import dao.ContactMessageDAO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;
import java.util.List;

public class ContactMessageServlet extends HttpServlet {
    private ContactMessageDAO dao;

    @Override
    public void init() throws ServletException {
        dao = new ContactMessageDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        try {
            if ("create".equals(action)) {
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String subject = request.getParameter("subject");
                String message = request.getParameter("message");
                
                if (name == null || email == null || subject == null || message == null ||
                    name.trim().isEmpty() || email.trim().isEmpty() || subject.trim().isEmpty() || message.trim().isEmpty()) {
                    request.setAttribute("error", "All fields are required");
                    request.getRequestDispatcher("contact.jsp").forward(request, response);
                    return;
                }
                
                int messageId = dao.create(name, email, subject, message);
                if (messageId > 0) {
                    response.sendRedirect("contact_submit.jsp?success=created&id=" + messageId);
                } else {
                    request.setAttribute("error", "Failed to save message. Please try again.");
                    request.getRequestDispatcher("contact.jsp").forward(request, response);
                }
            } else if ("delete".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                if (dao.delete(id)) {
                    response.sendRedirect("ContactMessageServlet?action=admin");
                } else {
                    request.setAttribute("error", "Failed to delete message. Please try again.");
                    request.getRequestDispatcher("admin_messages.jsp").forward(request, response);
                }
            } else if ("update".equals(action)) {
                String idStr = request.getParameter("id");
                if (idStr == null || idStr.trim().isEmpty()) {
                    request.setAttribute("error", "Message ID is required for update.");
                    request.getRequestDispatcher("contact_submit.jsp").forward(request, response);
                    return;
                }
                
                try {
                    int id = Integer.parseInt(idStr);
                    String name = request.getParameter("name");
                    String email = request.getParameter("email");
                    String subject = request.getParameter("subject");
                    String message = request.getParameter("message");
                    
                    if (name == null || email == null || subject == null || message == null ||
                        name.trim().isEmpty() || email.trim().isEmpty() || subject.trim().isEmpty() || message.trim().isEmpty()) {
                        request.setAttribute("error", "All fields are required");
                        request.getRequestDispatcher("contact_submit.jsp").forward(request, response);
                        return;
                    }
                    
                    if (dao.update(id, name, email, subject, message)) {
                        response.sendRedirect("contact_submit.jsp?success=updated&id=" + id);
                    } else {
                        request.setAttribute("error", "Failed to update message. Please try again.");
                        request.getRequestDispatcher("contact_submit.jsp").forward(request, response);
                    }
                } catch (NumberFormatException e) {
                    request.setAttribute("error", "Invalid message ID format.");
                    request.getRequestDispatcher("contact_submit.jsp").forward(request, response);
                }
            }
        } catch (Exception e) {
            request.setAttribute("error", "An error occurred: " + e.getMessage());
            request.getRequestDispatcher("contact.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        try {
            if ("admin".equals(action)) {
                List<Map<String, String>> messages = dao.getAll();
                request.setAttribute("messages", messages);
                request.getRequestDispatcher("admin_messages.jsp").forward(request, response);
            } else if (request.getParameter("id") != null) {
                int id = Integer.parseInt(request.getParameter("id"));
                Map<String, String> message = dao.getById(id);
                if (message != null) {
                    request.setAttribute("message", message);
                }
                request.getRequestDispatcher("contact_submit.jsp").forward(request, response);
                return;
            }
        } catch (Exception e) {
            request.setAttribute("error", "An error occurred: " + e.getMessage());
            request.getRequestDispatcher("contact.jsp").forward(request, response);
        }
    }
} 