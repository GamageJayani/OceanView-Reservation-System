<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.icbt.oceanview.model.User" %>
<%
User user = (User) session.getAttribute("user");
if(user == null || !"ADMIN".equals(user.getRole())){
    response.sendRedirect("../login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Upload Gallery Image</title>
<style>
body{font-family:Arial;background:#f4f6fa;}
.box{
    width:400px;
    margin:80px auto;
    background:white;
    padding:30px;
    border-radius:8px;
    box-shadow:0 10px 20px rgba(0,0,0,0.2);
}
input,button{
    width:100%;
    margin-top:10px;
    padding:10px;
}
button{
    background:#003366;
    color:white;
    border:none;
}
</style>
</head>
<body>

<div class="box">
<h2>Upload Gallery Image</h2>

<% if("true".equals(request.getParameter("success"))){ %>
<p style="color:green;">Image uploaded successfully</p>
<% } %>

<form action="../uploadImage" method="post" enctype="multipart/form-data">
    <input type="text" name="title" placeholder="Image title" required>
    <input type="file" name="image" required>
    <button>Upload</button>
</form>

</div>
</body>
</html>
