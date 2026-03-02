<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.icbt.oceanview.model.User" %>
<%@ page import="com.icbt.oceanview.model.Reservation" %>
<%@ page import="com.icbt.oceanview.dao.ReservationDAO" %>

<%
    // Get logged-in user
    User user = (User) session.getAttribute("user");
    if (user == null || !"CUSTOMER".equals(user.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Fetch reservations using contact number
    ReservationDAO dao = new ReservationDAO();
 	List<Reservation> reservations = dao.getReservationsByCustomer(user.getPhone());
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Reservations | Ocean View Resort</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
    .section {
    padding: 10px;
    background: #f8fbff;
    border-radius: 10px;
    margin : 10px;
    border: 10px;
}

.actions a {
    display: inline-block;
    margin-right: 15px;
    padding: 10px 20px;
    background: #2563eb;
    color: white;
    border-radius: 5px;
    text-decoration: none;
}

.actions a:hover {
    background: #1e40af;
}
        .menu a.active { font-weight: bold; text-decoration: underline; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { padding: 10px; border: 1px solid #ccc; text-align: left; }
        th { background: #2563eb; color: white; }
    </style>
</head>
<body>



<div class="menu">
    <span class="logo">Ocean View Resort</span>

    <a href="customerdashboard.jsp">Dashboard</a>
    <a href="addReservation.jsp">Add Reservation</a>
    <a href="myReservations.jsp">My Reservations</a>
    <a href="bill.jsp">Bill</a>
    <a href="gallery.jsp">Gallery</a>
    <a href="about.jsp">About</a>
    <a href="help.jsp">Help</a>

    <span class="right">
        Welcome, <strong><%= user.getFullName() %></strong>
        <a href="logout" class="logout">Logout</a>
    </span>
</div>
<div class="section">
    <h2>My Reservations</h2>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Guest Name</th>
                <th>Room Type</th>
                <th>Check-In</th>
                <th>Check-Out</th>
                <th>Meals</th>
                <th>Status</th>
                <th>Bill</th>
            </tr>
        </thead>
        <tbody>
        <%
            if (reservations.isEmpty()) {
        %>
            <tr><td colspan="7" style="text-align:center;">No reservations found.</td></tr>
        <%
            } else {
                for (Reservation r : reservations) {
                    // Build meals string
                    String meals = "";
                    if (r.isBreakfast()) meals += "Breakfast ";
                    if (r.isLunch()) meals += "Lunch ";
                    if (r.isDinner()) meals += "Dinner";
        %>
            <tr>
                <td><%= r.getReservationId() %></td>
                <td><%= r.getGuestName() %></td>
                <td><%= r.getRoomType() %></td>
                <td><%= r.getCheckIn() %></td>
                <td><%= r.getCheckOut() %></td>
                <td><%= meals %></td>
                <td><%= r.getStatus() %></td>
                <td>
                        <a href="bill?id=<%= r.getReservationId() %>">
                            <button>View Bill</button>
                        </a>
                    </td>
            </tr>
        <%
                }
            }
        %>
        </tbody>
    </table>
</div>

</body>
</html>