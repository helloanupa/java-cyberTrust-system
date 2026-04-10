<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<html>
<head>
<title>Submit Support Ticket</title>
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
input, textarea {
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
function validateSupportForm() {
    const subject = document.forms["supportForm"]["subject"].value.trim();
    const message = document.forms["supportForm"]["message"].value.trim();

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
<h2>Submit Support Ticket</h2>
<form name="supportForm" action="SupportTicketServlet" method="post" onsubmit="return validateSupportForm();">
    <input type="hidden" name="action" value="create"/>
    Subject: <input name="subject" required/><br/>
    Message: <textarea name="message" rows="5" required></textarea><br/>
    <input type="submit" value="Submit Ticket"/>
</form>
<% if (request.getAttribute("error") != null) { %>
    <div class="error"><%= request.getAttribute("error") %></div>
<% } %>
</div>
</body>
</html>