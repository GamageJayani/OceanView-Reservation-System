package com.icbt.oceanview.controller;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.icbt.oceanview.dao.RoomDAO;
import com.icbt.oceanview.model.Room;

@WebServlet("/editRoom")
public class EditRoomServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Room r = new Room();
        r.setId(Integer.parseInt(request.getParameter("id")));
        r.setRoomName(request.getParameter("roomName"));
        r.setCapacity(Integer.parseInt(request.getParameter("capacity")));
        r.setPrice(Double.parseDouble(request.getParameter("price")));
        r.setFacilities(request.getParameter("facilities"));
        r.setStatus(request.getParameter("status"));
        r.setImage(request.getParameter("image"));

        new RoomDAO().updateRoom(r);
        response.sendRedirect("rooms.jsp");
    }
}