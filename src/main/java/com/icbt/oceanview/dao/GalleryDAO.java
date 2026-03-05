package com.icbt.oceanview.dao;

import java.sql.*;
import java.util.*;
import com.icbt.oceanview.model.GalleryImage;

public class GalleryDAO {

    Connection con = DBConnection.getConnection();

    public void saveImage(GalleryImage img) {
        try {
            String sql = "INSERT INTO gallery_images(title, image_name, uploaded_at) VALUES(?,?,NOW())";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, img.getTitle());
            ps.setString(2, img.getImageName());
            ps.executeUpdate();
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
    

    public List<GalleryImage> getAllImages() {
        List<GalleryImage> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM gallery_images ORDER BY uploaded_at DESC";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                GalleryImage g = new GalleryImage();
                g.setId(rs.getInt("id"));
                g.setTitle(rs.getString("title"));
                g.setImageName(rs.getString("image_name"));
                g.setUploadedDate(rs.getTimestamp("uploaded_at"));
                list.add(g);
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public void updateTitle(int id, String title) {
        try {
            String sql = "UPDATE gallery_images SET title=? WHERE id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, title);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch(Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteImage(int id) {
        try {
            String sql = "DELETE FROM gallery_images WHERE id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch(Exception e) {
            e.printStackTrace();
        }
    }

    public String getImageNameById(int id) {
        String name = null;
        try {
            String sql = "SELECT image_name FROM gallery_images WHERE id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                name = rs.getString("image_name");
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        return name;
    }
}