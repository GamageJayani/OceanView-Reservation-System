package com.icbt.oceanview.controller;

import java.io.IOException;
import java.time.temporal.ChronoUnit;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.icbt.oceanview.dao.ReservationDAO;
import com.icbt.oceanview.model.Reservation;
import com.icbt.oceanview.model.User;

@WebServlet("/bill")
public class BillServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String idParam = request.getParameter("id");
        if (idParam == null) {
            response.sendRedirect("myReservations.jsp?error=invalidId");
            return;
        }

        int id;
        try {
            id = Integer.parseInt(idParam);
        } catch (NumberFormatException e) {
            response.sendRedirect("myReservations.jsp?error=invalidId");
            return;
        }

        ReservationDAO dao = new ReservationDAO();

        //  SECURITY FIX — CHECK user_id
        Reservation r = dao.getReservationByIdAndUser(id, user.getId());

        if (r == null) {
            response.sendRedirect("myReservations.jsp?error=unauthorized");
            return;
        }

        long nights = ChronoUnit.DAYS.between(
                r.getCheckIn().toLocalDate(),
                r.getCheckOut().toLocalDate());

        if (nights <= 0) nights = 1;

        double rate = 0;
        switch (r.getRoomType()) {
            case "Single": rate = 5000; break;
            case "Double": rate = 8000; break;
            case "Standard": rate = 10000; break;
            case "Deluxe": rate = 12000; break;
            case "Family": rate = 15000; break;
        }

        double mealTotal = 0;
        if (r.isBreakfast()) mealTotal += 1500 * nights;
        if (r.isLunch()) mealTotal += 2500 * nights;
        if (r.isDinner()) mealTotal += 3000 * nights;

        double roomTotal = rate * nights;
        double subTotal = roomTotal + mealTotal;
        double serviceCharge = subTotal * 0.10;
        double grandTotal = subTotal + serviceCharge;

        request.setAttribute("reservation", r);
        request.setAttribute("nights", nights);
        request.setAttribute("rate", rate);
        request.setAttribute("roomTotal", roomTotal);
        request.setAttribute("mealTotal", mealTotal);
        request.setAttribute("serviceCharge", serviceCharge);
        request.setAttribute("grandTotal", grandTotal);
        request.setAttribute("billNumber", "BILL-" + UUID.randomUUID().toString().substring(0, 6));
        request.setAttribute("paymentStatus", "Pending");
        request.setAttribute("paymentMethod", "Not Paid");

        request.getRequestDispatcher("bill.jsp").forward(request, response);
    }
}