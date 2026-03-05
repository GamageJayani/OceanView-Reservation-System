<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.icbt.oceanview.dao.MessageDAO, com.icbt.oceanview.model.Message, com.icbt.oceanview.model.User" %>

<%
    //  Customer protection
    User user = (User) session.getAttribute("user");
    if(user == null){
        response.sendRedirect("login.jsp");
        return;
    }

    MessageDAO dao = new MessageDAO();
    List<Message> messages = dao.getAllMessages(); // You can filter by user email if needed
%>

<!DOCTYPE html>
<html>
<head>
<title>Your Messages</title>
<link rel="stylesheet" href="css/style.css">
<style>
.container{
    max-width:800px;
    margin:50px auto;
    padding:20px;
    background:#f9f9f9;
    border-radius:8px;
    box-shadow:0 0 15px rgba(0,0,0,0.1);
}
.message-card{
    border:1px solid #ccc;
    border-radius:6px;
    padding:15px;
    margin-bottom:15px;
    background:white;
}
.message-card h4{
    margin:0 0 5px 0;
    color:#003366;
}
.message-card p{
    margin:3px 0;
}
.reply{
    margin-top:10px;
    padding:10px;
    background:#e8f4ff;
    border-left:4px solid #0077cc;
}
.status-new{
    color:green;
    font-weight:bold;
}
.status-replied{
    color:blue;
    font-weight:bold;
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
<h2>Your Messages</h2>

<% if(messages.isEmpty()){ %>
    <p>No messages found.</p>
<% } else { 
       for(Message m : messages){ 
           // Optional: show only messages for logged-in user
           if(!m.getSenderEmail().equals(user.getEmail())) continue;
%>
    <div class="message-card">
        <h4>Message #<%= m.getMessageId() %> - 
            <span class="<%= "NEW".equals(m.getStatus()) ? "status-new" : "status-replied" %>">
            <%= m.getStatus() %></span>
        </h4>
        <p><b>From:</b> <%= m.getSenderName() %> (<%= m.getSenderEmail() %>)</p>
        <p><b>Message:</b> <%= m.getMessageText() %></p>

        <% if("REPLIED".equals(m.getStatus()) && m.getReplyText() != null){ %>
            <div class="reply">
                <p><b>Admin Reply:</b> <%= m.getReplyText() %></p>
            </div>
        <% } else { %>
            <div class="reply">
                <p>No reply yet.</p>
            </div>
        <% } %>
    </div>
<%     } 
   } %>

</div>

</body>
</html>