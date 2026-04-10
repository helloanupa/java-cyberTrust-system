package model;
import java.util.Date;

public class SupportTicket {
    private int id;
    private Integer customerId;
    private String subject;
    private String message;
    private String status;
    private Date createdAt;
    private Date updatedAt;
    private String reply;

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public Integer getCustomerId() { return customerId; }
    public void setCustomerId(Integer customerId) { this.customerId = customerId; }
    public String getSubject() { return subject; }
    public void setSubject(String subject) { this.subject = subject; }
    public String getMessage() { return message; }
    public void setMessage(String message) { this.message = message; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
    public Date getCreatedAt() { return createdAt; }
    public void setCreatedAt(Date createdAt) { this.createdAt = createdAt; }
    public Date getUpdatedAt() { return updatedAt; }
    public void setUpdatedAt(Date updatedAt) { this.updatedAt = updatedAt; }
    public String getReply() { return reply; }
    public void setReply(String reply) { this.reply = reply; }
} 