<%@ page language="java" %>
<html>
<head>
<title>Application Submitted</title>
<style>
body { background: #f4f8fb; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; 
 background-image: url("images/bank1.jpg");}
.bank-container { background: #fff; max-width: 400px; margin: 80px auto; padding: 32px 28px 24px 28px; border-radius: 12px; box-shadow: 0 4px 24px rgba(0,0,0,0.08); border-top: 6px solid #1a73e8; text-align: center; }
h2 { color: #1a237e; margin-bottom: 24px; }
.btn-group { display: flex; justify-content: center; gap: 24px; margin-top: 32px; }
.action-btn { min-width: 150px; padding: 14px 0; border: none; border-radius: 6px; font-size: 16px; font-weight: bold; cursor: pointer; transition: background 0.2s, box-shadow 0.2s; box-shadow: 0 2px 8px rgba(26,115,232,0.08); text-decoration: none; display: inline-block; }
.action-btn.view { background: #1a73e8; color: #fff; }
.action-btn.view:hover { background: #155ab6; }
.action-btn.home { background: #43a047; color: #fff; }
.action-btn.home:hover { background: #357a38; }
</style>
</head>
<body>
<div class="bank-container">
<h2>Your Loan Application is Submitted!</h2>
<p>Thank you for applying. We will review your application soon.</p>
<div class="btn-group">
<% int id = (request.getAttribute("id") != null) ? (Integer)request.getAttribute("id") : -1; %>
<a class="action-btn view" href="LoanApplicationServlet?action=view&id=<%=id%>">View Application</a>
<a class="action-btn home" href="index.jsp" style="margin-left:50px;">Go Home</a>
</div>
</div>
</body>
</html> 