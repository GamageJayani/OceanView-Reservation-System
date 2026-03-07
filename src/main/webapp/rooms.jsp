<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.icbt.oceanview.dao.RoomDAO, com.icbt.oceanview.model.Room" %>
<%@ page import="com.icbt.oceanview.model.User" %>

<%
    User user = (User) session.getAttribute("user");
    if(user == null || !"ADMIN".equals(user.getRole())){
        response.sendRedirect("login.jsp");
        return;
    }

    RoomDAO dao = new RoomDAO();
    List<Room> rooms = dao.getAllRooms();
%>

<%
    String success = request.getParameter("success");
    String error = request.getParameter("error");
%>

<% if(success != null) { %>
    <div style="padding:10px; margin-bottom:15px; border-radius:5px; color:white;
                background: <%= "add".equals(success) ? "#28a745" : "update".equals(success) ? "#007bff" : "#28a745" %>;">
        <%= "add".equals(success) ? "Room added successfully!" : "update".equals(success) ? "Room updated successfully!" : "" %>
    </div>
<% } %>

<% if(error != null) { %>
    <div style="padding:10px; margin-bottom:15px; border-radius:5px; color:white; background:#dc3545;">
        An error occurred. Please try again.
    </div>
<% } %>

<!DOCTYPE html>
<html>
<head>
    <title>Room Management</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        .room-container { max-width: 1000px; margin: 30px auto; background:#f4f6fa; padding:20px; border-radius:8px;}
        h2 { text-align:center; color:#003366; }
        .table { width:100%; border-collapse: collapse; margin-top:20px; }
        .table th, .table td { border:1px solid #ddd; padding:10px; text-align:center; }
        .table th { background:#003366; color:white; }
        .table tr:hover { background:#e6f2ff; }
        a.button { padding:6px 12px; background:#28a745; color:white; text-decoration:none; border-radius:5px; }
        a.button:hover { background:#1e7e34; }
        .action-links a { margin:0 5px; }
    </style>
</head>
<body>
<!-- NAVBAR  -->
<div class="menu">
    <span class="logo">Ocean View Resort</span>

    <a href="admindashboard.jsp">Home</a>
    <a href="AdminReservationServlet">All Reservations</a>
    <a href="about.jsp">About</a>
    <a href="help.jsp">Help</a>
    <a href="adminmessages.jsp">Messages</a>
    <a href="admingallery.jsp">Gallery</a>
    <a href="rooms.jsp">Rooms</a>
    <a href="adminpayments.jsp">All Payments</a>
    <a href="viewFeedback.jsp">Feedback</a>
    <a href="contact.jsp">Contact</a>
	
    <span class="right">
        Welcome, <strong><%= user.getFullName() %></strong>
        <a href="logout" class="logout">Logout</a>
    </span>
</div>

<div class="room-container">
<h2>Room Management</h2>

<a href="addroom.jsp" class="button">+ Add Room</a>

<table class="table">
<tr>
    <th>ID</th>
    <th>Room Name</th>
    <th>Room Type</th>
    <th>Capacity</th>
    <th>Price (LKR)</th>
    <th>Status</th>
    <th>Actions</th>
</tr>
<% for(Room r : rooms) { %>
<tr>
    <td><%= r.getId() %></td>
    <td><%= r.getRoomName() %></td>
    <td><%= r.getType() %></td>
    <td><%= r.getCapacity() %></td>
    <td><%= r.getPrice() %></td>
    <td><%= r.getStatus() %></td>
    <td class="action-links">
        <a href="updateRoom.jsp?id=<%= r.getId() %>">Edit</a>
        <a href="deleteRoom?id=<%= r.getId() %>" onclick="return confirm('Delete this room?')">Delete</a>
    </td>
</tr>
<% } %>
</table>
</div>

</body>
</html>