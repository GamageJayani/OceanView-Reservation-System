<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.icbt.oceanview.dao.DBConnection" %>
<%@ page import="com.icbt.oceanview.model.User" %>

<%
    User user = (User) session.getAttribute("user");
    if (user == null) { response.sendRedirect("login.jsp"); return; }

    String error = request.getParameter("error");
    String reservationIdParam = request.getParameter("reservationId"); 

    double amount = 0.0;
    String roomType = "";
    if (reservationIdParam != null && !reservationIdParam.isEmpty()) {
        try {
            int reservationId = Integer.parseInt(reservationIdParam);

            try (Connection con = DBConnection.getConnection()) {
                String sql = "SELECT r.id, r.breakfast, r.lunch, r.dinner, rm.price, rm.type " +
                             "FROM reservations r " +
                             "JOIN rooms rm ON r.room_id = rm.id " +
                             "WHERE r.id=?";
                try (PreparedStatement ps = con.prepareStatement(sql)) {
                    ps.setInt(1, reservationId);
                    try (ResultSet rs = ps.executeQuery()) {
                        if (rs.next()) {
                            double basePrice = rs.getDouble("price");
                            amount = basePrice;

                            // Add meals price
                            if (rs.getBoolean("breakfast")) amount += 1500;
                            if (rs.getBoolean("lunch")) amount += 2500;
                            if (rs.getBoolean("dinner")) amount += 3000;

                            roomType = rs.getString("type");
                        } else {
                            error = "noReservation";
                        }
                    }
                }
            }
        } catch(Exception e) {
            e.printStackTrace();
            error = "server";
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Process Payment</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        .payment-container {
            max-width: 600px;
            margin: 50px auto;
            background:#f4f6fa;
            padding:20px;
            border-radius:8px;
        }
        .payment-container h2 { text-align:center; color:#003366; }
        .payment-container input, select {
            width:100%; padding:8px; margin:5px 0 15px 0; border-radius:4px; border:1px solid #ccc;
        }
        .payment-container button {
            background:#003366; color:white; border:none; padding:10px 20px; border-radius:5px; cursor:pointer;
        }
        .payment-container button:hover { background:#0055a5; }
        .error { color:red; }
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

<div class="payment-container">
    <h2>Make Payment <%= roomType %></h2>

    <% if ("missingparams".equals(error)) { %>
        <p class="error">Please fill all required fields.</p>
    <% } else if ("invalidcard".equals(error)) { %>
        <p class="error">Invalid card details.</p>
    <% } else if ("server".equals(error)) { %>
        <p class="error">Server error occurred. Try again.</p>
    <% } else if ("noReservation".equals(error)) { %>
        <p class="error">Reservation not found.</p>
    <% } %>

    <form method="post" action="ProcessPaymentServlet">
        <input type="hidden" name="reservationId" value="<%= reservationIdParam != null ? reservationIdParam : "" %>">

        <label>Amount (LKR)</label>
        <input type="number" name="amount" value="<%= amount %>" readonly>

        <label>Payment Method</label>
        <select name="method" required>
            <option value="">-- Select --</option>
            <option value="Cash">Cash</option>
            <option value="Card">Card</option>
        </select>

        <div id="cardFields" style="display:none;">
            <label>Card Number</label>
            <input type="text" name="cardNumber" maxlength="16">
            <label>Expiry</label>
            <input type="month" name="expiry">
            <label>CVV</label>
            <input type="text" name="cvv" maxlength="3">
        </div>

        <button type="submit">Pay Now</button>
    </form>
</div>

<script>
    const methodSelect = document.querySelector('select[name="method"]');
    const cardFields = document.getElementById('cardFields');
    methodSelect.addEventListener('change', function() {
        cardFields.style.display = (this.value === "Card") ? "block" : "none";
    });
</script>

</body>
</html>