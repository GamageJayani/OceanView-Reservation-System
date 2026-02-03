package com.icbt.oceanview.dao;

import java.sql.*;
import com.icbt.oceanview.model.Reservation;

public class ReservationDAO {

    public void addReservation(Reservation r) {

        try {
            Connection con = DBConnection.getConnection();

            String sql = "INSERT INTO reservations VALUES (NULL,?,?,?,?,?,?,?,?,?)";
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
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return r;
    }
}
