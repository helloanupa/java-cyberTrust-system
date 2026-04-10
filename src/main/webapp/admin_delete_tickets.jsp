<%@ page language="java" import="java.util.List,model.SupportTicket" %>
<%
    List<SupportTicket> tickets = (List<SupportTicket>) request.getAttribute("tickets");
%>
<html>
<head>
<title>Delete Support Tickets</title>
<style>
body { 
    background: #f4f8fb; 
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; 
    margin: 0;
    padding: 20px;
    background-image: url("images/bank1.jpg");
}
.admin-container { 
    background: #fff; 
    max-width: 1200px; 
    margin: 40px auto; 
    padding: 32px; 
    border-radius: 12px; 
    box-shadow: 0 4px 24px rgba(0,0,0,0.08); 
}
h2 { 
    color: #1a237e; 
    margin-bottom: 24px; 
    text-align: center;
}
table { 
    width: 100%; 
    border-collapse: collapse; 
    margin-top: 20px;
}
th, td { 
    padding: 12px; 
    border-bottom: 1px solid #b0bec5; 
    text-align: left; 
}
th { 
    background: #e3eafc; 
    color: #1a237e; 
    font-weight: bold;
}
tr:hover { 
    background: #f1f7ff; 
}
.delete-btn { 
    background: #d32f2f; 
    color: #fff; 
    padding: 8px 16px; 
    border-radius: 4px; 
    border: none; 
    cursor: pointer; 
    font-weight: bold;
}
.delete-btn:hover {
    background: #b71c1c;
}
.error-message { 
    background: #d32f2f; 
    color: #fff; 
    padding: 12px; 
    border-radius: 4px; 
    margin-bottom: 20px; 
    text-align: center;
}
.success-message {
    background: #43a047;
    color: #fff;
    padding: 12px;
    border-radius: 4px;
    margin-bottom: 20px;
    text-align: center;
}
.back-link {
    display: inline-block;
    margin-bottom: 20px;
    color: #1a237e;
    text-decoration: none;
    font-weight: bold;
}
.back-link:hover {
    text-decoration: underline;
}
</style>
</head>
<body>
<div class="admin-container">
    <a href="admin_dashboard.jsp" class="back-link">← Back to Dashboard</a>
    <h2>Delete Support Tickets</h2>
    
    <% if (request.getAttribute("error") != null) { %>
        <div class="error-message">
            <%= request.getAttribute("error") %>
        </div>
    <% } %>
    
    <% if (request.getAttribute("success") != null) { %>
        <div class="success-message">
            <%= request.getAttribute("success") %>
        </div>
    <% } %>

    <table>
        <tr>
            <th>ID</th>
            <th>Customer ID</th>
            <th>Subject</th>
            <th>Message</th>
            <th>Status</th>
            <th>Action</th>
        </tr>
        <% if (tickets != null) for (SupportTicket t : tickets) { %>
        <tr>
            <td><%= t.getId() %></td>
            <td><%= t.getCustomerId() %></td>
            <td><%= t.getSubject() %></td>
            <td><%= t.getMessage() %></td>
            <td><%= t.getStatus() %></td>
            <td>
                <form method="post" action="AdminDeleteTicketServlet" style="display:inline;" 
                      onsubmit="return confirm('Are you sure you want to delete this ticket? This action cannot be undone.');">
                    <input type="hidden" name="ticketId" value="<%=t.getId()%>" />
                    <button type="submit" class="delete-btn">Delete</button>
                </form>
            </td>
        </tr>
        <% } %>
    </table>
</div>
</body>
</html> 