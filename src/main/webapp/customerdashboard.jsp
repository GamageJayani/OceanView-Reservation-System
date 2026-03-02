<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<meta charset="UTF-8">
<title>Customer Dashboard | Ocean View Resort</title>
<link rel="stylesheet" href="css/style.css">

<style>

/* 🔹 HERO BANNER STYLE (Template Design Style) */
/* 🔹 HERO BANNER (Image + Dark Blue Dull Effect) */
.hero {
    position: relative;
  
    margin: 10px 0;   /* Reduced margin */
    border-radius: 20px;
    overflow: hidden;   /* important for overlay */
}

.hero img {
    width: 100%;
    height: 420px;
    object-fit: cover;
    display: block;
}

/* 🔹 Dark Blue Dull Overlay */
.hero::after {
    content: "";
    position: absolute;
    inset: 0;
    background: rgba(10, 35, 90, 0.45); /* Dark blue dull shade */
}
.hero-content {
    position: relative;
    z-index: 2;
    max-width: 500px;
}

.hero-content h1 {
    font-size: 40px;
    margin-bottom: 10px;
}

.hero-content p {
    font-size: 12px; !important;
    margin-bottom: 20px;
}
/* Banner text overlay */
.hero-text {
    position: absolute;
    top: 50%;
    left: 50px;  /* matha side */
    transform: translateY(-50%);
    color: white;  /* visible font */
    max-width: 450px;
    font-size: 16px;
    line-height: 1.5;
    z-index: 2;
    text-shadow: 1px 1px 5px rgba(0,0,0,0.6);  /* text visible over image */
    background: rgba(0,0,0,0.2); /* subtle background to make text pop */
    padding: 15px;
    border-radius: 10px;
}

.hero-content .btn-book {
    padding: 12px 25px;
    background: #2563eb;
    color: white;
    border-radius: 6px;
    text-decoration: none;
    font-weight: bold;
}

.hero-content .btn-book:hover {
    background: #1e40af;
}

/* Discount Badge */
.discount-badge {
    position: absolute;
    top: 30px;
    left: 30px;
    background: white;
    color: #2563eb;
    font-weight: bold;
    padding: 15px;
    border-radius: 50%;
    width: 90px;
    height: 90px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 20px;
    box-shadow: 0 5px 15px rgba(0,0,0,0.3);
}

/* 🔹 Gallery (Keep Your Design Clean) */
.gallery {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    gap: 15px;
    margin-top: 20px;
}

.gallery img {
    width: 100%;
    height: 200px;
    object-fit: cover;
    border-radius: 10px;
    box-shadow: 0 5px 15px rgba(0,0,0,0.2);
}

/* 🔹 Section */
.section {
    padding: 10px;
    background: #f8fbff;
    border-radius: 10px;
    margin-top: 20px;
}

/* 🔹 Quick Actions */
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
.welcome-text {
    text-align: center;
    font-size: 13px;  
    color: #2563eb;  
    max-width: 700px;
    margin: 0 auto 10px auto;  /* center + spacing */
}

</style>
</head>

<body>

<!-- 🔹 NAV BAR (UNCHANGED) -->
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

    <h2>Welcome to Ocean View Resort 🌊</h2>
   <p class="welcome-text">
        Experience luxury, comfort, and breathtaking ocean views.
        Manage your reservations easily using the system below.
    </p>

  
   <div class="hero">
    <img src="images/banner1.jpg" alt="Hotel Banner">
    <div class="hero-text">
        <h3>About Our Hotel</h3>
        <p>
            Ocean View Resort is a premium beachside hotel located in Galle,
            offering elegant rooms, fine dining, and world-class hospitality.
        </p>
    </div>
</div>
    <!-- GALLERY -->
    <div class="gallery">
        <img src="images/galleryimage0.jpeg">
        <img src="images/galleryimage2.jpeg">
        <img src="images/galleryimage3.jpeg">
    </div>

    <!-- QUICK ACTIONS -->
    <h3 style="margin-top:25px;"></h3>
    <div class="actions">
        <a href="addReservation.jsp">➕ Add Reservation</a>
        <a href="myReservations.jsp">📄 My Reservations</a>
        <a href="bill.jsp">💰 View Bill</a>
    </div>

</div>

</body>
</html>