<%@ page language="java" import="java.util.List,model.LoanApplication" %>
<%
    List<LoanApplication> loans = (List<LoanApplication>) request.getAttribute("loans");
%>
<html>
<head>
<title>Manage Loan Applications</title>
<style>
body { background: #f4f8fb; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; 
background-image: url("images/bank1.jpg");}
.admin-container { background: #fff; max-width: 900px; margin: 40px auto; padding: 32px; border-radius: 12px; box-shadow: 0 4px 24px rgba(0,0,0,0.08); }
h2 { color: #1a237e; margin-bottom: 24px; }
table { width: 100%; border-collapse: collapse; }
th, td { padding: 10px; border-bottom: 1px solid #b0bec5; text-align: left; }
th { background: #e3eafc; color: #1a237e; }
tr:hover { background: #f1f7ff; }
.action-btn { margin-right: 8px; padding: 6px 16px; border-radius: 4px; font-weight: bold; border: none; cursor: pointer; }
.approve { background: #43a047; color: #fff; }
.reject { background: #d32f2f; color: #fff; }
.delete { background: #757575; color: #fff; }
</style>
</head>
<body>
<div class="admin-container">
<h2>Manage Loan Applications</h2>
<table>
<tr>
    <th>ID</th><th>Name</th><th>Email</th><th>Status</th><th>Amount</th><th>Action</th>
</tr>
<% if (loans != null) for (LoanApplication loan : loans) { %>
<tr>
    <td><%= loan.getId() %></td>
    <td><%= loan.getFname() %> <%= loan.getLname() %></td>
    <td><%= loan.getEmail() %></td>
    <td><%= loan.getStatus() %></td>
    <td><%= loan.getAmount() %></td>
    <td>
        <% if ("Pending".equalsIgnoreCase(loan.getStatus().trim())) { %>
        <form method="post" action="AdminLoanServlet" style="display:inline;">
            <input type="hidden" name="action" value="approve" />
            <input type="hidden" name="id" value="<%=loan.getId()%>" />
            <button type="submit" class="action-btn approve">Approve</button>
        </form>
        <form method="post" action="AdminLoanServlet" style="display:inline;">
            <input type="hidden" name="action" value="reject" />
            <input type="hidden" name="id" value="<%=loan.getId()%>" />
            <button type="submit" class="action-btn reject" style="background:#d32f2f;">Reject</button>
        </form>
        <% } else if ("Approved".equalsIgnoreCase(loan.getStatus().trim())) { %>
        <span style="color: #43a047; font-weight: bold;">Approved</span>
        <% } else if ("Rejected".equalsIgnoreCase(loan.getStatus().trim())) { %>
        <span style="color: #d32f2f; font-weight: bold;">Rejected</span>
        <% } %>
    </td>
</tr>
<% } %>
</table>
</div>
</body>
</html> 