package com.icbt.oceanview.controller;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.icbt.oceanview.dao.DBConnection;
import com.icbt.oceanview.model.Reservation;

@WebServlet("/AdminReservationServlet")
public class AdminReservationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || !"ADMIN".equals(((com.icbt.oceanview.model.User)session.getAttribute("user")).getRole())) {
            response.sendRedirect("login.jsp");
            return;
        }

        List<Reservation> reservations = new ArrayList<>();
        try (Connection con = DBConnection.getConnection()) {
            String sql = "SELECT r.id as reservation_id, u.full_name, rm.id as room_id, rm.type, r.status " +
                         "FROM reservations r " +
                         "JOIN users u ON r.user_id = u.id " +
                         "JOIN rooms rm ON r.room_id = rm.id " +
                         "ORDER BY r.created_at DESC";

            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while(rs.next()) {
                Reservation res = new Reservation();
                res.setReservationId(rs.getInt("reservation_id"));
                res.setGuestName(rs.getString("full_name"));
                res.setRoomId(rs.getInt("room_id"));
                res.setRoomType(rs.getString("type"));
                res.setStatus(rs.getString("status"));
                reservations.add(res);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("reservations", reservations);
        request.getRequestDispatcher("allReservations.jsp").forward(request, response);
    }
}