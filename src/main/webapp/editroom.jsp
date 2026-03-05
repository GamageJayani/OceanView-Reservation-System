<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.icbt.oceanview.dao.RoomDAO" %>
<%@ page import="com.icbt.oceanview.model.Room" %>
<%@ page import="com.icbt.oceanview.model.User" %>

<%
    User user = (User) session.getAttribute("user");
    if(user == null || !"ADMIN".equals(user.getRole())){
        response.sendRedirect("login.jsp");
        return;
    }

    int roomId = Integer.parseInt(request.getParameter("id"));
    RoomDAO dao = new RoomDAO();
    Room room = dao.getRoomById(roomId);
%>

<!DOCTYPE html>
<html>
<head>

    <title>Edit Room</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        .edit-container { max-width:500px; margin:50px auto; background:#f4f6fa; padding:20px; border-radius:8px;}
        h2 { text-align:center; color:#003366; }
        input { width:100%; padding:8px; margin:8px 0; }
        button { width:100%; padding:10px; background:#003366; color:white; border:none; cursor:pointer; border-radius:5px; }
        button:hover { background:#0055aa; }
        a { text-decoration:none; display:block; margin-top:10px; text-align:center; color:#003366; }
    </style>
</head>
<body>
<!-- NAVBAR  -->
<div class="menu">
    <span class="logo">Ocean View Resort</span>

    <a href="admindashboard.jsp">Dashboard</a>
    <a href="allReservations.jsp">All Reservations</a>
    <a href="about.jsp">About</a>
    <a href="help.jsp">Help</a>
    <a href="adminmessages.jsp">Messages</a>
    <a href="admingallery.jsp">Gallery</a>
    <a href="rooms.jsp">Rooms</a>
    <a href="adminpayments.jsp">All Payments</a>
    <a href="contact.jsp">Contact</a>
	
    <span class="right">
        Welcome, <strong><%= user.getFullName() %></strong>
        <a href="logout" class="logout">Logout</a>
    </span>
</div>

<div class="edit-container">
<h2>Edit Room</h2>

<form action="updateRoom" method="post">
    <input type="hidden" name="id" value="<%= room.getId() %>">

    <label>Room Type</label>
    <input type="text" name="type" value="<%= room.getType() %>" required>

    <label>Price (LKR)</label>
    <input type="number" name="price" value="<%= room.getPrice() %>" required>

    <button type="submit">Update Room</button>
</form>

<a href="rooms.jsp">⬅ Back to Rooms</a>
</div>

</body>
</html>