<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.icbt.oceanview.model.Reservation" %>

<html>
<head>
    <title>Ocean View Resort - Bill</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<div class="container">

<%
    /* SAFETY CHECK (VERY IMPORTANT)*/
    
    Reservation r = (Reservation) request.getAttribute("reservation");

    if (r == null) {
%>
        <h3 style="color:red;">Reservation details not available</h3>
        <p>Please access the bill through the View Reservation page.</p>
        <a href="viewReservation.jsp">Go Back</a>
<%
        return; // stop JSP execution
    }

    /* SAFE ATTRIBUTE FETCHING */
    
    long nights = (request.getAttribute("nights") != null)
            ? (Long) request.getAttribute("nights") : 0;

    double rate = (request.getAttribute("rate") != null)
            ? (Double) request.getAttribute("rate") : 0;

    double roomTotal = (request.getAttribute("roomTotal") != null)
            ? (Double) request.getAttribute("roomTotal") : 0;

    double mealTotal = (request.getAttribute("mealTotal") != null)
            ? (Double) request.getAttribute("mealTotal") : 0;

    double serviceCharge = (request.getAttribute("serviceCharge") != null)
            ? (Double) request.getAttribute("serviceCharge") : 0;

    double grandTotal = (request.getAttribute("grandTotal") != null)
            ? (Double) request.getAttribute("grandTotal") : 0;

    String billNumber = (String) request.getAttribute("billNumber");
    String paymentStatus = (String) request.getAttribute("paymentStatus");
    String paymentMethod = (String) request.getAttribute("paymentMethod");
%>

    <h2>Reservation Bill</h2>

    <!-- Bill Meta Info -->
    <p><b>Bill No:</b> <%= billNumber %></p>
    <p><b>Payment Status:</b> <%= paymentStatus %></p>
    <p><b>Payment Method:</b> <%= paymentMethod %></p>

    <hr>

    <!-- Guest Details -->
    <h4>Guest Details</h4>
    <p>
        <b>Name:</b> <%= r.getGuestName() %><br>
        <b>Contact:</b> <%= r.getContactNumber() %><br>
        <b>Address:</b> <%= r.getAddress() %>
    </p>

    <hr>

    <!-- Stay Details -->
    <h4>Stay Details</h4>
    <p>
        <b>Room Type:</b> <%= r.getRoomType() %><br>
        <b>Check-In:</b> <%= r.getCheckIn() %><br>
        <b>Check-Out:</b> <%= r.getCheckOut() %><br>
        <b>Total Nights:</b> <%= nights %>
    </p>

    <hr>

    <!-- Meal Details -->
    <h4>Meal Options</h4>
    <p>
        Breakfast: <%= r.isBreakfast() ? "Included" : "Not Included" %><br>
        Lunch: <%= r.isLunch() ? "Included" : "Not Included" %><br>
        Dinner: <%= r.isDinner() ? "Included" : "Not Included" %>
    </p>

    <hr>

    <!-- Cost Breakdown -->
    <h4>Cost Breakdown</h4>
    <p>
        Room Cost (LKR <%= rate %> × <%= nights %> nights): LKR <%= roomTotal %><br>
        Meal Cost: LKR <%= mealTotal %><br>
        Service Charge (10%): LKR <%= serviceCharge %>
    </p>

    <hr>

    <!-- Grand Total -->
    <h3>Total Amount Payable</h3>
    <p style="font-size:22px; color:#003366;">
        <b>LKR <%= grandTotal %></b>
    </p>

    <br>

    <button onclick="window.print()">Print Bill</button>
    <a href="customerdashboard.jsp">
        <button>Back</button>
    </a>

</div>

</body>
</html>
