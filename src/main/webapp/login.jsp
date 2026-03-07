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

<%
String error = (String) request.getAttribute("errorMessage");
if(error != null){
%>
<p style="color:red; text-align:center;"><%= error %></p>
<%
}
%>

<%
String success = request.getParameter("success");
if(success != null){
if("admin".equals(success)){
%>

<p style="color:green; text-align:center;">✅ Admin Login Successful! Redirecting...</p>

<script>
setTimeout(function(){
    window.location.href="admindashboard.jsp";
},2000);
</script>

<%
}else{
%>

<p style="color:green; text-align:center;">✅ Login Successful! Redirecting...</p>

<script>
setTimeout(function(){
    window.location.href="customerdashboard.jsp";
},2000);
</script>

<%
}
}
%>

    <form action="login" method="post" autocomplete="off">
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