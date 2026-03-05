package com.icbt.oceanview.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.Year;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.icbt.oceanview.dao.DBConnection;
import com.icbt.oceanview.dao.ReservationDAO;
import com.icbt.oceanview.model.Reservation;
import com.icbt.oceanview.model.User;

@WebServlet("/ProcessPaymentServlet")
public class ProcessPaymentServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User loggedUser = (User) session.getAttribute("user");

        if (loggedUser == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            String reservationParam = request.getParameter("reservationId");
            String amountParam = request.getParameter("amount");
            String method = request.getParameter("method");

            if (reservationParam == null || amountParam == null || method == null) {
                response.sendRedirect("payment.jsp?error=missingparams");
                return;
            }

            int reservationId = Integer.parseInt(reservationParam);
            double amount = Double.parseDouble(amountParam);

            // ===== CARD VALIDATION =====
            String status = "Pending"; // Default status

            if ("Card".equalsIgnoreCase(method)) {
                String cardNumber = request.getParameter("cardNumber");
                String expiry = request.getParameter("expiry");
                String cvv = request.getParameter("cvv");

                if (cardNumber == null || cardNumber.length() != 16 ||
                    expiry == null || cvv == null || cvv.length() != 3) {
                    response.sendRedirect("payment.jsp?id=" + reservationId + "&error=invalidcard");
                    return;
                }

                // ===== Simulate Online Payment =====
                boolean paymentSuccess = true; // in real system, call payment gateway
                status = paymentSuccess ? "PAID" : "FAILED";
            } 
            // Cash stays Pending automatically

            // ===== FETCH RESERVATION =====
            ReservationDAO resDao = new ReservationDAO();
            Reservation res = resDao.getReservationByIdAndUser(reservationId, loggedUser.getId());
            if (res == null) {
                response.sendRedirect("payment.jsp?error=unauthorized");
                return;
            }

            int roomId = res.getRoomId();
            int userId = res.getUserId();

            Connection con = DBConnection.getConnection();

            // ===== GENERATE INVOICE NUMBER =====
            String year = String.valueOf(Year.now().getValue());
            String countSql = "SELECT COUNT(*) FROM payments WHERE YEAR(created_at)=?";
            PreparedStatement cps = con.prepareStatement(countSql);
            cps.setString(1, year);
            ResultSet rsCount = cps.executeQuery();

            int count = 1;
            if (rsCount.next()) {
                count = rsCount.getInt(1) + 1;
            }
            String invoiceNo = "INV-" + year + "-" + String.format("%04d", count);

            // ===== INSERT PAYMENT =====
            String sql = "INSERT INTO payments(user_id, reservation_id, room_id, amount, method, status, invoice_no, created_at) "
                       + "VALUES (?, ?, ?, ?, ?, ?, ?, NOW())";
            PreparedStatement ps = con.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);

            ps.setInt(1, userId);
            ps.setInt(2, reservationId);
            ps.setInt(3, roomId);
            ps.setDouble(4, amount);
            ps.setString(5, method);
            ps.setString(6, status);  // <-- FIXED: status dynamic
            ps.setString(7, invoiceNo);

            ps.executeUpdate();

            // ===== GET GENERATED PAYMENT ID =====
            ResultSet generatedKeys = ps.getGeneratedKeys();
            int paymentId = 0;
            if (generatedKeys.next()) {
                paymentId = generatedKeys.getInt(1);
            }

            // ===== REDIRECT TO INVOICE PAGE =====
            response.sendRedirect("invoice.jsp?paymentId=" + paymentId);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("payment.jsp?error=server");
        }
    }
}