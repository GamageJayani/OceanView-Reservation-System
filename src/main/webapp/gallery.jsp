<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.icbt.oceanview.dao.GalleryDAO" %>
<%@ page import="com.icbt.oceanview.model.GalleryImage" %>
<%
    com.icbt.oceanview.model.User user = (com.icbt.oceanview.model.User) session.getAttribute("user");
%>
<%
List<GalleryImage> images = new GalleryDAO().getAllImages();
%>

<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">


    <title>Gallery | Ocean View Resort</title>
    <style>
        body {
    margin: 0;
    font-family: Arial, sans-serif;
    linear-gradient(rgba(0,0,0,0.6), rgba(0,0,0,0.6));
    background: url('images/background6.jpeg') no-repeat center center fixed;
    background-size: cover; /* Makes it fill the screen nicely */
    
    
	}
	html, body {
    overflow-x: hidden;
}
	.menu {
    width: 100%;
    background-color: #003366;
    color: white;
    display: flex;
    align-items: center;
    padding: 12px 20px;
    box-sizing: border-box;
    flex-wrap: wrap;   /* Allow wrap if space not enough */
}

.menu .logo {
    font-weight: bold;
    font-size: 20px;
    margin-right: 25px;
}

.menu a {
    color: white;
    text-decoration: none;
    margin-right: 15px;
    padding: 6px 10px;
    border-radius: 4px;
    transition: 0.3s;
}

.menu a:hover {
    background-color: #0059b3;
}

.menu .right {
    margin-left: auto;
    font-size: 14px;
}

.menu .logout {
    margin-left: 10px;
    color: #ffcccc;
}

.menu .logout:hover {
    color: #ff6666;
    }

        .container {
            width: 90%;
            max-width: 1200px;
            margin: 40px auto;
        }

        h1 {
            text-align: center;
            color: #FFFFFF;
            margin-bottom: 10px;
        }

        .subtitle {
            text-align: center;
            color: #ffffff !important;
            margin-bottom: 40px;
            font-weight: bold;
        }

        .gallery {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
        }

        .card {
            background: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 6px 18px rgba(0,0,0,0.12);
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .card:hover {
            transform: scale(1.03);
            box-shadow: 0 10px 24px rgba(0,0,0,0.18);
        }

        .card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
            display: block;
        }

        .caption {
            padding: 10px 15px;
            text-align: center;
            font-weight: bold;
            color: #003366;
            background: #f0f4f8;
        }

        .note {
            margin-top: 40px;
            text-align: center;
            color: #ffffff !important;
            font-size: 16px;
        }

        /* Mobile tweaks */
        @media (max-width: 500px) {
            .card img {
                height: 150px;
            }
        }
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

    <h1>Hotel Gallery</h1>
    <p class="subtitle">Explore the beauty of Ocean View Resort</p>

    <div class="gallery">
        <!-- Dynamic images from database -->
        <% for(GalleryImage g : images){ %>
            <div class="card">
                <img src="images/gallery/<%= g.getImageName() %>" alt="<%= g.getTitle() %>">
                <div class="caption"><%= g.getTitle() %></div>
            </div>
        <% } %>

        <!-- Static demo images -->
        <div class="card">
            <img src="images/room1.jpg" alt="Deluxe Room">
            <div class="caption">Deluxe Room</div>
        </div>
        <div class="card">
            <img src="images/room2.jpg" alt="Sea View Room">
            <div class="caption">Sea View Room</div>
        </div>
        <div class="card">
            <img src="images/pool.jpg" alt="Infinity Pool">
            <div class="caption">Infinity Pool</div>
        </div>
        <div class="card">
            <img src="images/restaurant.jpg" alt="Ocean Restaurant">
            <div class="caption">Ocean Restaurant</div>
        </div>
        <div class="card">
            <img src="images/lobby.jpg" alt="Hotel Lobby">
            <div class="caption">Hotel Lobby</div>
        </div>
        <div class="card">
            <img src="images/beach.jpg" alt="Private Beach View">
            <div class="caption">Private Beach View</div>
        </div>
    </div>

    <p class="note">
        * Images are for demonstration purposes of the Room Reservation System
    </p>

</div>

</body>
</html>