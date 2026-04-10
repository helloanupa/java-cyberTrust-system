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
<title>Update Support Ticket</title>
<style>
body {
    background: #f4f8fb;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background-image: url("images/bank1.jpg");
    background-size: cover;
    background-repeat: no-repeat;
}
.bank-container {
    background: #fff;
    max-width: 500px;
    margin: 40px auto;
    padding: 32px 28px 24px 28px;
    border-radius: 12px;
    box-shadow: 0 4px 24px rgba(0,0,0,0.08);
    border-top: 6px solid #1a73e8;
}
h2 {
    color: #1a237e;
    text-align: center;
    margin-bottom: 24px;
}
input, textarea, select {
    width: 100%;
    padding: 10px;
    margin: 8px 0 16px 0;
    border: 1px solid #b0bec5;
    border-radius: 6px;
    box-sizing: border-box;
    font-size: 15px;
}
input[type="submit"] {
    background: #1a73e8;
    color: #fff;
    border: none;
    font-size: 16px;
    font-weight: bold;
    cursor: pointer;
    transition: background 0.2s;
}
input[type="submit"]:hover {
    background: #155ab6;
}
.error {
    color: #d32f2f;
    text-align: center;
    margin-bottom: 12px;
}
</style>

<script>
function validateUpdateForm() {
    const subject = document.forms["updateForm"]["subject"].value.trim();
    const message = document.forms["updateForm"]["message"].value.trim();

    if (subject.length < 5) {
        alert("Subject must be at least 5 characters long.");
        return false;
    }

    if (message.length < 10) {
        alert("Message must be at least 10 characters long.");
        return false;
    }

    return true;
}
</script>
</head>

<body>
<div class="bank-container">
<h2>Update Support Ticket</h2>
<form name="updateForm" action="SupportTicketServlet" method="post" onsubmit="return validateUpdateForm();">
    <input type="hidden" name="action" value="update"/>
    <input type="hidden" name="id" value="<%= ticket.getId() %>"/>
    
    Subject: <input name="subject" value="<%= ticket.getSubject() %>" required/><br/>
    Message: <textarea name="message" required><%= ticket.getMessage() %></textarea><br/>
    
    <input type="submit" value="Update Ticket"/>
</form>
</div>
</body>
</html>