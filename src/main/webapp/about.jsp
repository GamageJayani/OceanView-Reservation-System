<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>About Us | Ocean View Resort</title>

    <style>
        body{
            font-family: Arial, sans-serif;
            background:#f4f7fb;
            margin:0;
            padding:0;
        }

        .container{
            width:85%;
            margin:40px auto;
            background:white;
            padding:40px;
            border-radius:10px;
            box-shadow:0 8px 25px rgba(0,0,0,0.1);
        }

        h1{
            text-align:center;
            color:#003366;
            margin-bottom:40px;
        }

        h3{
            color:#0059b3;
            margin-top:35px;
        }

        p{
            line-height:1.8;
            color:#333;
        }

        .grid{
            display:grid;
            grid-template-columns:repeat(auto-fit, minmax(250px,1fr));
            gap:25px;
            margin-top:25px;
        }

        .card{
            background:#f8fbff;
            padding:25px;
            border-radius:8px;
            box-shadow:0 4px 12px rgba(0,0,0,0.08);
        }

        .card h4{
            margin-top:0;
            color:#003366;
        }

        .highlight{
            background:#eef6ff;
            padding:20px;
            border-left:5px solid #0077cc;
            margin-top:30px;
            border-radius:5px;
        }

        .contact-box{
            margin-top:40px;
            padding:25px;
            background:#003366;
            color:white;
            text-align:center;
            border-radius:8px;
        }

        .contact-box a{
            display:inline-block;
            margin-top:15px;
            background:white;
            color:#003366;
            padding:10px 18px;
            border-radius:5px;
            text-decoration:none;
            font-weight:bold;
        }

        .contact-box a:hover{
            background:#e6f0ff;
        }
    </style>
</head>

<body>

<div class="container">

    <h1>About Ocean View Resort</h1>

    <!-- INTRO -->
    <p>
        <strong>Ocean View Resort</strong> is a premium seaside hotel located in Galle,
        offering guests a luxurious and relaxing stay with breathtaking ocean views.
        Our resort combines comfort, modern facilities, and exceptional hospitality
        to create unforgettable experiences.
    </p>

    <!-- VISION & MISSION -->
    <div class="grid">
        <div class="card">
            <h4>🌟 Our Vision</h4>
            <p>
                To become a leading seaside resort in Sri Lanka by delivering
                exceptional hospitality and memorable guest experiences.
            </p>
        </div>

        <div class="card">
            <h4>🎯 Our Mission</h4>
            <p>
                To provide high-quality accommodation, excellent customer service,
                and a seamless online reservation system for all our guests.
            </p>
        </div>
    </div>

    <!-- SYSTEM FEATURES -->
    <h3>System Features</h3>
    <div class="grid">
        <div class="card">
            <h4>🛏 Online Room Reservation</h4>
            <p>
                Customers can easily book rooms by selecting room types,
                dates, and optional meal services.
            </p>
        </div>

        <div class="card">
            <h4>🔐 Secure User Management</h4>
            <p>
                Separate login access for customers and administrators
                ensures secure and efficient system usage.
            </p>
        </div>

        <div class="card">
            <h4>💰 Automated Billing</h4>
            <p>
                The system automatically calculates bills based on
                room rates, stay duration, and meal selections.
            </p>
        </div>

        <div class="card">
            <h4>📩 Admin Communication</h4>
            <p>
                Customers can send messages to administrators,
                and admins can manage and reply through the system.
            </p>
        </div>
    </div>

    <!-- WHY CHOOSE US -->
    <h3>Why Choose Ocean View Resort?</h3>
    <ul>
        <li>Beautiful ocean-view rooms 🌊</li>
        <li>Comfortable and modern accommodation</li>
        <li>Easy online booking system</li>
        <li>Professional and friendly staff</li>
        <li>Transparent pricing and billing</li>
    </ul>

    <div class="highlight">
        <strong>Note:</strong>  
        This Room Reservation System is designed to improve efficiency,
        accuracy, and customer satisfaction through digital automation.
    </div>

    <!-- CONTACT -->
    <div class="contact-box">
        <h3>Need More Information?</h3>
        <p>
            If you have any questions about our resort or services,
            feel free to contact us.
        </p>
        <a href="help.jsp">Visit Help &amp; Support</a>
    </div>

</div>

</body>
</html>
