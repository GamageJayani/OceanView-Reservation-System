<%@ page import="java.util.List"%>
<%@ page import="com.icbt.oceanview.dao.MessageDAO"%>
<%@ page import="com.icbt.oceanview.model.Message"%>
<%@ page import="com.icbt.oceanview.model.User"%>

<%
    // ADMIN SECURITY
    User user = (User) session.getAttribute("user");
    if (user == null || !"ADMIN".equals(user.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }

    MessageDAO dao = new MessageDAO();
    List<Message> messages = dao.getAllMessages();
%>

<!DOCTYPE html>
<html>
<head>
<title>Admin | Messages</title>
<link rel="stylesheet" href="css/style.css">
<style>
.msg-container{
    max-width: 1000px;  
    margin: 50px auto;   
    padding: 30px;       
    background: #f9f9f9;
    border-radius: 8px;
    box-shadow: 0 0 20px rgba(0,0,0,0.15);
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


<div class="msg-container">
<h2>Customer Messages</h2>

<% if ("true".equals(request.getParameter("deleted"))) { %>
    <p style="color:red;">Message deleted successfully</p>
<% } %>

<table class="table">
<tr>
    <th>ID</th>
    <th>Name</th>
    <th>Email</th>
    <th>Message</th>
    <th>Status</th>
    <th>Action</th>
</tr>

<% for (Message m : messages) { %>
<tr>
    <td><%= m.getMessageId() %></td>
    <td><%= m.getSenderName() %></td>
    <td><%= m.getSenderEmail() %></td>
    <td><%= m.getMessageText() %></td>
    <td><%= m.getStatus() %></td>
    <td>
        <a href="replymessage.jsp?id=<%= m.getMessageId() %>">Reply</a> |
        <a href="deleteMessage?id=<%= m.getMessageId() %>"
           onclick="return confirm('Delete this message?');"
           style="color:red;">Delete</a>
           
    </td>
</tr>
<% } %>

</table>

<p style="font-size:12px;color:gray;">
* Messages received from Contact popup
</p>

</div>

</body>
</html>
