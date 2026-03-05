<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.icbt.oceanview.model.Reservation" %>
<%@ page import="com.icbt.oceanview.model.User" %>

<%
User user = (User) session.getAttribute("user");
if(user == null){
    response.sendRedirect("login.jsp");
    return;
}

// Get Reservation object from servlet
Reservation r = (Reservation) request.getAttribute("reservation");
if (r == null) {
%>
<h3 style="color:red;">Reservation details not available</h3>
<p>Please access the bill through the View Reservation page.</p>
<a href="viewReservation.jsp"><button>Go Back</button></a>
<%
    return;
}

// Bill details
long nights = (Long) request.getAttribute("nights");
double rate = (Double) request.getAttribute("rate");
double roomTotal = (Double) request.getAttribute("roomTotal");
double mealTotal = (Double) request.getAttribute("mealTotal");
double serviceCharge = (Double) request.getAttribute("serviceCharge");
double grandTotal = (Double) request.getAttribute("grandTotal");

String billNumber = (String) request.getAttribute("billNumber");
String paymentStatus = (String) request.getAttribute("paymentStatus");
String paymentMethod = (String) request.getAttribute("paymentMethod");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Ocean View Resort - Bill</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
    <style>
        body { font-family: Arial,sans-serif; background-color: #f2f8fb; color:#333; margin:0; padding:0; }
        .bill-container { max-width:1000px; margin:50px auto; background:#fff; padding:25px 40px; box-shadow:0 0 10px rgba(0,0,0,0.1); border-radius:8px; }
        h2,h3{color:#003366; text-align:center;}
        table {width:100%; border-collapse:collapse; margin-top:15px;}
        th,td {border:1px solid #ccc; padding:10px; text-align:left;}
        th {background-color:#003366;color:#fff;}
        .total-row td{font-weight:bold;}
        .grand-total {font-size:20px; color:#003366;}
        .buttons{margin-top:20px;}
        .buttons button{margin-right:10px; margin-bottom: 5px;}
        @media print{body{background:#fff;color:#000;}.container{box-shadow:none;margin:0;padding:0;width:100%;border-radius:0;}button{display:none;}}
    </style>
</head>
<body>

<div class="bill-container">

<h2>Ocean View Resort</h2>
<h3>Reservation Bill</h3>

<p><b>Bill No:</b> <%= billNumber %> | <b>Status:</b> <%= paymentStatus %> | <b>Payment Method:</b> <%= paymentMethod %></p>
<hr>

<h4>Guest Details</h4>
<p>
    <b>Name:</b> <%= r.getGuestName() %><br>
    <b>Contact:</b> <%= r.getContactNumber() %><br>
    <b>Address:</b> <%= r.getAddress() %>
</p>
<hr>

<h4>Stay Details</h4>
<p>
    <b>Room Type:</b> <%= r.getRoomType() %><br>
    <b>Check-In:</b> <%= r.getCheckIn() %><br>
    <b>Check-Out:</b> <%= r.getCheckOut() %><br>
    <b>Total Nights:</b> <%= nights %>
</p>
<hr>

<h4>Cost Breakdown</h4>
<table>
    <tr>
        <th>Description</th>
        <th>Rate (LKR)</th>
        <th>Qty</th>
        <th>Total (LKR)</th>
    </tr>
    <tr>
        <td>Room (<%= r.getRoomType() %>)</td>
        <td><%= rate %></td>
        <td><%= nights %></td>
        <td><%= roomTotal %></td>
    </tr>
    <tr>
        <td>Breakfast</td>
        <td>1500</td>
        <td><%= r.isBreakfast()?1:0 %></td>
        <td><%= r.isBreakfast()?1500:0 %></td>
    </tr>
    <tr>
        <td>Lunch</td>
        <td>2500</td>
        <td><%= r.isLunch()?1:0 %></td>
        <td><%= r.isLunch()?2500:0 %></td>
    </tr>
    <tr>
        <td>Dinner</td>
        <td>3000</td>
        <td><%= r.isDinner()?1:0 %></td>
        <td><%= r.isDinner()?3000:0 %></td>
    </tr>
    <tr class="total-row">
        <td colspan="3">Service Charge (10%)</td>
        <td><%= serviceCharge %></td>
    </tr>
    <tr class="grand-total">
        <td colspan="3">Grand Total</td>
        <td><%= grandTotal %></td>
    </tr>
</table>

<div class="buttons">
    <button onclick="window.print()">Print Bill</button>
    <br>
    <% if("Pending".equals(paymentStatus)){ %>
        <a href="payment.jsp?id=<%= r.getReservationId() %>">
            <button type="button">Proceed to Payment</button>
        </a>
    <% } %>
    <br>
    <a href="customerdashboard.jsp">
        <button type="button">Back</button>
    </a>
</div>

</div>
</body>
</html>