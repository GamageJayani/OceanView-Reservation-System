package com.icbt.oceanview.dao;

import java.sql.*;
import java.util.*;
import com.icbt.oceanview.model.Room;

public class RoomDAO {

    public List<Room> getAllRooms() {
        List<Room> rooms = new ArrayList<>();
        try {
            Connection con = DBConnection.getConnection();
            String sql = "SELECT * FROM rooms";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                Room r = new Room();
                r.setId(rs.getInt("id"));
                r.setRoomName(rs.getString("room_name"));
                r.setType(rs.getString("type"));       // type included
                r.setCapacity(rs.getInt("capacity"));
                r.setPrice(rs.getDouble("price"));
                r.setFacilities(rs.getString("facilities"));
                r.setStatus(rs.getString("status"));   // status included
                r.setImage(rs.getString("image"));
                rooms.add(r);
            }
        } catch(Exception e) { e.printStackTrace(); }
        return rooms;
    }

    public void addRoom(Room r) {
        try {
            Connection con = DBConnection.getConnection();
            String sql = "INSERT INTO rooms(room_name, type, capacity, price, facilities, status, image) VALUES (?,?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, r.getRoomName());
            ps.setString(2, r.getType());
            ps.setInt(3, r.getCapacity());
            ps.setDouble(4, r.getPrice());
            ps.setString(5, r.getFacilities());
            ps.setString(6, r.getStatus());
            ps.setString(7, r.getImage());
            ps.executeUpdate();
        } catch(Exception e) { e.printStackTrace(); }
    }

    public Room getRoomById(int id) {
        Room r = null;
        try {
            Connection con = DBConnection.getConnection();
            String sql = "SELECT * FROM rooms WHERE id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                r = new Room();
                r.setId(rs.getInt("id"));
                r.setRoomName(rs.getString("room_name"));
                r.setType(rs.getString("type"));
                r.setCapacity(rs.getInt("capacity"));
                r.setPrice(rs.getDouble("price"));
                r.setFacilities(rs.getString("facilities"));
                r.setStatus(rs.getString("status"));
                r.setImage(rs.getString("image"));
            }
        } catch(Exception e) { e.printStackTrace(); }
        return r;
    }

    public void updateRoom(Room r) {
        try {
            Connection con = DBConnection.getConnection();
            String sql = "UPDATE rooms SET room_name=?, type=?, capacity=?, price=?, facilities=?, status=?, image=? WHERE id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, r.getRoomName());
            ps.setString(2, r.getType());          // type updated
            ps.setInt(3, r.getCapacity());
            ps.setDouble(4, r.getPrice());
            ps.setString(5, r.getFacilities());
            ps.setString(6, r.getStatus());        // status updated
            ps.setString(7, r.getImage());
            ps.setInt(8, r.getId());
            ps.executeUpdate();
        } catch(Exception e) { e.printStackTrace(); }
    }

    public void deleteRoom(int id) {
        try {
            Connection con = DBConnection.getConnection();
            String sql = "DELETE FROM rooms WHERE id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch(Exception e) { e.printStackTrace(); }
    }
}