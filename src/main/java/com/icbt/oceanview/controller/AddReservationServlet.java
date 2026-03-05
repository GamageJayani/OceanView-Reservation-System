package com.icbt.oceanview.controller;

import java.io.IOException;
import java.sql.*;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import com.icbt.oceanview.dao.ReservationDAO;
import com.icbt.oceanview.dao.DBConnection;
import com.icbt.oceanview.model.Reservation;
import com.icbt.oceanview.model.User;

@WebServlet("/addReservation")
public class AddReservationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null) { response.sendRedirect("login.jsp"); return; }

        User user = (User) session.getAttribute("user");
        if (user == null) { response.sendRedirect("login.jsp"); return; }

        try {
            LocalDate in = Date.valueOf(request.getParameter("checkIn")).toLocalDate();
            LocalDate out = Date.valueOf(request.getParameter("checkOut")).toLocalDate();
            if (!out.isAfter(in)) { response.sendRedirect("addReservation.jsp?error=dates"); return; }

            String roomType = request.getParameter("roomType");

            try (Connection con = DBConnection.getConnection()) {
                con.setAutoCommit(false); // start transaction

                // --- Find available room ---
                int roomId = 0;
                try (PreparedStatement psRoom = con.prepareStatement(
                        "SELECT id FROM rooms WHERE type=? AND status='AVAILABLE' LIMIT 1 FOR UPDATE")) {
                    psRoom.setString(1, roomType);
                    try (ResultSet rsRoom = psRoom.executeQuery()) {
                        if (!rsRoom.next()) {
                            response.sendRedirect("addReservation.jsp?error=noRoom");
                            return;
                        }
                        roomId = rsRoom.getInt("id");
                    }
                }

                // --- Create reservation object ---
                Reservation r = new Reservation();
                r.setUserId(user.getId());
                r.setGuestName(request.getParameter("guestName"));
                r.setAddress(request.getParameter("address"));
                r.setContactNumber(user.getPhone());
                r.setRoomType(roomType);
                r.setRoomId(roomId);
                r.setCheckIn(Date.valueOf(request.getParameter("checkIn")));
                r.setCheckOut(Date.valueOf(request.getParameter("checkOut")));
                r.setBreakfast(request.getParameter("breakfast") != null);
                r.setLunch(request.getParameter("lunch") != null);
                r.setDinner(request.getParameter("dinner") != null);

                // --- Insert reservation using same connection ---
                ReservationDAO dao = new ReservationDAO();
                dao.addReservation(con, r); // new method with Connection parameter

                // --- Update room status ---
                try (PreparedStatement psUpdate = con.prepareStatement(
                        "UPDATE rooms SET status='BOOKED' WHERE id=?")) {
                    psUpdate.setInt(1, roomId);
                    psUpdate.executeUpdate();
                }

                con.commit(); // commit transaction

                // --- Redirect to payment page ---
                response.sendRedirect("payment.jsp?reservationId=" + r.getReservationId());

            } catch (Exception e) {
                e.printStackTrace();
                try { e.printStackTrace(); } catch (Exception ex) {}
                response.sendRedirect("addReservation.jsp?error=server");
            }

        } catch (Exception ex) {
            ex.printStackTrace();
            response.sendRedirect("addReservation.jsp?error=server");
        }
    }
}