<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register New Account</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body>

<div class="container">
    <h2>Register New Account</h2>
    
	<% if(request.getParameter("registered") != null){ %>
    <p style="color:green;">✅ Registration successful! Please login.</p>
<% } %>

<% if(request.getParameter("error") != null){ %>
    <p style="color:red;">❌ Registration failed. Try again.</p>
<% } %>

    <form action="register" method="post">
        <label>Full Name:</label><br>
        <input type="text" name="fullName" required><br><br>

        <label>Email:</label><br>
        <input type="email" name="email" required><br><br>

        <label>Phone:</label><br>
        <input type="text" name="phone" required><br><br>

        <label>Username:</label><br>
        <input type="text" name="username" required><br><br>

        <label>Password:</label><br>
        <input type="password" name="password" required><br><br>

        <button type="submit">Register</button>
    </form>

    <p>Already have an account? <a href="login.jsp">Login here</a></p>
</div>

</body>
</html>