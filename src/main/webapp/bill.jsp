<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.icbt.oceanview.model.Reservation" %>

<html>
<head>
    <title>Ocean View Resort - Bill</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
    <style>
    
    /* GENERAL BODY */
body {
    font-family: Arial, sans-serif;
    background-color: #f2f8fb;
    margin: 0;
    padding: 0;
    color: #333;
}

/* CONTAINER */
.container {
    max-width: 800px;
    margin: 50px auto;
    background-color: #fff;
    padding: 25px 40px;
    box-shadow: 0 0 10px rgba(0,0,0,0.1);
    border-radius: 8px;
}

/* HEADINGS */
h2 {
    color: #003366;
    text-align: center;
    margin-bottom: 30px;
}

h3 {
    color: #003366;
}

h4 {
    color: #003366;
    margin-top: 20px;
}

/* INPUTS */
input[type="text"],
input[type="number"],
input[type="date"],
select {
    width: 100%;
    padding: 10px 12px;
    margin: 8px 0 15px 0;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
    font-size: 14px;
}

/* BUTTONS */
button {
    background-color: #003366;
    color: white;
    padding: 10px 20px;
    margin: 10px 5px 0 0;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 15px;
    transition: 0.3s;
}

button:hover {
    background-color: #0055a5;
}

/* LINKS */
a button {
    text-decoration: none;
}

/* ERROR MESSAGES */
p[style*="color:red"] {
    color: red;
    font-weight: bold;
    text-align: center;
}

/* SEPARATORS */
hr {
    border: 0;
    border-top: 1px solid #ccc;
    margin: 20px 0;
}

/* PRINT STYLING */
@media print {
    body {
        background-color: #fff;
        color: #000;
    }

    .container {
        box-shadow: none;
        margin: 0;
        padding: 0;
        width: 100%;
        border-radius: 0;
    }

    button {
        display: none;
    }
}
        /* Table Styling for Bill */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }

        th, td {
            border: 1px solid #ccc;
            padding: 10px 12px;
            text-align: left;
        }

        th {
            background-color: #003366;
            color: white;
        }

        .total-row td {
            font-weight: bold;
        }

        .grand-total {
            font-size: 20px;
            color: #003366;
        }

        .buttons {
            margin-top: 20px;
        }

        .buttons button {
            margin-right: 10px;
        }
    </style>
</head>
<body>

<div class="container">

<%
    Reservation r = (Reservation) request.getAttribute("reservation");

    if (r == null) {
%>
        <h3 style="color:red;">Reservation details not available</h3>
        <p>Please access the bill through the View Reservation page.</p>
        <a href="viewReservation.jsp"><button>Go Back</button></a>
<%
        return;
    }

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

<h2 style="text-align:center;">Ocean View Resort</h2>
<h3 style="text-align:center;">Reservation Bill</h3>

<p><b>Bill No:</b> <%= billNumber %> | <b>Payment Status:</b> <%= paymentStatus %> | <b>Payment Method:</b> <%= paymentMethod %></p>

<hr>

<h4>Guest Details</h4>
<p>
    <b>Name:</b> <%= r.getGuestName() %><br>
    <b>Contact:</b> <%= r.getPhone() %><br>
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
        <td><%= r.isBreakfast() ? 1 : 0 %></td>
        <td><%= r.isBreakfast() ? 1500 : 0 %></td>
    </tr>
    <tr>
        <td>Lunch</td>
        <td>2500</td>
        <td><%= r.isLunch() ? 1 : 0 %></td>
        <td><%= r.isLunch() ? 2500 : 0 %></td>
    </tr>
    <tr>
        <td>Dinner</td>
        <td>3000</td>
        <td><%= r.isDinner() ? 1 : 0 %></td>
        <td><%= r.isDinner() ? 3000 : 0 %></td>
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
    <a href="customerdashboard.jsp"><button>Back</button></a>
</div>

</div>

</body>
</html>