<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.icbt.oceanview.dao.RoomDAO,com.icbt.oceanview.model.Room" %>
<%@ page import="com.icbt.oceanview.model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if(user == null || !"ADMIN".equals(user.getRole())){
        response.sendRedirect("login.jsp");
        return;
    }

    int roomId = Integer.parseInt(request.getParameter("id"));
    Room r = new RoomDAO().getRoomById(roomId);
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Room</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        .container { max-width:500px; margin:50px auto; background:#f4f6fa; padding:20px; border-radius:8px;}
        h2 { text-align:center; color:#003366; }
        input, select { width:100%; padding:8px; margin:8px 0; }
        button { width:100%; padding:10px; background:#28a745; color:white; border:none; cursor:pointer; border-radius:5px; }
        button:hover { background:#1e7e34; }
        a { text-decoration:none; display:block; margin-top:10px; text-align:center; color:#003366; }
    </style>
</head>
<body>

<div class="container">
<h2>Edit Room</h2>

<form action="updateRoom" method="post">
    <input type="hidden" name="id" value="<%= r.getId() %>">

    <label>Room Name:</label>
    <input type="text" name="roomName" value="<%= r.getRoomName() %>" required>

    <label>Room Type:</label>
    <select name="type" required>
        <option value="Single" <%= "Single".equals(r.getType())?"selected":"" %>>Single</option>
        <option value="Double" <%= "Double".equals(r.getType())?"selected":"" %>>Double</option>
        <option value="Standard" <%= "Standard".equals(r.getType())?"selected":"" %>>Standard</option>
        <option value="Deluxe" <%= "Deluxe".equals(r.getType())?"selected":"" %>>Deluxe</option>
        <option value="Family" <%= "Family".equals(r.getType())?"selected":"" %>>Family</option>
    </select>

    <label>Capacity:</label>
    <input type="number" name="capacity" value="<%= r.getCapacity() %>" required>

    <label>Facilities:</label>
    <input type="text" name="facilities" value="<%= r.getFacilities() %>">

    <label>Image:</label>
    <input type="text" name="image" value="<%= r.getImage() %>">

    <label>Status:</label>
    <select name="status" required>
        <option value="AVAILABLE" <%= "AVAILABLE".equals(r.getStatus())?"selected":"" %>>AVAILABLE</option>
        <option value="BOOKED" <%= "BOOKED".equals(r.getStatus())?"selected":"" %>>BOOKED</option>
        <option value="MAINTENANCE" <%= "MAINTENANCE".equals(r.getStatus())?"selected":"" %>>MAINTENANCE</option>
    </select>

    <button type="submit">Update Room</button>
</form>

<a href="rooms.jsp">⬅ Back to Rooms</a>
</div>

</body>
</html>