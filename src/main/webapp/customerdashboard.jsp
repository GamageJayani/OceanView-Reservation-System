<%@ page import="com.icbt.oceanview.model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null || !"CUSTOMER".equals(user.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<title>Customer Dashboard | Ocean View Resort</title>
<link rel="stylesheet" href="css/style.css">

<style>
.hero {
    background: url("images/hotel_banner.jpg") center/cover;
    height: 250px;
    border-radius: 10px;
    margin: 20px 0;
}

.gallery {
    display: flex;
    gap: 15px;
    margin-top: 20px;
}

.gallery img {
    width: 32%;
    border-radius: 10px;
    box-shadow: 0 5px 15px rgba(0,0,0,0.2);
}

.section {
    padding: 20px;
    background: #f8fbff;
    border-radius: 10px;
    margin-top: 20px;
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
</style>
</head>

<body>

<!-- 🔹 NAV BAR -->
<div class="menu">
    <span class="logo">Ocean View Resort</span>

    <a href="customerdashboard.jsp">Dashboard</a>
    <a href="addReservation.jsp">Add Reservation</a>
    <a href="myReservations.jsp">My Reservations</a>
    <a href="bill.jsp">Bill</a>
    <a href="gallery.jsp">Gallery</a>
    <a href="help.jsp">Help</a>

    <span class="right">
        Welcome, <strong><%= user.getFullName() %></strong>
        <a href="logout" class="logout">Logout</a>
    </span>
</div>

<div class="section">
    <h2>Welcome to Ocean View Resort 🌊</h2>
    <p>
        Experience luxury, comfort, and breathtaking ocean views.
        Manage your reservations easily using the system below.
    </p>

    <!-- HERO IMAGE -->
    <div class="hero"></div>

    <!-- ABOUT -->
    <h3>About Our Hotel</h3>
    <p>
        Ocean View Resort is a premium beachside hotel located in Galle,
        offering elegant rooms, fine dining, and world-class hospitality.
    </p>

    <!-- GALLERY -->
    <div class="gallery">
        <img src="images/room.jpg">
        <img src="images/pool.jpg">
        <img src="images/beach.jpg">
    </div>

    <!-- QUICK ACTIONS -->
    <h3 style="margin-top:25px;">Quick Actions</h3>
    <div class="actions">
        <a href="addReservation.jsp">➕ Add Reservation</a>
        <a href="myReservations.jsp">📄 My Reservations</a>
        <a href="bill.jsp">💰 View Bill</a>
    </div>
</div>

</body>
</html>
