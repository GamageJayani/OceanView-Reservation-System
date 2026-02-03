<html>
<head>
    <title>View Reservation</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<div class="container">
    <h2>View Reservation Bill</h2>

    <form action="bill" method="get">
        <input type="number" name="id"
               placeholder="Reservation ID" required>
        <button type="submit">View Bill</button>
    </form>

    <% if (request.getParameter("error") != null) { %>
        <p style="color:red;">Reservation not found!</p>
    <% } %>
</div>

</body>
</html>
