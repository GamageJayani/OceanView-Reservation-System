<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Edit Reservation</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>

<div class="container">
<h2>Edit Reservation</h2>

<form>
    <label>Check-In</label>
    <input type="date">

    <label>Check-Out</label>
    <input type="date">

    <label>Meals</label><br>
    <input type="checkbox"> Breakfast
    <input type="checkbox"> Lunch
    <input type="checkbox"> Dinner

    <button>Update</button>
</form>
</div>

</body>
</html>
