<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.icbt.oceanview.model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if(user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="css/style.css">
    <meta charset="UTF-8">
    <title>Give Feedback 🌊</title>
    <style>
       
    </style>
</head>
<body>
<!--  NAV BAR -->
<div class="menu">
    <span class="logo">Ocean View Resort</span>

    <a href="customerdashboard.jsp">Home</a>
    <a href="addReservation.jsp">Add Reservation</a>
    <a href="CustomerReservationServlet">My Reservations</a>
    <a href="gallery.jsp">Gallery</a>
    <a href="payment.jsp"> Payment</a>
    <a href="viewMessages.jsp">Message</a>
    <a href="feedback.jsp">Feedback</a>
    <a href="about.jsp">About</a>
    <a href="help.jsp">Help</a>
    <a href="contact.jsp">Contact</a>

    <span class="right">
        Welcome, <strong><%= user.getFullName() %></strong>
        <a href="logout" class="logout">Logout</a>
    </span>
</div>
<div class="container">
    <h2> Give Your Feedback </h2>
    <form action="AddFeedbackServlet" method="post">
        <label>Rating:</label>
        <select name="rating" required>
            <option value="5">5 - Excellent 😃</option>
            <option value="4">4 - Very Good 🙂</option>
            <option value="3">3 - Good 😐</option>
            <option value="2">2 - Fair 😕</option>
            <option value="1">1 - Poor 😞</option>
        </select>

        <label>Comments:</label>
        <textarea name="comments" rows="5" placeholder="Write your feedback..." required></textarea>

        <input type="submit" value="Submit Feedback 🌟">
    </form>
</div>
</body>
</html>