package com.icbt.oceanview.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.icbt.oceanview.dao.ReservationDAO;
import com.icbt.oceanview.model.Reservation;
import com.icbt.oceanview.model.User;

@WebServlet("/CustomerReservationServlet")
public class CustomerReservationServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // --- Check logged-in user ---
        HttpSession session = request.getSession(false);
        if (session == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");
        if (user == null || !"CUSTOMER".equals(user.getRole())) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            // --- Fetch reservations for this customer ---
            ReservationDAO dao = new ReservationDAO();
            List<Reservation> reservations = dao.getReservationsByCustomer(user.getId());

            // --- Set reservations to request ---
            request.setAttribute("reservations", reservations);

            // --- Forward to JSP ---
            request.getRequestDispatcher("myReservations.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            // --- Redirect to a user-friendly error page ---
            response.sendRedirect("error.jsp?message=Unable to fetch reservations");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}