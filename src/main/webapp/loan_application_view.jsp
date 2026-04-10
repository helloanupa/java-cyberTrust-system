<%@ page language="java" import="model.LoanApplication" %>
<%
    LoanApplication app = (LoanApplication) request.getAttribute("app");
    if (app == null) {
        out.println("<h2>No application found.</h2>");
        return;
    }
%>
<html>
<head>
<title>View Loan Application</title>
<style>
body { background: #f4f8fb; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
 background-image: url("images/bank1.jpg"); }
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
<h2>Loan Application Details</h2>
<div class="row"><span class="label">First Name:</span> <span class="value"><%= app.getFname() %></span></div>
<div class="row"><span class="label">Last Name:</span> <span class="value"><%= app.getLname() %></span></div>
<div class="row"><span class="label">Status:</span> <span class="value"><%= app.getStatus() %></span></div>
<div class="row"><span class="label">Date of Birth:</span> <span class="value"><%= app.getDob() %></span></div>
<div class="row"><span class="label">Gender:</span> <span class="value"><%= app.getGender() %></span></div>
<div class="row"><span class="label">Email:</span> <span class="value"><%= app.getEmail() %></span></div>
<div class="row"><span class="label">Mobile:</span> <span class="value"><%= app.getMobile() %></span></div>
<div class="row"><span class="label">Home:</span> <span class="value"><%= app.getHome() %></span></div>
<div class="row"><span class="label">Address:</span> <span class="value"><%= app.getAddress() %></span></div>
<div class="row"><span class="label">Province:</span> <span class="value"><%= app.getProvince() %></span></div>
<div class="row"><span class="label">Loan Type:</span> <span class="value"><%= app.getLoanType() %></span></div>
<div class="row"><span class="label">Purpose:</span> <span class="value"><%= app.getPurpose() %></span></div>
<div class="row"><span class="label">Amount:</span> <span class="value"><%= app.getAmount() %></span></div>
<div class="row"><span class="label">Term:</span> <span class="value"><%= app.getTerm() %></span></div>
<div class="row"><span class="label">Job:</span> <span class="value"><%= app.getJob() %></span></div>
<div class="row"><span class="label">Salary:</span> <span class="value"><%= app.getSalary() %></span></div>
<div class="row"><span class="label">Income Proof:</span> <span class="value"><%= app.getIncomeProof() %></span></div>
<div class="row"><span class="label">Past Loans:</span> <span class="value"><%= app.getPastLoans() %></span></div>
<div class="btns">
    <a class="btn" href="LoanApplicationServlet?action=edit&id=<%=app.getId()%>">Update Loan Application</a>
    <form action="LoanApplicationServlet" method="post" style="display:inline;">
        <input type="hidden" name="action" value="delete"/>
        <input type="hidden" name="id" value="<%=app.getId()%>"/>
        <button type="submit" class="btn delete-btn">Delete Application</button>
    </form>
</div>
</div>
</body>
</html> 