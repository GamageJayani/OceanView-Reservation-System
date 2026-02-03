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
    <link rel="stylesheet" href="style.css">
</head>
<body>

<!-- 🔹 NAVBAR -->
<div class="menu">
<div class="container">
    <h2>Admin Dashboard</h2>

    <p style="background:#e0f2fe;
              padding:10px;
              border-radius:6px;
              color:#003366;
              font-weight:bold;">
        📩 You have <span style="color:red;">3</span> new messages
       <a href="adminmessages.jsp">
    Messages
    <% if (newMsgCount > 0) { %>
        <span style="color:red;">(<%= newMsgCount %>)</span>
    <% } %>
</a>
    </p>
</div>

    <span class="logo">Ocean View Resort</span>
    <a href="viewReservation.jsp">View Reservations</a>
    <a href="#about">About</a>
    <a href="help.jsp">Help</a>
    <a href="adminmessages.jsp">Messages</a>
    <a href="gallery.jsp">Gallery</a>
    <a href="logout" class="logout">Logout</a>
</div>

<!-- 🔹 LOGIN SUCCESS MESSAGE -->
<%
    String msg = (String) session.getAttribute("successMessage");
    if (msg != null) {
%>
    <div class="success-msg"><%= msg %></div>
<%
        session.removeAttribute("successMessage");
    }
%>

<!-- 🔹 HOTEL PHOTOS -->
<div class="section">
    <h2>Hotel Overview</h2>
    <div class="gallery">
        <img src="images/hotel1.jpg" alt="Hotel View 1">
        <img src="images/hotel2.jpg" alt="Hotel View 2">
        <img src="images/hotel3.jpg" alt="Hotel View 3">
    </div>
</div>

<!-- 🔹 ABOUT -->
<div class="section" id="about">
    <h2>About Ocean View Resort</h2>
    <p>
        Ocean View Resort is a luxury seaside hotel offering premium rooms,
        fine dining, and unforgettable experiences. As an administrator,
        you can manage reservations and support guests efficiently.
    </p>
</div>

<!-- 🔹 ADMIN INFO -->
<div class="section">
    <h2>Admin Panel</h2>
    <p>Welcome, <strong><%= user.getFullName() %></strong> 👋</p>
    <p>Administrator access granted.</p>
</div>
 <a href="adminmessages.jsp">Messages</a>

</body>
</html>
