package com.icbt.oceanview.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.icbt.oceanview.dao.DBConnection;
import com.icbt.oceanview.model.User;

@WebServlet("/AddFeedbackServlet")
public class AddFeedbackServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        if(session == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");
        if(user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int rating = Integer.parseInt(request.getParameter("rating"));
        String comments = request.getParameter("comments");

        try (Connection con = DBConnection.getConnection()) {
            String sql = "INSERT INTO feedback (user_id, rating, comments) VALUES (?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, user.getId());
            ps.setInt(2, rating);
            ps.setString(3, comments);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("feedbackSuccess.jsp");
    }
}