<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.icbt.oceanview.model.User" %>
<%
User user = (User) session.getAttribute("user");
if(user == null || !"ADMIN".equals(user.getRole())){
    response.sendRedirect("../login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Upload Gallery Image</title>
 <link rel="stylesheet" href="css/style.css">
<style>
body{font-family:Arial;}
.box{
    width:400px;
    margin:80px auto;
    background:white;
    padding:30px;
    border-radius:8px;
    box-shadow:0 10px 20px rgba(0,0,0,0.2);
}
input,button{
    width:100%;
    margin-top:10px;
    padding:10px;
}
button{
    background:#003366;
    color:white;
    border:none;
}
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

<div class="box">
<h2>Upload Gallery Image</h2>

<% if("true".equals(request.getParameter("success"))){ %>
<p style="color:green;">Image uploaded successfully</p>
<% } %>

<form action="<%= request.getContextPath() %>/uploadImage" method="post" enctype="multipart/form-data">
    <input type="text" name="title" placeholder="Image title" required>
    <input type="file" name="image" required>
    <button>Upload</button>
</form>

</div>
</body>
</html>
