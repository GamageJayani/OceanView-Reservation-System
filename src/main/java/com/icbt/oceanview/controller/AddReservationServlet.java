package com.icbt.oceanview.controller;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.icbt.oceanview.dao.ReservationDAO;
import com.icbt.oceanview.model.Reservation;

/**
 * Servlet implementation class AddReservationServlet
 */
@WebServlet("/addReservation")
public class AddReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {

	    	LocalDate in = Date.valueOf(request.getParameter("checkIn")).toLocalDate();
	        LocalDate out = Date.valueOf(request.getParameter("checkOut")).toLocalDate();

	        if (!out.isAfter(in)) {
	            response.sendRedirect("addReservation.jsp?error=dates");
	            return;
	        }

	        Reservation r = new Reservation();
	        r.setGuestName(request.getParameter("guestName"));
	        r.setAddress(request.getParameter("address"));
	        r.setContactNumber(request.getParameter("contactNumber"));
	        r.setRoomType(request.getParameter("roomType"));
	        r.setCheckIn(Date.valueOf(request.getParameter("checkIn")));
	        r.setCheckOut(Date.valueOf(request.getParameter("checkOut")));

	        r.setBreakfast(request.getParameter("breakfast") != null);
	        r.setLunch(request.getParameter("lunch") != null);
	        r.setDinner(request.getParameter("dinner") != null);

	        new ReservationDAO().addReservation(r);

	        response.sendRedirect("customerdashboard.jsp");
	    }
	}


