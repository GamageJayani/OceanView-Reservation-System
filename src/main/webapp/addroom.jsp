<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.icbt.oceanview.model.User" %>

<%
    User user = (User) session.getAttribute("user");
    if(user == null || !"ADMIN".equals(user.getRole())){
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Add Room</title>
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
<h2>Add New Room</h2>

<form action="addRoom" method="post">
    <label>Room Name:</label>
    <input type="text" name="roomName" placeholder="Enter Room Name" required>

    <label>Room Type:</label>
    <select name="type" required>
        <option value="">-- Select Room Type --</option>
        <option value="Single">Single</option>
        <option value="Double">Double</option>
        <option value="Standard">Standard</option>
        <option value="Deluxe">Deluxe</option>
        <option value="Family">Family</option>
    </select>

    <label>Capacity:</label>
    <input type="number" name="capacity" placeholder="Enter capacity" required>

    <label>Facilities (comma separated):</label>
    <input type="text" name="facilities" placeholder="WiFi, AC, TV...">

    <label>Image Filename (optional):</label>
    <input type="text" name="image" placeholder="room.jpg">

    <button type="submit">Add Room</button>
</form>

<a href="rooms.jsp">⬅ Back to Rooms</a>
</div>

</body>
</html>