<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.icbt.oceanview.model.User"%>

<%
    User user = (User) session.getAttribute("user");
    if(user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    String backUrl = "customerdashboard.jsp"; // default back url
    if ("ADMIN".equals(user.getRole())) {
        backUrl = "admindashboard.jsp";
    }
%>

<!DOCTYPE html>
<html>
<head>
<title>Contact Us</title>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<style>
/* Floating button */
.contact-btn {
    position: fixed;
    right: 20px;
    bottom: 30px;
    background: #003366;
    color: white;
    padding: 15px 20px;
    border-radius: 50px;
    cursor: pointer;
    box-shadow: 0 5px 15px rgba(0,0,0,0.3);
    font-weight: bold;
}

/* Popup overlay */
.popup-bg {
    display: none;
    position: fixed;
    top: 0; left: 0;
    width: 100%; height: 100%;
    background: rgba(0,0,0,0.5);
}

/* Popup box */
.popup {
    background: white;
    width: 380px;
    padding: 20px;
    border-radius: 8px;
    position: fixed;
    right: 30px;
    bottom: 90px;
    box-shadow: 0 10px 25px rgba(0,0,0,0.4);
}

/* Close button */
.close-btn {
    float: right;
    cursor: pointer;
    color: red;
    font-weight: bold;
}
</style>

<script>
function openContact() {
    document.getElementById("popupBg").style.display = "block";
}

function closeContact() {
    document.getElementById("popupBg").style.display = "none";
}
</script>

</head>
<body>
<div class="menu">
    <span class="logo">Ocean View Resort</span>
    <br>
   <a href="<%= backUrl %>" class="back-button">Back to Dashboard</a>
   
    <span class="right">
        Welcome, <strong><%= user.getFullName() %></strong>
        <a href="logout" class="logout">Logout</a>
    </span>
</div>
<br>
<div class="container">
    <h2>Contact Ocean View Resort</h2>
    <p>
        Need help with reservations or billing?  
        Use the message button to contact our admin team.
    </p>
    <div class="contact-info">
    <p style="font-size:14px;color:gray;margin-top:10px;"> Ocean View Resort – Galle</p>
    <p style="font-size:14px;color:gray;margin-top:10px;"><i class="fa fa-phone"></i> : +94 77 2 345 678</p>
    <p style="font-size:14px;color:gray;margin-top:10px;"><i class="fa fa-envelope"></i> : info@oceanview.com</p>
    <p style="font-size:14px;color:gray;margin-top:10px;"><i class="fa fa-map-marker"></i> : 123 Ocean View St, Galle</p>
    <p style="font-size:14px;color:gray;margin-top:10px;"><i class="fa fa-globe"></i> : <a href="https://www.oceanview.com">www.oceanviewresort.com</a></p>
</div>
</div>
<div class="contact-btn" onclick="openMessagePopup()">
    💬 Message Us
</div>

<jsp:include page="message.jsp"/>

</body>
</html>
