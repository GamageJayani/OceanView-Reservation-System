<%@ page language="java" import="com.icbt.oceanview.dao.PaymentDAO,com.icbt.oceanview.model.Payment,java.util.List,com.icbt.oceanview.model.User" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    User user = (User)session.getAttribute("user");
    if(user == null || !"ADMIN".equals(user.getRole())){
        response.sendRedirect("login.jsp");
        return;
    }

    PaymentDAO dao = new PaymentDAO();
    List<Payment> payments = dao.getAllPayments();
%>


<!DOCTYPE html>
<html>
<head>
<title>All Payments (Admin)</title>
<link rel="stylesheet" href="css/style.css">
<style>
	.menu {background-color: #003366;color: white;display: flex;align-items: center;justify-content: space-between; padding: 10px 20px;font-family: Arial, sans-serif;border-radius: 5px;}
	.menu .logo {font-weight: bold;font-size: 20px;}
	.menu a {color: white;text-decoration: none;margin-right: 15px;padding: 5px 10px;border-radius: 4px;}
	.menu a:hover {background-color: #0059b3;}
	.menu .right {
    margin-left: auto; font-size: 14px;}
    .menu .logout {margin-left: 10px; color: #ffcccc;}
	.menu .logout:hover {color: #ff6666;}
	.pay-container { max-width:1000px; margin:50px auto; background:#f4f6fa; padding:20px; border-radius:8px;}
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
</div>
<div class="pay-container">
<h2>All Payments</h2>
<table class="table">
<tr>
<th>Invoice</th>
<th>Customer ID</th>
<th>Room</th>
<th>Amount</th>
<th>Method</th>
<th>Status</th>
<th>Date</th>
<th>Action</th>
</tr>

<% for(Payment p : payments) { %>
<tr>
<td><%= p.getInvoiceNo() %></td>
<td><%= p.getUserId() %></td>
<td><%= p.getRoomId() %></td>
<td>LKR <%= p.getAmount() %></td>
<td><%= p.getMethod() %></td>
<td><%= p.getStatus() %></td>
<td><%= p.getCreatedAt() %></td>
<td><a href="invoice.jsp?paymentId=<%= p.getPaymentId() %>">View Invoice</a></td>
</tr>
<% } %>
</table>
</div>
</body>
</html>