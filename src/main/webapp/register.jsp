<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Registration</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body>

<div class="container">
    <h2>User Registration</h2>

    <form action="register" method="post">

        <input type="text" name="fullName"
               placeholder="Full Name" required>

        <input type="email" name="email"
               placeholder="Email Address" required>

        <input type="text" name="phone"
               placeholder="Phone Number" required>

        <input type="text" name="username"
               placeholder="Username" required>

        <input type="password" name="password"
               placeholder="Password" required>

        <!-- 🔹 ROLE SELECTION -->
        <select name="role" required>
            <option value="">Select Role</option>
            <option value="CUSTOMER">Customer</option>
            <option value="ADMIN">Admin</option>
        </select>

        <button type="submit">Register</button>

    </form>

    <p style="text-align:center">
        Already have an account? <a href="login.jsp">Login</a>
    </p>
</div>

</body>
</html>
