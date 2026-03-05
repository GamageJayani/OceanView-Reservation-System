package com.icbt.oceanview.controller;

import java.io.IOException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.icbt.oceanview.dao.RoomDAO;
import com.icbt.oceanview.model.Room;

@WebServlet("/updateRoom")
public class UpdateRoomServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            Room r = new Room();
            r.setId(Integer.parseInt(request.getParameter("id")));
            r.setRoomName(request.getParameter("roomName"));
            r.setType(request.getParameter("type"));

            int capacity = 0;
            String cap = request.getParameter("capacity");
            if(cap != null && !cap.isEmpty()) capacity = Integer.parseInt(cap);
            r.setCapacity(capacity);

            r.setFacilities(request.getParameter("facilities"));
            r.setImage(request.getParameter("image"));
            r.setStatus(request.getParameter("status"));

            // Auto price based on type
            double price = 0;
            switch(r.getType()) {
                case "Single": price = 5000; break;
                case "Double": price = 8000; break;
                case "Standard": price = 10000; break;
                case "Deluxe": price = 12000; break;
                case "Family": price = 15000; break;
            }
            r.setPrice(price);

            new RoomDAO().updateRoom(r);
            response.sendRedirect("rooms.jsp");
        } catch(Exception e) {
            e.printStackTrace();
            response.sendRedirect("updateroom.jsp?error=server");
        }
    }
}