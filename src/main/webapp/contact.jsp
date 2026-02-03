<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Contact Us</title>
<link rel="stylesheet" href="css/style.css">

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

<div class="container">
    <h2>Contact Ocean View Resort</h2>
    <p>
        Need help with reservations or billing?  
        Use the message button to contact our admin team.
    </p>
    <p style="font-size:12px;color:gray;margin-top:10px;"> Ocean View Resort – Galle<br> 📞 077-2345678</p>
</div>

<div class="contact-btn" onclick="openMessagePopup()">
    💬 Message Us
</div>

<jsp:include page="message.jsp"/>

</body>
</html>
