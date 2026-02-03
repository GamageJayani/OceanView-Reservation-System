<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
  	
  
  
</head>

<body>

<div class="container">
    <h2>Ocean View Resort Login</h2>

    <form action="login" method="post">
        <input type="text" name="username" placeholder="Username" required>
        <input type="password" name="password" placeholder="Password" required>
        <button type="submit">Login</button>
    </form>

    <p style="text-align:center">
        New user? <a href="register.jsp">Register here</a>
    </p>
</div>

</body>
</html>
