package model;

public class Customer {
    private int customerId;
    private String username;
    private String email;
    private String password;
    private String phone;
    private String nic;
    private String country;

    public int getCustomerId() { return customerId; }
    public void setCustomerId(int customerId) { this.customerId = customerId; }
    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }
    public String getNic() { return nic; }
    public void setNic(String nic) { this.nic = nic; }
    public String getCountry() { return country; }
    public void setCountry(String country) { this.country = country; }
} 