package com.icbt.oceanview.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.icbt.oceanview.model.User;

public class UserDAO {

	 public User login(String username, String password) {

	        User user = null;

	        try {
	            Connection con = DBConnection.getConnection();

	            String sql = "SELECT * FROM users WHERE username=? AND password=?";
	            PreparedStatement ps = con.prepareStatement(sql);

	            ps.setString(1, username);
	            ps.setString(2, password);

	            ResultSet rs = ps.executeQuery();

	            if (rs.next()) {
	                user = new User();
	                user.setId(rs.getInt("id"));
	                user.setFullName(rs.getString("full_name"));
	                user.setEmail(rs.getString("email"));
	                user.setPhone(rs.getString("phone"));
	                user.setUsername(rs.getString("username"));
	                user.setRole(rs.getString("role"));
	            }

	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return user;
	    }
    
    public void registerUser(User user) {

        try {
            Connection con = DBConnection.getConnection();
            String sql =
              "INSERT INTO users VALUES (NULL,?,?,?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, user.getFullName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPhone());
            ps.setString(4, user.getUsername());
            ps.setString(5, user.getPassword());
            ps.setString(6, user.getRole());

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}

