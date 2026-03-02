<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.icbt.oceanview.model.Reservation" %>
<%@ page import="com.icbt.oceanview.model.User" %>

<%
    User user = (User) session.getAttribute("user");
    if (user == null || !"CUSTOMER".equals(user.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<Reservation> reservations = (List<Reservation>) request.getAttribute("reservations");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Reservations | Ocean View Resort</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<div class="menu">
    <a href="customerdashboard.jsp">Dashboard</a>
    <a href="addReservation.jsp">Add Reservation</a>
    <a href="customerReservations" class="active">My Reservations</a>
    <a href="bill.jsp">Bill</a>
    <a href="logout">Logout</a>
</div>

<div class="container">
    <h2>My Reservations</h2>

    <table border="1" cellpadding="10" cellspacing="0" style="width:100%; margin-top:20px;">
        <thead>
            <tr>
                <th>ID</th>
                <th>Guest Name</th>
                <th>Room Type</th>
                <th>Check-In</th>
                <th>Check-Out</th>
                <th>Meals</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            <%
                if (reservations == null || reservations.isEmpty()) {
            %>
                <tr><td colspan="7" style="text-align:center;">No reservations found.</td></tr>
            <%
                } else {
                    for (Reservation r : reservations) {
                        String meals = "";
                        if(r.isBreakfast()) meals += "Breakfast ";
                        if(r.isLunch()) meals += "Lunch ";
                        if(r.isDinner()) meals += "Dinner";
            %>
                <tr>
                    <td><%= r.getReservationId() %></td>
                    <td><%= r.getGuestName() %></td>
                    <td><%= r.getRoomType() %></td>
                    <td><%= r.getCheckIn() %></td>
                    <td><%= r.getCheckOut() %></td>
                    <td><%= meals %></td>
                    <td><%= r.getStatus() %></td>
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