<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Reservation</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<div class="container">
    <h2>Add New Reservation</h2>

    <form action="addReservation" method="post">

        <input type="text" name="guestName"
               placeholder="Guest Full Name" required>

        <input type="text" name="address"
               placeholder="Address" required>

        <input type="text" name="contactNumber"
               placeholder="Contact Number" required>

        <select name="roomType" required>
            <option value="">-- Select Room Type --</option>
            <option value="Single">Single</option>
            <option value="Double">Double</option>
            <option value="Standard">Standard</option>
            <option value="Deluxe">Deluxe</option>
            <option value="Family">Family</option>
        </select>

        <label>Check-In Date</label>
        <input type="date" name="checkIn" required>

        <label>Check-Out Date</label>
        <input type="date" name="checkOut" required>

        <h4>Meal Options</h4>
        <input type="checkbox" name="breakfast"> Breakfast (LKR 1500)<br>
        <input type="checkbox" name="lunch"> Lunch (LKR 2500)<br>
        <input type="checkbox" name="dinner"> Dinner (LKR 3000)<br><br>

        <button type="submit">Save Reservation</button>
    </form>

    <p style="font-size:12px;color:gray;">
        * Reservations are charged per night
    </p>
</div>

</body>
</html>
