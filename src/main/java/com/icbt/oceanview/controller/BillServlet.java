package com.icbt.oceanview.controller;

import java.io.IOException;
import java.time.temporal.ChronoUnit;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.icbt.oceanview.dao.ReservationDAO;
import com.icbt.oceanview.model.Reservation;

@WebServlet("/bill")
public class BillServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        ReservationDAO dao = new ReservationDAO();
        Reservation r = dao.getReservation(id);
        
        if (r == null) {
            response.sendRedirect("viewReservation.jsp?error=notfound");
            return;
        }

        long nights = ChronoUnit.DAYS.between(
                r.getCheckIn().toLocalDate(),
                r.getCheckOut().toLocalDate());

        double rate;
        switch (r.getRoomType()) {
            case "Single": rate = 5000; break;
            case "Double": rate = 8000; break;
            case "Standard": rate = 10000; break;
            case "Deluxe": rate = 12000; break;
            case "Family": rate = 15000; break;
            default: rate = 0;
        }

        double mealTotal = 0;
        if (r.isBreakfast()) mealTotal += 1500;
        if (r.isLunch()) mealTotal += 2500;
        if (r.isDinner()) mealTotal += 3000;

        double roomTotal = nights * rate;
        double subTotal = roomTotal + mealTotal;

        double serviceCharge = subTotal * 0.10; // 10%
        double grandTotal = subTotal + serviceCharge;

        // Extra details
        String billNumber = "BILL-" + UUID.randomUUID().toString().substring(0, 6);
        String paymentStatus = "Pending";
        String paymentMethod = "Cash";

        request.setAttribute("reservation", r);
        request.setAttribute("nights", nights);
        request.setAttribute("rate", rate);
        request.setAttribute("roomTotal", roomTotal);
        request.setAttribute("mealTotal", mealTotal);
        request.setAttribute("serviceCharge", serviceCharge);
        request.setAttribute("grandTotal", grandTotal);
        request.setAttribute("billNumber", billNumber);
        request.setAttribute("paymentStatus", paymentStatus);
        request.setAttribute("paymentMethod", paymentMethod);

        request.getRequestDispatcher("bill.jsp").forward(request, response);
    }
}
