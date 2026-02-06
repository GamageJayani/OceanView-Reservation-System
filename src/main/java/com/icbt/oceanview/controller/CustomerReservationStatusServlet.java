package com.icbt.oceanview.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.icbt.oceanview.dao.ReservationDAO;
import com.icbt.oceanview.model.Reservation;

/**
 * Servlet implementation class CustomerReservationStatusServlet
 */
@WebServlet("/customerReservations")
public class CustomerReservationStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Logged-in customer info (example: phone)
        String contact = request.getParameter("contact");

        ReservationDAO reservationDAO = new ReservationDAO();

        // 🔹 Only this customer's reservations
        List<Reservation> reservations =
                reservationDAO.getReservationsByCustomer(contact);

        request.setAttribute("reservations", reservations);

        request.getRequestDispatcher("customerReservationStatus.jsp")
               .forward(request, response);
    }
}
