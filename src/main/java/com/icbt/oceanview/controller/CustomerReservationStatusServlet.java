package com.icbt.oceanview.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.icbt.oceanview.dao.ReservationDAO;
import com.icbt.oceanview.model.Reservation;
import com.icbt.oceanview.model.User;

@WebServlet("/customerReservations")
public class CustomerReservationStatusServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null || !"CUSTOMER".equals(user.getRole())) {
            response.sendRedirect("login.jsp");
            return;
        }

        ReservationDAO dao = new ReservationDAO();
        List<Reservation> reservations = dao.getReservationsByCustomer(user.getPhone());

        request.setAttribute("reservations", reservations);
        request.getRequestDispatcher("customerReservationStatus.jsp").forward(request, response);
    }
}