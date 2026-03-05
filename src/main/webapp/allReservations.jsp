<%@ page import="java.util.List, com.icbt.oceanview.model.User, com.icbt.oceanview.model.Reservation" %>

<%
    User user = (User) session.getAttribute("user");
    if(user == null || !"ADMIN".equals(user.getRole())){
        response.sendRedirect("login.jsp");
        return;
    }

    List<Reservation> reservations = (List<Reservation>) request.getAttribute("reservations");
%>

<!DOCTYPE html>
<html>
<head>
<title>All Reservations</title>
<link rel="stylesheet" href="css/style.css">
<style>
.all-container { max-width: 1000px; margin: 30px auto; background:#f4f6fa; padding:20px; border-radius:8px;}
.table { width:100%; border-collapse: collapse; margin-top:20px;}
.table th, .table td { border:1px solid #ddd; padding:10px; text-align:center;}
.table th { background:#003366; color:white;}
.action-btn { padding:5px 10px; background:#28a745; color:white; text-decoration:none; border-radius:4px;}
</style>
</head>
<body>

<!-- NAVBAR  -->
<div class="menu">
    <span class="logo">Ocean View Resort</span>

    <a href="admindashboard.jsp">Home</a>
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
<div class="all-container">
<h2>All Reservations</h2>

<table class="table">
<tr>
<th>ID</th>
<th>User</th>
<th>Room</th>
<th>Status</th>
<th>Payment</th>
</tr>

<%
if(reservations != null) {
    for(Reservation r : reservations) {
%>
<tr>
<td><%= r.getReservationId() %></td>
<td><%= r.getGuestName() %></td>
<td><%= r.getRoomType() %></td>
<td><%= r.getStatus() %></td>
<td>
<a class="action-btn"
href="payment.jsp?reservationId=<%= r.getReservationId() %>&roomId=<%= r.getRoomId() %>">
Make Payment
</a>
</td>
</tr>
<%
    }
}
%>
</table>
</div>

</body>
</html>