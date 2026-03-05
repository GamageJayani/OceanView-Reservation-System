<%@ page import="com.icbt.oceanview.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.icbt.oceanview.dao.MessageDAO" %>

<%
    // 🔐 ADMIN PAGE PROTECTION
    User user = (User) session.getAttribute("user");
    if (user == null || !"ADMIN".equals(user.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<%
    MessageDAO msgDao = new MessageDAO();
    int newMsgCount = msgDao.getNewMessageCount();
%>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard | Ocean View Resort</title>

  
    <link rel="stylesheet" href="css/style.css">

    <style>
        
        .section {
            padding: 20px;
            background: rgba(255,255,255,0.95);
            border-radius: 10px;
            margin: 20px;
        }
        .info-section{
           background:#003366;      /* Dark blue */
    	   color:white;             /* White text */
    	   padding:8px 16px;
    	   border-radius:10px;
    	   font-size:16px;
    	   font-family:Arial, sans-serif;
    	   margin:20px;
    	   
    	   
    	   white-space: nowrap;     /* Single line */
    	   overflow: hidden;        
    	   text-overflow: ellipsis; 
        }
        .info-section strong{
           font-weight:bold;
        }

        /* 🔹 Gallery same look */
        .gallery {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 15px;
            margin-top: 10px;
        }

        .gallery img {
            width: 100%;
            height: 200px;
            object-fit: cover;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }

        /* 🔹 Message box styling */
        .msg-box {
            background:#e0f2fe;
            padding:15px;
            border-radius:8px;
            color:#003366;
            font-weight:bold;
            margin-bottom:20px;
        }

        .msg-box span {
            color:red;
        }

    </style>
</head>

<body>

<!-- NAVBAR  -->
<div class="menu">
    <span class="logo">Ocean View Resort</span>

    <a href="admindashboard.jsp">Home</a>
    <a href="AdminReservationServlet">All Reservations</a>
    <a href="about.jsp">About</a>
    <a href="help.jsp">Help</a>
    <a href="adminmessages.jsp">Messages</a>
    <a href="admingallery.jsp">Gallery</a>
    <a href="rooms.jsp">Rooms</a>
    <a href="adminpayments.jsp">All Payments</a>
    <a href="viewFeedback.jsp">Feedback</a>
    <a href="contact.jsp">Contact</a>
	
    <span class="right">
        Welcome, <strong><%= user.getFullName() %></strong>
        <a href="logout" class="logout">Logout</a>
    </span>
</div>


<!-- 🔹 MAIN CONTENT -->
<div class="section">

    <h2>Welcome to Ocean View Resort 🌊</h2>

    <!-- 📩 New Messages -->
    <div class="msg-box">
        📩 You have <span><%= newMsgCount %></span> new messages
        <a href="adminmessages.jsp">
            <% if (newMsgCount > 0) { %>
                (<%= newMsgCount %>)
            <% } %>
        </a>
    </div>

    <!-- 🔹 LOGIN SUCCESS MESSAGE -->
    <%
        String msg = (String) session.getAttribute("successMessage");
        if (msg != null) {
    %>
        <div class="alert alert-success"><%= msg %></div>
    <%
            session.removeAttribute("successMessage");
        }
    %>

    <!-- 🔹 HOTEL PHOTOS -->
    
    <h3>Hotel Overview</h3>
    <p>
         A premium seaside hotel located in Galle,
        offering guests a luxurious and relaxing stay with breathtaking ocean views.
        Our resort combines comfort, modern facilities, and exceptional hospitality
        to create unforgettable experiences.
    </p>
    
    <div class="gallery">
        <img src="images/hotelView1.jpeg" alt="Hotel View 1">
        <img src="images/hotelstaff.jpg" alt="Hotel View 2">
        <img src="images/hotellobby.jpeg" alt="Hotel View 3">
    </div>

</div>

<!-- 🔹 ABOUT -->
<div class="section" id="about">
   
    <p>
        Ocean View Resort is a luxury seaside hotel offering premium rooms,
        fine dining, and unforgettable experiences. As an administrator,
        you can manage reservations and support guests efficiently.
    </p>
</div>

<!-- 🔹 ADMIN INFO -->
<div class="info-section">
    <p>Welcome, <strong><%= user.getFullName() %></strong> 👋 <br>Administrator access granted.</p>
    
</div>

</body>
</html>