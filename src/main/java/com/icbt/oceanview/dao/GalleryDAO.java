package com.icbt.oceanview.dao;

import java.sql.*;
import java.util.*;
import com.icbt.oceanview.model.GalleryImage;

public class GalleryDAO {

    public void saveImage(GalleryImage img) {
        try {
            Connection con = DBConnection.getConnection();
            String sql = "INSERT INTO gallery_images (title, image_name) VALUES (?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, img.getTitle());
            ps.setString(2, img.getImageName());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<GalleryImage> getAllImages() {
        List<GalleryImage> list = new ArrayList<>();
        try {
            Connection con = DBConnection.getConnection();
            String sql = "SELECT * FROM gallery_images ORDER BY uploaded_date DESC";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                GalleryImage g = new GalleryImage();
                g.setId(rs.getInt("id"));
                g.setTitle(rs.getString("title"));
                g.setImageName(rs.getString("image_name"));
                list.add(g);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
 // Delete image
    public void deleteImage(int id) {
        try {
            Connection con = DBConnection.getConnection();
            String sql = "DELETE FROM gallery WHERE id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Update title
    public void updateTitle(int id, String title) {
        try {
            Connection con = DBConnection.getConnection();
            String sql = "UPDATE gallery SET title=? WHERE id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, title);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
