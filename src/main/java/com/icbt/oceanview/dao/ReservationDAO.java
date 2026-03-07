package com.icbt.oceanview.dao;

import java.sql.*;
import java.util.*;
import com.icbt.oceanview.model.Reservation;

public class ReservationDAO {

    // ==============================
    // ADD RESERVATION
    // ==============================
    public void addReservation(Reservation r) {

        try (Connection con = DBConnection.getConnection()) {

            String sql = "INSERT INTO reservations "
                    + "(user_id, guest_name, address, contact_number, room_type, room_id, check_in, check_out, breakfast, lunch, dinner, status, created_at) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW())";

            PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            ps.setInt(1, r.getUserId());
            ps.setString(2, r.getGuestName());
            ps.setString(3, r.getAddress());
            ps.setString(4, r.getContactNumber());
            ps.setString(5, r.getRoomType());
            ps.setInt(6, r.getRoomId());
            ps.setDate(7, r.getCheckIn());
            ps.setDate(8, r.getCheckOut());
            ps.setBoolean(9, r.isBreakfast());
            ps.setBoolean(10, r.isLunch());
            ps.setBoolean(11, r.isDinner());
            ps.setString(12, "PENDING");

            ps.executeUpdate();

            // Get generated reservation ID
            ResultSet keys = ps.getGeneratedKeys();
            if (keys.next()) {
                r.setReservationId(keys.getInt(1));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    

    // ==============================
    // UPDATE STATUS
    // ==============================
    public void updateStatus(int reservationId, String status) {

        try (Connection con = DBConnection.getConnection()) {

            String sql = "UPDATE reservations SET status=? WHERE id=?";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, status);
            ps.setInt(2, reservationId);

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // ==============================
    // GET SINGLE RESERVATION (ADMIN USE)
    // ==============================
    public Reservation getReservation(int id) {

        Reservation r = null;

        try (Connection con = DBConnection.getConnection()) {

            String sql = "SELECT * FROM reservations WHERE id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                r = mapResultSetToReservation(rs);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return r;
    }

    // ==============================
    // 🔐 SECURE METHOD (IMPORTANT FIX)
    // Only return reservation if it belongs to logged user
    // ==============================
    public Reservation getReservationByIdAndUser(int reservationId, int userId) {

        Reservation r = null;

        try (Connection con = DBConnection.getConnection()) {

            String sql = "SELECT * FROM reservations WHERE id=? AND user_id=?";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, reservationId);
            ps.setInt(2, userId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                r = mapResultSetToReservation(rs);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return r;
    }

    // ==============================
    // GET RESERVATIONS BY CUSTOMER
    // ==============================
    public List<Reservation> getReservationsByCustomer(int userId) {

        List<Reservation> list = new ArrayList<>();

        try (Connection con = DBConnection.getConnection()) {

            String sql = "SELECT * FROM reservations WHERE user_id=? ORDER BY created_at DESC";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Reservation r = mapResultSetToReservation(rs);
                list.add(r);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // ==============================
    // GET ALL RESERVATIONS (ADMIN)
    // ==============================
    public List<Reservation> getAllReservations() {

        List<Reservation> list = new ArrayList<>();

        try (Connection con = DBConnection.getConnection()) {

        	String sql = "SELECT * FROM reservations WHERE user_id=? ORDER BY id DESC";
            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(mapResultSetToReservation(rs));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // ==============================
    // MAP RESULTSET TO OBJECT
    // ==============================
    private Reservation mapResultSetToReservation(ResultSet rs) throws Exception {

        Reservation r = new Reservation();

        r.setReservationId(rs.getInt("id"));
        r.setUserId(rs.getInt("user_id"));
        r.setGuestName(rs.getString("guest_name"));
        r.setAddress(rs.getString("address"));
        r.setContactNumber(rs.getString("contact_number"));
        r.setRoomType(rs.getString("room_type"));
        r.setRoomId(rs.getInt("room_id"));
        r.setCheckIn(rs.getDate("check_in"));
        r.setCheckOut(rs.getDate("check_out"));
        r.setBreakfast(rs.getBoolean("breakfast"));
        r.setLunch(rs.getBoolean("lunch"));
        r.setDinner(rs.getBoolean("dinner"));
        r.setStatus(rs.getString("status"));

        return r;
    }
    
    public void updateReservationStatus(int reservationId, String status) {
        try (Connection con = DBConnection.getConnection()) {
            String sql = "UPDATE reservations SET status=? WHERE id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, status);
            ps.setInt(2, reservationId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void addReservation(Connection con, Reservation r) throws SQLException {

        String sql = "INSERT INTO reservations "
                + "(user_id, guest_name, address, contact_number, room_type, room_id, check_in, check_out, breakfast, lunch, dinner, status, created_at) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW())";

        PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

        ps.setInt(1, r.getUserId());
        ps.setString(2, r.getGuestName());
        ps.setString(3, r.getAddress());
        ps.setString(4, r.getContactNumber());
        ps.setString(5, r.getRoomType());
        ps.setInt(6, r.getRoomId());
        ps.setDate(7, r.getCheckIn());
        ps.setDate(8, r.getCheckOut());
        ps.setBoolean(9, r.isBreakfast());
        ps.setBoolean(10, r.isLunch());
        ps.setBoolean(11, r.isDinner());
        ps.setString(12, "PENDING");

        ps.executeUpdate();

        ResultSet rs = ps.getGeneratedKeys();
        if (rs.next()) {
            r.setReservationId(rs.getInt(1));
        }
    }
}