<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.icbt.oceanview.model.Reservation" %>
<%@ page import="com.icbt.oceanview.model.User" %>

<%
    // Logged-in user check
    User user = (User) session.getAttribute("user");
    if (user == null || !"CUSTOMER".equals(user.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Reservations come from CustomerReservationServlet
    List<Reservation> reservations = (List<Reservation>) request.getAttribute("reservations");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Reservations | Ocean View Resort</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        .section { padding: 10px; background: #f8fbff; border-radius: 10px; margin: 10px; border: 1px solid #ddd; }
        .actions a { display: inline-block; margin-right: 15px; padding: 10px 20px; background: #2563eb; color: white; border-radius: 5px; text-decoration: none; }
        .actions a:hover { background: #1e40af; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { padding: 10px; border: 1px solid #ccc; text-align: left; }
        th { background: #2563eb; color: white; }
        .status-pending { color: orange; font-weight: bold; }
        .status-confirmed { color: green; font-weight: bold; }
        .status-cancelled { color: red; font-weight: bold; }
        button.view-bill { padding: 5px 10px; background: #003366; color: #fff; border:none; border-radius:4px; cursor:pointer; }
        button.view-bill:hover { background: #0055a5; }
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
    <a href="about.jsp">About</a>
    <a href="help.jsp">Help</a>
    <a href="contact.jsp">Contact</a>

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
            if (reservations == null || reservations.isEmpty()) {
        %>
            <tr>
                <td colspan="8" style="text-align:center;">No reservations found.</td>
            </tr>
        <%
            } else {
                for (Reservation r : reservations) {
        %>
            <tr>
                <td><%= r.getReservationId() %></td>
                <td><%= r.getGuestName() %></td>
                <td><%= r.getRoomType() %></td>
                <td><%= r.getCheckIn() %></td>
                <td><%= r.getCheckOut() %></td>
                <td><%= r.getMeals() %></td>
                <td>
                    <%
                        String status = r.getStatus();
                        if("PENDING".equalsIgnoreCase(status)) {
                    %>
                        <span class="status-pending">PENDING</span>
                    <%
                        } else if("CONFIRMED".equalsIgnoreCase(status)) {
                    %>
                        <span class="status-confirmed">CONFIRMED</span>
                    <%
                        } else if("CANCELLED".equalsIgnoreCase(status)) {
                    %>
                        <span class="status-cancelled">CANCELLED</span>
                    <%
                        }
                    %>
                </td>
                <td>
                    <a href="bill?id=<%= r.getReservationId() %>">
                        <button class="view-bill">View Bill</button>
                        
                      
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