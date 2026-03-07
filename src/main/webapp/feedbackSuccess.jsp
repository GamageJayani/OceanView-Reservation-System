<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thank You! 🎉</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background-image: url('images/background11.jpeg');
            background-size: cover;
            background-position: center;
            font-family: Arial, sans-serif;
        }

        .message-box {
            background: rgba(255,255,255,0.95);
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.3);
            text-align: center;
            max-width: 500px;
        }

        .message-box h2 {
            color: #003366;
            margin-bottom: 20px;
        }

        .message-box p {
            font-size: 16px;
            color: #333;
            margin-bottom: 25px;
        }

        .message-box a {
            display: inline-block;
            padding: 12px 25px;
            background-color: #003366;
            color: white;
            text-decoration: none;
            border-radius: 50px;
            transition: 0.3s;
            font-weight: bold;
        }

        .message-box a:hover {
            background-color: #0055aa;
        }
    </style>
</head>
<body>
    <div class="message-box">
        <h2>Thank you for your feedback! 🌊</h2>
        <p>We appreciate your time and thoughts. 💖</p>
        <a href="customerdashboard.jsp">Back to Dashboard</a>
    </div>
</body>
</html>