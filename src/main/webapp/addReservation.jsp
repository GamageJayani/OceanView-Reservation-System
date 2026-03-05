<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.icbt.oceanview.model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if(user == null || !"CUSTOMER".equals(user.getRole())){
        response.sendRedirect("login.jsp");
        return;
    }

    String error = request.getParameter("error");
    String success = request.getParameter("success");
    String guestName = request.getParameter("guestName") != null ? request.getParameter("guestName") : "";
    String address = request.getParameter("address") != null ? request.getParameter("address") : "";
    String contactNumber = request.getParameter("contact_number") != null ? request.getParameter("contact_number") : user.getPhone();
    String roomType = request.getParameter("roomType") != null ? request.getParameter("roomType") : "";
    String checkIn = request.getParameter("checkIn") != null ? request.getParameter("checkIn") : "";
    String checkOut = request.getParameter("checkOut") != null ? request.getParameter("checkOut") : "";
    boolean breakfast = request.getParameter("breakfast") != null;
    boolean lunch = request.getParameter("lunch") != null;
    boolean dinner = request.getParameter("dinner") != null;
%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Reservation | Ocean View Resort</title>
    <link rel="stylesheet" href="css/style.css">
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
    <h2>Add New Reservation</h2>

    <% if("1".equals(success)) { %>
        <p style="color:green; background:#e6ffe6; padding:10px; border-radius:5px;">
            Reservation added successfully!
        </p>
    <% } %>

    <% if("dates".equals(error)) { %>
        <p style="color:red;">Check-out date must be after check-in date!</p>
    <% } else if("noRoom".equals(error)) { %>
        <p style="color:red;">No available room for selected type.</p>
    <% } else if("server".equals(error)) { %>
        <p style="color:red;">Server error occurred. Try again.</p>
    <% } %>

    <form action="addReservation" method="post">
        <input type="text" name="guestName" placeholder="Guest Full Name" required value="<%=guestName%>">
        <input type="text" name="address" placeholder="Address" required value="<%=address%>">
        <input type="text" name="contact_number" value="<%=contactNumber%>" readonly>

        <select name="roomType" required>
            <option value="">-- Select Room Type --</option>
            <option value="Single" <%= "Single".equals(roomType) ? "selected" : "" %>>Single</option>
            <option value="Double" <%= "Double".equals(roomType) ? "selected" : "" %>>Double</option>
            <option value="Standard" <%= "Standard".equals(roomType) ? "selected" : "" %>>Standard</option>
            <option value="Deluxe" <%= "Deluxe".equals(roomType) ? "selected" : "" %>>Deluxe</option>
            <option value="Family" <%= "Family".equals(roomType) ? "selected" : "" %>>Family</option>
        </select>

        <label>Check-In Date</label>
        <input type="date" name="checkIn" required value="<%=checkIn%>">

        <label>Check-Out Date</label>
        <input type="date" name="checkOut" required value="<%=checkOut%>">

        <h4>Meal Options</h4>
        <input type="checkbox" name="breakfast" <%= breakfast ? "checked" : "" %>> Breakfast (LKR 1500)<br>
        <input type="checkbox" name="lunch" <%= lunch ? "checked" : "" %>> Lunch (LKR 2500)<br>
        <input type="checkbox" name="dinner" <%= dinner ? "checked" : "" %>> Dinner (LKR 3000)<br><br>

        <button type="submit">Save Reservation</button>
    </form>
    <br>
    <p style="font-size:14px;color:gray;">
        * Reservations are charged per night
    </p>
</div>

</body>
</html>