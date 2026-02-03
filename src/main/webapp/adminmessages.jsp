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
</head>
<body>

<div class="menu">
    <span class="logo">Ocean View Resort</span>
    <a href="admindashboard.jsp">Dashboard</a>
    <a href="adminmessages.jsp">Messages</a>
    <a href="allreservations.jsp">Reservations</a>
    <a href="logout.jsp" class="logout">Logout</a>
</div>

<div class="container">
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
