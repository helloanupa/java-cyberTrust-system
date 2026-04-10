<%@ page language="java" import="java.util.List,model.SupportTicket" %>
<%
    List<SupportTicket> tickets = (List<SupportTicket>) request.getAttribute("tickets");
%>
<html>
<head>
<title>Manage Support Tickets</title>
<style>
body { background: #f4f8fb; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
background-image: url("images/bank1.jpg"); }
.admin-container { background: #fff; max-width: 900px; margin: 40px auto; padding: 32px; border-radius: 12px; box-shadow: 0 4px 24px rgba(0,0,0,0.08); }
h2 { color: #1a237e; margin-bottom: 24px; }
table { width: 100%; border-collapse: collapse; }
th, td { padding: 10px; border-bottom: 1px solid #b0bec5; text-align: left; }
th { background: #e3eafc; color: #1a237e; }
tr:hover { background: #f1f7ff; }
.action-btn { margin-right: 8px; padding: 6px 16px; border-radius: 4px; font-weight: bold; border: none; cursor: pointer; }
.open { background: #43a047; color: #fff; }
.close { background: #d32f2f; color: #fff; }
.delete { background: #d32f2f; color: #fff; }
.error-message { background: #d32f2f; color: #fff; padding: 12px; border-radius: 4px; margin-bottom: 20px; }
</style>
</head>
<body>
<div class="admin-container">
<h2>Manage Support Tickets</h2>
<% if (request.getAttribute("error") != null) { %>
    <div class="error-message">
        <%= request.getAttribute("error") %>
    </div>
<% } %>
<table>
<tr>
    <th>ID</th><th>Customer ID</th><th>Subject</th><th>Message</th><th>Status</th><th>Action</th>
</tr>
<% if (tickets != null) for (SupportTicket t : tickets) { %>
<tr>
    <td><%= t.getId() %></td>
    <td><%= t.getCustomerId() %></td>
    <td><%= t.getSubject() %></td>
    <td><%= t.getMessage() %></td>
    <td><%= t.getStatus() %></td>
    <td>
        <% if ("Open".equalsIgnoreCase(t.getStatus())) { %>
        <form method="post" action="AdminSupportTicketServlet" style="display:inline;">
            <input type="hidden" name="action" value="close" />
            <input type="hidden" name="id" value="<%=t.getId()%>" />
            <button type="submit" class="action-btn close">Close</button>
        </form>
        <% } else { %>
        <form method="post" action="AdminSupportTicketServlet" style="display:inline;">
            <input type="hidden" name="action" value="open" />
            <input type="hidden" name="id" value="<%=t.getId()%>" />
            <button type="submit" class="action-btn open">Reopen</button>
        </form>
        <% } %>
        <form method="post" action="AdminSupportTicketServlet" style="display:inline;" onsubmit="return confirm('Are you sure you want to delete this ticket? This action cannot be undone.');">
            <input type="hidden" name="action" value="delete" />
            <input type="hidden" name="id" value="<%=t.getId()%>" />
            <button type="submit" class="action-btn delete">Delete</button>
        </form>
    </td>
</tr>
<% } %>
</table>
</div>
</body>
</html> 