package com.icbt.oceanview.model;

import java.sql.Date;
import java.sql.Timestamp;

public class Message {

    private int messageId;
    private String senderName;
    private String senderEmail;
    private String messageText;
    private String replyText;
    private String status;      // NEW, REPLIED
    private Timestamp createdAt;
    private Date date;
    // ---- Getters & Setters ----

    public int getMessageId() {
        return messageId;
    }
    public void setMessageId(int messageId) {
        this.messageId = messageId;
    }

    public String getSenderName() {
        return senderName;
    }
    public void setSenderName(String senderName) {
        this.senderName = senderName;
    }

    public String getSenderEmail() {
        return senderEmail;
    }
    public void setSenderEmail(String senderEmail) {
        this.senderEmail = senderEmail;
    }

    public String getMessageText() {
        return messageText;
    }
    public void setMessageText(String messageText) {
        this.messageText = messageText;
    }

    public String getReplyText() {
        return replyText;
    }
    public void setReplyText(String replyText) {
        this.replyText = replyText;
    }

    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }
    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
	}
	public Date getDate() {
		return date;
	}
	
	public void setDate(Date date) {
	    this.date = date;
	}
}