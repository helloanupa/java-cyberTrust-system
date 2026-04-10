<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<html>
<head>
<title>Register</title>
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
    max-width: 400px;
    margin: 60px auto;
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
input[type="text"], input[type="email"], input[type="password"] {
    width: 100%;
    padding: 10px;
    margin: 8px 0 16px 0;
    border: 1px solid #b0bec5;
    border-radius: 6px;
    box-sizing: border-box;
    font-size: 15px;
}
input[type="submit"] {
    width: 100%;
    background: #1a73e8;
    color: #fff;
    border: none;
    padding: 12px;
    border-radius: 6px;
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
a {
    display: block;
    text-align: center;
    margin-top: 18px;
    color: #1a73e8;
    text-decoration: none;
}
a:hover {
    text-decoration: underline;
}
</style>

<script>
function validateRegisterForm() {
    const username = document.forms["registerForm"]["username"].value.trim();
    const email = document.forms["registerForm"]["email"].value.trim();
    const password = document.forms["registerForm"]["password"].value.trim();
    const phone = document.forms["registerForm"]["phone"].value.trim();
    const nic = document.forms["registerForm"]["nic"].value.trim();
    const country = document.forms["registerForm"]["country"].value.trim();

    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    const phoneRegex = /^[0-9]{10}$/;
    const nicRegex = /^[0-9]{9}[vVxX]$/;

    if (username.length < 3) {
        alert("Username must be at least 3 characters long.");
        return false;
    }

    if (!emailRegex.test(email)) {
        alert("Enter a valid email address.");
        return false;
    }

    if (password.length < 6) {
        alert("Password must be at least 6 characters long.");
        return false;
    }

    if (!phoneRegex.test(phone)) {
        alert("Enter a valid 10-digit phone number.");
        return false;
    }

    if (!nicRegex.test(nic)) {
        alert("Enter a valid NIC (e.g., 123456789V).");
        return false;
    }

    if (country.length < 2) {
        alert("Country must be at least 2 characters long.");
        return false;
    }

    return true;
}
</script>
</head>

<body>
<div class="bank-container">
    <h2>Bank Registration</h2>
    <form name="registerForm" action="RegisterServlet" method="post" onsubmit="return validateRegisterForm();">
        Username: <input name="username" type="text" required/><br/>
        Email: <input name="email" type="email" required/><br/>
        Password: <input type="password" name="password" required/><br/>
        Phone: <input name="phone" type="text" required/><br/>
        NIC: <input name="nic" type="text" required/><br/>
        Country: <input name="country" type="text" required/><br/>
        <input type="submit" value="Register"/>
    </form>

    <% if (request.getAttribute("error") != null) { %>
        <div class="error"><%= request.getAttribute("error") %></div>
    <% } %>

    <a href="login.jsp">Already have an account? Login</a>
</div>
</body>
</html>