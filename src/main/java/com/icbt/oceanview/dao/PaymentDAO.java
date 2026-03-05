package com.icbt.oceanview.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.icbt.oceanview.model.Payment;

public class PaymentDAO {

    // Save customer payment
    public void addPayment(Payment p) {
        try {
            Connection con = DBConnection.getConnection();
            String invoiceNo = generateInvoiceNumber();

            String sql = "INSERT INTO payments(user_id, reservation_id, room_id, amount, method, status, invoice_no, created_at) VALUES(?,?,?,?,?,?,?,NOW())";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, p.getUserId());
            ps.setInt(2, p.getReservationId());
            ps.setInt(3, p.getRoomId());
            ps.setDouble(4, p.getAmount());
            ps.setString(5, p.getMethod());
            ps.setString(6, p.getStatus()); // dynamic
            ps.setString(7, invoiceNo);

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Get payments by user (customer)
    public List<Payment> getPaymentsByUser(int userId) {
        List<Payment> list = new ArrayList<>();
        try {
            Connection con = DBConnection.getConnection();
            String sql = "SELECT * FROM payments WHERE user_id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                Payment p = new Payment();
                p.setPaymentId(rs.getInt("payment_id"));
                p.setUserId(rs.getInt("user_id"));
                p.setRoomId(rs.getInt("room_id"));
                p.setReservationId(rs.getInt("reservation_id"));
                p.setAmount(rs.getDouble("amount"));
                p.setMethod(rs.getString("method"));
                p.setStatus(rs.getString("status"));
                p.setCreatedAt(rs.getTimestamp("created_at"));
                p.setInvoiceNo(rs.getString("invoice_no"));
                list.add(p);
            }
        } catch(Exception e) { e.printStackTrace(); }
        return list;
    }

    // Get all payments (admin)
    public List<Payment> getAllPayments() {
        List<Payment> list = new ArrayList<>();
        try {
            Connection con = DBConnection.getConnection();
            String sql = "SELECT * FROM payments ORDER BY created_at DESC";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                Payment p = new Payment();
                p.setPaymentId(rs.getInt("payment_id"));
                p.setUserId(rs.getInt("user_id"));
                p.setRoomId(rs.getInt("room_id"));
                p.setReservationId(rs.getInt("reservation_id"));
                p.setAmount(rs.getDouble("amount"));
                p.setMethod(rs.getString("method"));
                p.setStatus(rs.getString("status"));
                p.setCreatedAt(rs.getTimestamp("created_at"));
                p.setInvoiceNo(rs.getString("invoice_no"));
                list.add(p);
            }
        } catch(Exception e) { e.printStackTrace(); }
        return list;
    }

    // Get single payment by ID
    public Payment getPaymentById(int id) {
        Payment p = null;
        try {
            Connection con = DBConnection.getConnection();
            String sql = "SELECT * FROM payments WHERE payment_id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                p = new Payment();
                p.setPaymentId(rs.getInt("payment_id"));
                p.setUserId(rs.getInt("user_id"));
                p.setRoomId(rs.getInt("room_id"));
                p.setReservationId(rs.getInt("reservation_id"));
                p.setAmount(rs.getDouble("amount"));
                p.setMethod(rs.getString("method"));
                p.setStatus(rs.getString("status"));
                p.setCreatedAt(rs.getTimestamp("created_at"));
                p.setInvoiceNo(rs.getString("invoice_no"));
            }
        } catch(Exception e) { e.printStackTrace(); }
        return p;
    }
    
    public String generateInvoiceNumber() {
        String invoice = "";
        String year = String.valueOf(java.time.Year.now().getValue());

        try {
            Connection con = DBConnection.getConnection();
            String sql = "SELECT COUNT(*) FROM payments WHERE YEAR(created_at)=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, year);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int count = rs.getInt(1) + 1;
                invoice = "INV-" + year + "-" + String.format("%04d", count);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return invoice;
    }
}