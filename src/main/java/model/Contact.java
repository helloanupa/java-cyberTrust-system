package model;

public class Contact {
    private int id;
    private String title;
    private String address;
    private String phone;
    private String email;
    private String workingHours;
    private String description;

    public Contact() {}

    public Contact(int id, String title, String address, String phone, String email, String workingHours, String description) {
        this.id = id;
        this.title = title;
        this.address = address;
        this.phone = phone;
        this.email = email;
        this.workingHours = workingHours;
        this.description = description;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getWorkingHours() { return workingHours; }
    public void setWorkingHours(String workingHours) { this.workingHours = workingHours; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
} 