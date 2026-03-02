<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.icbt.oceanview.model.User" %>
<%
    User user = (User) session.getAttribute("user");
%>

<html>
<head>
    <title>View Reservation</title>
   <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
    <style>
    /* style.css */


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
    
    /* Inline styles specific to this page */
        .container {
            max-width: 800px;
            margin: 50px auto;
            background-color: #fff;
            padding: 25px 40px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border-radius: 8px;
        }

        h2 {
            color: #003366;
            text-align: center;
            margin-bottom: 30px;
        }

        input[type="number"] {
            width: 100%;
            padding: 10px 12px;
            margin: 8px 0 15px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
            box-sizing: border-box;
        }

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

        p[style*="color:red"] {
            color: red;
            font-weight: bold;
            text-align: center;
        }

        /* Print Styling */
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
}
    </style>
</head>
<body>
<div class="menu">
    <span class="logo">Ocean View Resort</span>

    <a href="customerdashboard.jsp">Dashboard</a>
    <a href="addReservation.jsp">Add Reservation</a>
    <a href="myReservations.jsp">My Reservations</a>
    <a href="bill.jsp">Bill</a>
    <a href="gallery.jsp">Gallery</a>
    <a href="about.jsp">About</a>
    <a href="help.jsp">Help</a>

    <span class="right">
        <% if(user != null){ %>
            Welcome, <strong><%= user.getFullName() %></strong>
            <a href="logout" class="logout">Logout</a>
        <% } else { %>
            <a href="login.jsp">Login</a>
        <% } %>
    </span>
</div>


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
