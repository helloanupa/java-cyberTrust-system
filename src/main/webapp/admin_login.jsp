<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>Admin Login</title>
<style>
body { background: #f4f8fb; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; 
background-image: url("images/bank1.jpg");}
.login-container { background: #fff; max-width: 400px; margin: 80px auto; padding: 32px 28px 24px 28px; border-radius: 12px; box-shadow: 0 4px 24px rgba(0,0,0,0.08); border-top: 6px solid #1a73e8; }
h2 { color: #1a237e; text-align: center; margin-bottom: 24px; }
input[type=text], input[type=password] { width: 100%; padding: 12px; margin: 8px 0 16px 0;
 border: 1px solid #b0bec5; border-radius: 6px; }
button { width: 100%; background: #1a73e8; color: #fff; padding: 12px; border: none; border-radius: 6px; font-size: 16px; font-weight: bold; cursor: pointer; transition: background 0.2s; }
button:hover { background: #155ab6; }
.error { color: #d32f2f; text-align: center; margin-bottom: 16px; }
</style>
</head>
<body>
<div class="login-container">
<h2>Admin Login</h2>
<% String error = (String) request.getAttribute("error"); if (error != null) { %>
<div class="error"><%= error %></div>
<% } %>
<form method="post" action="AdminLoginServlet">
    <input type="text" name="username" placeholder="Username" required />
    <input type="password" name="password" placeholder="Password" required />
    <button type="submit">Login</button>
</form>
</div>
</body>
</html> 