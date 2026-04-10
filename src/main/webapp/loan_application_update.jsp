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
<title>Update Loan Application</title>
<style>
body {
    background: #f4f8fb;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background-image: url("images/bank1.jpg");
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
input, select, textarea {
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
</style>

<script>
function validateUpdateForm() {
    const form = document.forms[0];
    const namePattern = /^[a-zA-Z\s]{2,}$/;
    const emailPattern = /^[^\\s@]+@[^\\s@]+\\.[^\\s@]+$/;
    const mobilePattern = /^[0-9]{10}$/;
    const amount = parseFloat(form.amount.value);
    const salary = parseFloat(form.salary.value);
    const term = parseInt(form.term.value);
    const dob = new Date(form.dob.value);
    const today = new Date();
    const age = today.getFullYear() - dob.getFullYear();
    
    if (!namePattern.test(form.fname.value)) {
        alert("Please enter a valid first name (letters only, min 2 characters).");
        return false;
    }
    if (!namePattern.test(form.lname.value)) {
        alert("Please enter a valid last name (letters only, min 2 characters).");
        return false;
    }
    if (!emailPattern.test(form.email.value)) {
        alert("Please enter a valid email address.");
        return false;
    }
    if (!mobilePattern.test(form.mobile.value)) {
        alert("Please enter a valid 10-digit mobile number.");
        return false;
    }
    if (isNaN(amount) || amount <= 0) {
        alert("Please enter a valid positive loan amount.");
        return false;
    }
    if (isNaN(salary) || salary <= 0) {
        alert("Please enter a valid positive salary.");
        return false;
    }
    if (isNaN(term) || term < 6 || term > 360) {
        alert("Please enter a loan term between 6 and 360 months.");
        return false;
    }
    if (isNaN(dob.getTime()) || age < 18) {
        alert("Applicant must be at least 18 years old.");
        return false;
    }
    return true;
}
</script>
</head>

<body>
<div class="bank-container">
<h2>Update Loan Application</h2>
<form action="LoanApplicationServlet" method="post" onsubmit="return validateUpdateForm();">
    <input type="hidden" name="action" value="update"/>
    <input type="hidden" name="id" value="<%=app.getId()%>"/>
    
    First Name: <input name="fname" value="<%=app.getFname()%>" required/><br/>
    Last Name: <input name="lname" value="<%=app.getLname()%>" required/><br/>
    Status: <input name="status" value="<%=app.getStatus()%>" required/><br/>
    Date of Birth: 
    <input name="dob" type="date" value="<%=new java.text.SimpleDateFormat("yyyy-MM-dd").format(app.getDob())%>" required/><br/>
    
    Gender: 
    <select name="gender" required>
        <option value="">Select</option>
        <option<%=app.getGender().equals("Male")?" selected":""%>>Male</option>
        <option<%=app.getGender().equals("Female")?" selected":""%>>Female</option>
        <option<%=app.getGender().equals("Other")?" selected":""%>>Other</option>
    </select><br/>
    
    Email: <input name="email" type="email" value="<%=app.getEmail()%>" required/><br/>
    Mobile: <input name="mobile" value="<%=app.getMobile()%>" required/><br/>
    Home: <input name="home" value="<%=app.getHome()%>" required/><br/>
    Address: <textarea name="address" required><%=app.getAddress()%></textarea><br/>
    Province: <input name="province" value="<%=app.getProvince()%>" required/><br/>
    Loan Type: <input name="loanType" value="<%=app.getLoanType()%>" required/><br/>
    Purpose: <textarea name="purpose" required><%=app.getPurpose()%></textarea><br/>
    Amount: <input name="amount" type="number" step="0.01" value="<%=app.getAmount()%>" required/><br/>
    Term (months): <input name="term" type="number" value="<%=app.getTerm()%>" required/><br/>
    Job: <input name="job" value="<%=app.getJob()%>" required/><br/>
    Salary: <input name="salary" type="number" step="0.01" value="<%=app.getSalary()%>" required/><br/>
    Income Proof: <input name="incomeProof" value="<%=app.getIncomeProof()%>" required/><br/>
    Past Loans: <textarea name="pastLoans"><%=app.getPastLoans()%></textarea><br/>
    
    <input type="submit" value="Update Application"/>
</form>
</div>
</body>
</html>