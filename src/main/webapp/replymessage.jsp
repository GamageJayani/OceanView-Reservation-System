<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.icbt.oceanview.dao.MessageDAO"%>
<%@ page import="com.icbt.oceanview.model.Message"%>
<%@ page import="com.icbt.oceanview.model.User"%>
<%
User user = (User) session.getAttribute("user");
if(user == null || !"ADMIN".equals(user.getRole())){
    response.sendRedirect("login.jsp");
    return;
}
%>
<%
    Message m = null;

    try {
        int id = Integer.parseInt(request.getParameter("id"));
        MessageDAO dao = new MessageDAO();
        m = dao.getMessageById(id);
    } catch (Exception e) {
        m = null;
    }
%>

<!DOCTYPE html>
<html>
<head>
<title>Reply Message</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<!-- NAVBAR  -->
<div class="menu">
    <span class="logo">Ocean View Resort</span>

    <a href="admindashboard.jsp">Dashboard</a>
    <a href="allReservations.jsp">All Reservations</a>
    <a href="about.jsp">About</a>
    <a href="help.jsp">Help</a>
    <a href="adminmessages.jsp">Messages</a>
    <a href="admingallery.jsp">Gallery</a>
    <a href="rooms.jsp">Rooms</a>
    <a href="adminpayments.jsp">All Payments</a>
    <a href="contact.jsp">Contact</a>
	
    <span class="right">
        Welcome, <strong><%= user.getFullName() %></strong>
        <a href="logout" class="logout">Logout</a>
    </span>
</div>


<div class="container">

<% if (m == null) { %>

    <h3 style="color:red;">Message not found</h3>
    <a href="adminmessages.jsp">⬅ Back to Messages</a>

<% } else { %>

    <h2>Reply to Message</h2>

    <p><b>Name:</b> <%= m.getSenderName() %></p>
    <p><b>Email:</b> <%= m.getSenderEmail() %></p>
    <p><b>Message:</b> <%= m.getMessageText() %></p>

    <form action="replyMessage" method="post">

        <input type="hidden" name="messageId"
               value="<%= m.getMessageId() %>">

        <textarea name="reply"
                  rows="5"
                  style="width:100%;"
                  placeholder="Type your reply..." required></textarea>

        <button style="margin-top:10px;">Send Reply</button>
    </form>

    <br>
    <a href="adminmessages.jsp">⬅ Back to Messages</a>

<% } 

%>

</div>

</body>
</html>
