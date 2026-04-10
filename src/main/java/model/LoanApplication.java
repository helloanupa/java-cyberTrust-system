package model;
import java.util.Date;

public class LoanApplication {
    private int id;
    private String fname;
    private String lname;
    private String status;
    private Date dob;
    private String gender;
    private String email;
    private String mobile;
    private String home;
    private String address;
    private String province;
    private String loanType;
    private String purpose;
    private double amount;
    private int term;
    private String job;
    private double salary;
    private String incomeProof;
    private String pastLoans;

    // Getters and setters for all fields
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getFname() { return fname; }
    public void setFname(String fname) { this.fname = fname; }
    public String getLname() { return lname; }
    public void setLname(String lname) { this.lname = lname; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
    public Date getDob() { return dob; }
    public void setDob(Date dob) { this.dob = dob; }
    public String getGender() { return gender; }
    public void setGender(String gender) { this.gender = gender; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getMobile() { return mobile; }
    public void setMobile(String mobile) { this.mobile = mobile; }
    public String getHome() { return home; }
    public void setHome(String home) { this.home = home; }
    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }
    public String getProvince() { return province; }
    public void setProvince(String province) { this.province = province; }
    public String getLoanType() { return loanType; }
    public void setLoanType(String loanType) { this.loanType = loanType; }
    public String getPurpose() { return purpose; }
    public void setPurpose(String purpose) { this.purpose = purpose; }
    public double getAmount() { return amount; }
    public void setAmount(double amount) { this.amount = amount; }
    public int getTerm() { return term; }
    public void setTerm(int term) { this.term = term; }
    public String getJob() { return job; }
    public void setJob(String job) { this.job = job; }
    public double getSalary() { return salary; }
    public void setSalary(double salary) { this.salary = salary; }
    public String getIncomeProof() { return incomeProof; }
    public void setIncomeProof(String incomeProof) { this.incomeProof = incomeProof; }
    public String getPastLoans() { return pastLoans; }
    public void setPastLoans(String pastLoans) { this.pastLoans = pastLoans; }
} 