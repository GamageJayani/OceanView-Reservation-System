package com.icbt.oceanview.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.icbt.oceanview.model.Reservation;

public class ReservationDAO {

    public void addReservation(Reservation r) {
        try {
            Connection con = DBConnection.getConnection();

            String sql = "INSERT INTO reservations " +
            "(guest_name,address,contact_number,room_type,check_in,check_out,breakfast,lunch,dinner,status) " +
            "VALUES (?,?,?,?,?,?,?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, r.getGuestName());
            ps.setString(2, r.getAddress());
            ps.setString(3, r.getContactNumber());
            ps.setString(4, r.getRoomType());
            ps.setDate(5, r.getCheckIn());
            ps.setDate(6, r.getCheckOut());
            ps.setBoolean(7, r.isBreakfast());
            ps.setBoolean(8, r.isLunch());
            ps.setBoolean(9, r.isDinner());
            ps.setString(10, "PENDING");

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Reservation getReservation(int id) {
        Reservation r = null;
        try {
            Connection con = DBConnection.getConnection();
            String sql = "SELECT * FROM reservations WHERE reservation_id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                r = new Reservation();
                r.setReservationId(rs.getInt("reservation_id"));
                r.setGuestName(rs.getString("guest_name"));
                r.setAddress(rs.getString("address"));
                r.setContactNumber(rs.getString("contact_number"));
                r.setRoomType(rs.getString("room_type"));
                r.setCheckIn(rs.getDate("check_in"));
                r.setCheckOut(rs.getDate("check_out"));
                r.setBreakfast(rs.getBoolean("breakfast"));
                r.setLunch(rs.getBoolean("lunch"));
                r.setDinner(rs.getBoolean("dinner"));
                r.setStatus(rs.getString("status"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return r;
    }

    public void updateStatus(int reservationId, String status) {
        try {
            Connection con = DBConnection.getConnection();
            String sql = "UPDATE reservations SET status=? WHERE reservation_id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, status);
            ps.setInt(2, reservationId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Reservation> getReservationsByCustomer(String contact) {
        List<Reservation> list = new ArrayList<>();
        
        try {
            Connection con = DBConnection.getConnection();
            String sql = "SELECT * FROM reservations WHERE contact_number=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, contact);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Reservation r = new Reservation();
                r.setReservationId(rs.getInt("reservation_id"));
                r.setGuestName(rs.getString("guest_name"));
                r.setRoomType(rs.getString("room_type"));
                r.setCheckIn(rs.getDate("check_in"));
                r.setCheckOut(rs.getDate("check_out"));
                r.setStatus(rs.getString("status"));
                list.add(r);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
