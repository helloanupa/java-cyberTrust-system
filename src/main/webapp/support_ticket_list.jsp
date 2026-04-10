<%-- noinspection unchecked --%>
<%@ page language="java" import="java.util.List,model.SupportTicket" %>
<%
    List<SupportTicket> tickets = (List<SupportTicket>) request.getAttribute("tickets");
%>
<html>
<head>
<title>My Support Tickets</title>
<style>
body { background: #f4f8fb; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; 
 background-image: url("images/bank1.jpg");}
.bank-container { background: #fff; max-width: 700px; margin: 40px auto; padding: 32px 28px 24px 28px; border-radius: 12px; box-shadow: 0 4px 24px rgba(0,0,0,0.08); border-top: 6px solid #1a73e8; }
h2 { color: #1a237e; text-align: center; margin-bottom: 24px; }
table { width: 100%; border-collapse: collapse; margin-bottom: 24px; }
th, td { padding: 10px; border-bottom: 1px solid #b0bec5; text-align: left; }
th { background: #e3eafc; color: #1a237e; }
tr:hover { background: #f1f7ff; }
.create-btn { background: #1a73e8; color: #fff; border: none; padding: 10px 24px; border-radius: 6px; font-size: 15px; font-weight: bold; cursor: pointer; transition: background 0.2s; text-decoration: none; float: right; }
.create-btn:hover { background: #155ab6; }
</style>
</head>
<body>
<div class="bank-container">
<h2>My Support Tickets</h2>

<table>
<tr><th>ID</th><th>Subject</th><th>Status</th><th>Created</th><th>Action</th></tr>
<% if (tickets != null && !tickets.isEmpty()) {
    for (SupportTicket t : tickets) { %>
<tr>
    <td><%= t.getId() %></td>
    <td><%= t.getSubject() %></td>
    <td><%= t.getStatus() %></td>
    <td><%= t.getCreatedAt() %></td>
    <td><a href="SupportTicketServlet?action=edit&id=<%=t.getId()%>" class="text-blue-700 hover:underline">View</a></td>
</tr>
<%  } 
} else { %>
<tr><td colspan="5" style="text-align:center;">No tickets found.</td></tr>
<% } %>
</table>
</div>
</body>
</html> 