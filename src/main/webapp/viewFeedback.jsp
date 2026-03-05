<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.icbt.oceanview.dao.DBConnection" %>
<%@ page import="com.icbt.oceanview.model.User" %>

<%
    // --- Session check for logged-in admin ---
    User user = (User) session.getAttribute("user");
    if(user == null || !"ADMIN".equals(user.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer Feedback </title>
    <link rel="stylesheet" href="css/style.css">
    <style>
       .feedback-container{
    max-width: 1000px;  
    margin: 50px auto;   
    padding: 30px;       
    background: #f9f9f9;
    border-radius: 8px;
    box-shadow: 0 0 20px rgba(0,0,0,0.15);
} 
    </style>
</head>
<body>

<!-- NAVBAR -->
<div class="menu">
    <span class="logo">Ocean View Resort</span>
    <div>
        <a href="admindashboard.jsp">Home</a>
        <a href="AdminReservationServlet">All Reservations</a>
        <a href="adminpayments.jsp">All Payments</a>
        <a href="viewFeedback.jsp">Feedback</a>
        <a href="about.jsp">About</a>
        <a href="help.jsp">Help</a>
        <a href="contact.jsp">Contact</a>
    </div>
    <div class="right">
        Welcome, <strong><%= user.getFullName() %></strong>
        <a href="logout" class="logout">Logout</a>
    </div>
</div>

<div class="feedback-container">
    <h2>Customer Feedback 🌊</h2>
   <table>
        <tr>
            <th>Customer</th>
            <th>Reservation ID</th>
            <th>Rating</th>
            <th>Comments</th>
            <th>Date</th>
        </tr>

<%
    // Open connection and query feedback with user names
    try (Connection con = DBConnection.getConnection()) {
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(
            "SELECT f.*, u.full_name FROM feedback f JOIN users u ON f.user_id = u.id ORDER BY f.created_at DESC"
        );

        while (rs.next()) {
            String customerName = rs.getString("full_name");
            int reservationId = rs.getInt("reservation_id");
            if (rs.wasNull()) reservationId = -1; // or use null logic below
            int rating = rs.getInt("rating");
            String comments = rs.getString("comments");
            Timestamp createdAt = rs.getTimestamp("created_at");
%>
        <tr>
            <td><%= customerName %></td>
            <td><%= (reservationId == -1) ? "N/A" : reservationId %></td>
            <td><span class="stars"><%= "★".repeat(rating) + "☆".repeat(5 - rating) %></span></td>
            <td><%= comments %></td>
            <td><%= (createdAt != null) ? createdAt : "N/A" %></td>
        </tr>
<%
        }
        rs.close();
        st.close();
    } catch (Exception e) {
        out.println("<tr><td colspan='5'>Error fetching feedback: " + e.getMessage() + "</td></tr>");
        e.printStackTrace();
    }
%>
    </table>
</div>

</body>
</html>