<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Help &amp; Support | Ocean View Resort</title>

    <style>
        body{
            font-family: Arial, sans-serif;
            background:#f5f7fa;
            margin:0;
            padding:0;
        }

        .container{
            width:85%;
            margin:30px auto;
            background:white;
            padding:30px;
            border-radius:8px;
            box-shadow:0 0 10px rgba(0,0,0,0.1);
        }

        h1{
            text-align:center;
            color:#003366;
            margin-bottom:30px;
        }

        h3{
            color:#0059b3;
            margin-top:25px;
        }

        ul{
            margin-left:20px;
        }

        ul li{
            line-height:1.8;
        }

        .note{
            background:#eef6ff;
            padding:15px;
            border-left:5px solid #0077cc;
            margin-top:15px;
        }

        .contact-box{
            margin-top:30px;
            padding:20px;
            background:#f0f8ff;
            border-radius:6px;
            text-align:center;
        }

        .contact-box a{
            text-decoration:none;
            color:white;
            background:#0077cc;
            padding:10px 18px;
            border-radius:5px;
            display:inline-block;
            margin-top:10px;
        }

        .contact-box a:hover{
            background:#005fa3;
        }
    </style>
</head>

<body>

<div class="container">

    <h1>Help &amp; Support</h1>

    <!-- General Help -->
    <h3>1. General System Help</h3>
    <ul>
        <li>Create a new user account using the Register page.</li>
        <li>Login using your username and password.</li>
        <li>Only registered users can make reservations.</li>
        <li>Logout after finishing your work for security purposes.</li>
    </ul>

    <!-- Reservation Help -->
    <h3>2. Room Reservation Help</h3>
    <ul>
        <li>Select your preferred room type (Single, Double, Deluxe, Family).</li>
        <li>Choose valid check-in and check-out dates.</li>
        <li>Check-out date must be after the check-in date.</li>
        <li>Room charges are calculated based on number of nights.</li>
    </ul>

    <div class="note">
        <strong>Note:</strong>  
        A reservation can be made for one night or multiple nights depending on your stay duration.
    </div>

    <!-- Meal Help -->
    <h3>3. Meal Selection Help</h3>
    <ul>
        <li>Breakfast, Lunch and Dinner are optional services.</li>
        <li>You may select one or more meal options.</li>
        <li>Meal charges are added to the final bill.</li>
    </ul>

    <!-- Billing Help -->
    <h3>4. Billing &amp; Payment Help</h3>
    <ul>
        <li>Total bill is calculated based on room rate and meals.</li>
        <li>A service charge may be added to the total amount.</li>
        <li>Bill details can be viewed using the reservation ID.</li>
        <li>Invoices are generated after payment confirmation.</li>
    </ul>

    <!-- Modification & Cancellation -->
    <h3>5. Reservation Modification &amp; Cancellation</h3>
    <ul>
        <li>You can edit reservation details before check-in.</li>
        <li>Reservations can be cancelled through the system.</li>
        <li>Refund policies depend on cancellation timing.</li>
    </ul>

    <!-- Still Need Help -->
    <div class="contact-box">
        <h3>Still Need Help?</h3>
        <p>
            If your question is not listed here, please contact our support team.
        </p>

        <!-- This button should open your message popup -->
        <a href="#" onclick="openMessagePopup()">Contact Support</a>

        
    </div>

</div>

<!-- OPTIONAL: message popup trigger -->
<script>
function openMessagePopup(){
    alert("Message popup will open here");
    // Later: replace with real popup logic
}
</script>
<jsp:include page="message.jsp"/>
</body>
</html>
