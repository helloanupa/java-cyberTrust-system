<%@ page language="java" import="model.SupportTicket" %>
<%
    SupportTicket ticket = (SupportTicket) request.getAttribute("ticket");
    if (ticket == null) {
        out.println("<h2>No ticket found.</h2>");
        return;
    }
%>
<html>
<head>
<title>View Support Ticket</title>
<style>
body { background: #f4f8fb; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; 
 background-image: url("images/bank1.jpg");}
.bank-container { background: #fff; max-width: 500px; margin: 40px auto; padding: 32px 28px 24px 28px; border-radius: 12px; box-shadow: 0 4px 24px rgba(0,0,0,0.08); border-top: 6px solid #1a73e8; }
h2 { color: #1a237e; text-align: center; margin-bottom: 24px; }
.label { color: #1a237e; font-weight: bold; margin-right: 8px; }
.value { color: #333; }
.row { margin-bottom: 12px; }
.btns { display: flex; justify-content: flex-end; gap: 16px; margin-top: 32px; }
.btn { background: #1a73e8; color: #fff; border: none; padding: 12px 28px; border-radius: 6px; font-size: 15px; font-weight: bold; cursor: pointer; transition: background 0.2s; text-decoration: none; }
.btn:hover { background: #155ab6; }
.delete-btn { background: #d32f2f; }
.delete-btn:hover { background: #a31515; }
</style>
</head>
<body>
<div class="bank-container">
<h2>Support Ticket Details</h2>
<div class="row"><span class="label">Subject:</span> <span class="value"><%= ticket.getSubject() %></span></div>
<div class="row"><span class="label">Message:</span> <span class="value"><%= ticket.getMessage() %></span></div>
<div class="row"><span class="label">Status:</span> <span class="value"><%= ticket.getStatus() %></span></div>
<div class="row"><span class="label">Created:</span> <span class="value"><%= ticket.getCreatedAt() %></span></div>
<div class="row"><span class="label">Updated:</span> <span class="value"><%= ticket.getUpdatedAt() %></span></div>
<div class="btns">
    <a class="btn" href="SupportTicketServlet?action=edit&id=<%=ticket.getId()%>">Update Ticket</a>
    <form action="SupportTicketServlet" method="post" style="display:inline;">
        <input type="hidden" name="action" value="delete"/>
        <input type="hidden" name="id" value="<%=ticket.getId()%>"/>
        <button type="submit" class="btn delete-btn">Delete Ticket</button>
    </form>
</div>
</div>
</body>
</html> 