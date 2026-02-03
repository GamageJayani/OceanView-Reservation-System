<!DOCTYPE html>
<html>
<head>
    <title>Ocean View Room Reservation System</title>

    <!-- Auto redirect after 2 seconds -->
    <meta http-equiv="refresh" content=";URL=login.jsp">
<script>
    setTimeout(() => {
        window.location.href = "<%= request.getContextPath() %>/login.jsp";
    }, 3000); // 3 seconds
</script>

    <style>
    body {
    margin: 0;
    font-family: Arial, sans-serif;
    background: #f4f9ff;          /* light blue background */
    color: #0b2545;               /* deep navy text */
}

.hero {
    display: flex;
    height: 100vh;
    padding: 80px;
}

.hero-text {
    width: 40%;
}

.hero-text .tag {
    color: #1d4ed8;               /* primary blue */
    letter-spacing: 2px;
    font-weight: bold;
}

.hero-text h1 {
    font-size: 48px;
    margin: 20px 0;
    color: #0b2545;
}

.hero-text h1 span {
    color: #2563eb;               /* highlight blue */
}

.hero-text p {
    color: #475569;               /* soft readable text */
    line-height: 1.6;
}

.btn {
    display: inline-block;
    margin-top: 20px;
    padding: 12px 30px;
    border: 2px solid #2563eb;
    color: #2563eb;
    text-decoration: none;
    border-radius: 6px;
    transition: all 0.3s ease;
}

.btn:hover {
    background: #2563eb;
    color: #ffffff;
}

.hero-images {
    width: 60%;
    display: flex;
    gap: 20px;
}

.hero-images img {
    width: 33%;
    object-fit: cover;
    border-radius: 10px;
    box-shadow: 0 10px 30px rgba(37, 99, 235, 0.2);
}

.redirect-text {
    font-size: 16px;
    color: #64748b;   /* soft gray-blue */
    margin-top: 15px;
    font-weight: 500;
}

/* Animated dots */
.dots::after {
    content: "";
    animation: dots 1.5s steps(4, end) infinite;
}

@keyframes dots {
    0%   { content: ""; }
    25%  { content: "."; }
    50%  { content: ".."; }
    75%  { content: "..."; }
    100% { content: ""; }
}


        
    </style>
</head>
<body>

 	
 <section class="hero">
    <div class="hero-text">
        <span class="tag">Hotels &amp; Spa</span>
        <h1>Ocean View <br><span>Room Reservation System</span></h1>
        <p>
           To create unforgettable stays by offering guests seamless access to beautiful ocean-view rooms, 
    where comfort, relaxation, and breathtaking views come together.
        </p>
   
        <p class="redirect-text">
    Redirecting to login page<span class="dots"></span>
</p>
    </div>

    <div class="hero-images">
        <img src="images/index2.jpg">
        <img src="images/index3.jpg">
        <img src="images/index4.jpg">
    </div>
</section>
 
</body>
</html>
