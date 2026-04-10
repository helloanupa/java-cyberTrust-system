<%@ page language="java" %>
<html>
<head>
<title>Loan Application</title>
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
function validateLoanForm() {
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
        alert("Please enter a valid first name (min 2 letters).");
        return false;
    }
    if (!namePattern.test(form.lname.value)) {
        alert("Please enter a valid last name (min 2 letters).");
        return false;
    }
    if (!mobilePattern.test(form.mobile.value)) {
        alert("Please enter a valid 10-digit mobile number.");
        return false;
    }
    if (isNaN(amount) || amount <= 100) {
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
<h2>Loan Application</h2>
<form action="LoanApplicationServlet" method="post" onsubmit="return validateLoanForm();">
    <input type="hidden" name="action" value="create"/>
    First Name: <input name="fname" required/><br/>
    Last Name: <input name="lname" required/><br/>
    Status: <input name="status" required/><br/>
    Date of Birth: <input name="dob" type="date" required/><br/>
    Gender: 
    <select name="gender" required>
        <option value="">Select</option>
        <option>Male</option>
        <option>Female</option>
        <option>Other</option>
    </select><br/>
    Email: <input name="email" type="email" required/><br/>
    Mobile: <input name="mobile" required/><br/>
    Home: <input name="home" required/><br/>
    Address: <textarea name="address" required></textarea><br/>
    Province: <input name="province" required/><br/>
    Loan Type: <input name="loanType" required/><br/>
    Purpose: <textarea name="purpose" required></textarea><br/>
    Amount: <input name="amount" type="number" step="0.01" required/><br/>
    Term (months): <input name="term" type="number" required/><br/>
    Job: <input name="job" required/><br/>
    Salary: <input name="salary" type="number" step="0.01" required/><br/>
    Income Proof: <input name="incomeProof" required/><br/>
    Past Loans: <textarea name="pastLoans"></textarea><br/>
    <input type="submit" value="Submit Application"/>
</form>
</div>
</body>
</html>