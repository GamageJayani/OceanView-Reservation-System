<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.icbt.oceanview.dao.GalleryDAO" %>
<%@ page import="com.icbt.oceanview.model.GalleryImage" %>

<%
List<GalleryImage> images = new GalleryDAO().getAllImages();
%>

<!DOCTYPE html>
<html>
<head>
    <title>Gallery | Ocean View Resort</title>

    <style>
        body{
            margin:0;
            font-family:Arial, sans-serif;
            background:#f4f7fb;
        }

        .container{
            width:90%;
            margin:40px auto;
        }

        h1{
            text-align:center;
            color:#003366;
            margin-bottom:10px;
        }

        .subtitle{
            text-align:center;
            color:#555;
            margin-bottom:40px;
        }

        .gallery{
            display:grid;
            grid-template-columns:repeat(auto-fit, minmax(250px,1fr));
            gap:20px;
        }

        .card{
            background:white;
            border-radius:10px;
            overflow:hidden;
            box-shadow:0 6px 18px rgba(0,0,0,0.12);
            transition:transform 0.3s;
        }

        .card:hover{
            transform:scale(1.03);
        }

        .card img{
            width:100%;
            height:200px;
            object-fit:cover;
        }

        .caption{
            padding:15px;
            text-align:center;
            font-weight:bold;
            color:#003366;
        }

        .note{
            margin-top:40px;
            text-align:center;
            color:#666;
            font-size:14px;
        }
    </style>
</head>

<body>

<div class="container">

    <h1>Hotel Gallery</h1>
    
    <div class="gallery">
<% for(GalleryImage g : images){ %>
    <div class="card">
        <img src="images/gallery/<%= g.getImageName() %>">
        <div class="caption"><%= g.getTitle() %></div>
    </div>
<% } %>
</div>      

    <p class="subtitle">Explore the beauty of Ocean View Resort</p>

    <div class="gallery">

        <div class="card">
            <img src="images/room1.jpg" alt="Deluxe Room">
            <div class="caption">Deluxe Room</div>
        </div>

        <div class="card">
            <img src="images/room2.jpg" alt="Sea View Room">
            <div class="caption">Sea View Room</div>
        </div>

        <div class="card">
            <img src="images/pool.jpg" alt="Swimming Pool">
            <div class="caption">Infinity Pool</div>
        </div>

        <div class="card">
            <img src="images/restaurant.jpg" alt="Restaurant">
            <div class="caption">Ocean Restaurant</div>
        </div>

        <div class="card">
            <img src="images/lobby.jpg" alt="Lobby">
            <div class="caption">Hotel Lobby</div>
        </div>

        <div class="card">
            <img src="images/beach.jpg" alt="Beach View">
            <div class="caption">Private Beach View</div>
        </div>

    </div>

    <p class="note">
        * Images are for demonstration purposes of the Room Reservation System
    </p>

</div>

</body>
</html>
