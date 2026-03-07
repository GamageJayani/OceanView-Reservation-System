package com.icbt.oceanview.dao;

import java.sql.*;
import java.util.*;
import com.icbt.oceanview.model.Message;

public class MessageDAO {

    // Save message
    public void addMessage(Message msg) {
        try {
            Connection con = DBConnection.getConnection();
            String sql = "INSERT INTO messages " +
                    "(sender_name, sender_email, message_text, status, created_at) " +
                    "VALUES (?,?,?,?,NOW())";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, msg.getSenderName());
            ps.setString(2, msg.getSenderEmail());
            ps.setString(3, msg.getMessageText());
            ps.setString(4, "NEW");

            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Get all messages
    public List<Message> getAllMessages() {
        List<Message> list = new ArrayList<>();

        try {
            Connection con = DBConnection.getConnection();
            String sql = "SELECT * FROM messages ORDER BY created_at DESC";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Message m = new Message();
                m.setMessageId(rs.getInt("id"));
                m.setSenderName(rs.getString("sender_name"));
                m.setSenderEmail(rs.getString("sender_email"));
                m.setMessageText(rs.getString("message_text"));
                m.setReplyText(rs.getString("reply_text"));
                m.setStatus(rs.getString("status"));
                m.setCreatedAt(rs.getTimestamp("created_at"));
                list.add(m);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // Get single message
    public Message getMessageById(int id) {
        Message m = null;

        try {
            Connection con = DBConnection.getConnection();
            String sql = "SELECT * FROM messages WHERE id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                m = new Message();
                m.setMessageId(rs.getInt("id"));
                m.setSenderName(rs.getString("sender_name"));
                m.setSenderEmail(rs.getString("sender_email"));
                m.setMessageText(rs.getString("message_text"));
                m.setReplyText(rs.getString("reply_text"));
                m.setStatus(rs.getString("status"));
                m.setCreatedAt(rs.getTimestamp("created_at"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return m;
    }

    // Reply
    public void replyMessage(int id, String reply) {
        try {
            Connection con = DBConnection.getConnection();
            String sql = "UPDATE messages SET reply_text=?, status='REPLIED' WHERE id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, reply);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Delete
    public void deleteMessage(int id) {
        try {
            Connection con = DBConnection.getConnection();
            String sql = "DELETE FROM messages WHERE id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // New message counter
    public int getNewMessageCount() {
        int count = 0;
        try {
            Connection con = DBConnection.getConnection();
            String sql = "SELECT COUNT(*) FROM messages WHERE status='NEW'";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }
    
    
}


