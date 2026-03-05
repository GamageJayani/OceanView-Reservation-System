<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.icbt.oceanview.dao.GalleryDAO"%>
<%@ page import="com.icbt.oceanview.model.GalleryImage"%>
<%@ page import="com.icbt.oceanview.model.User"%>

<%
    // 🔐 ADMIN PROTECTION
    User user = (User) session.getAttribute("user");
    if(user == null || !"ADMIN".equals(user.getRole())){
        response.sendRedirect("login.jsp");
        return;
    }

    GalleryDAO dao = new GalleryDAO();
    List<GalleryImage> images = dao.getAllImages();
%>

<!DOCTYPE html>
<html>
<head>
<title>Admin | Gallery Management</title>
<link rel="stylesheet" href="css/style.css">
<style>


.page-title{
    text-align:center;
    margin-bottom:30px;
    font-size:32px;
    font-weight:bold;
    color:#ffffff !important;
}
.grid{
    display:grid;
    grid-template-columns:repeat(auto-fill,minmax(220px,1fr));
    gap:20px;
}
.card{
    background:#fff;
    padding:10px;
    margin-left: 15px;
    border-radius:8px;
    box-shadow:0 4px 10px rgba(0,0,0,0.2);
}
.card img{
    width:100%;
    height:150px;
    object-fit:cover;
    border-radius:6px;
}
input{
    width:90%;
    padding:8px;
    margin-top:5px;
}
button{
    width:100%;
    padding:8px;
    margin-top:5px;
    background:#003366;
    color:white;
    border:none;
    cursor:pointer;
}
button:hover{
    background:#0055aa;
}
.delete-link{
    display:block;
    text-align:center;
    margin-top:5px;
    color:red;
    font-weight:bold;
}
.top-btn{
    display:block;
    width:200px;
    margin:20px auto;
    padding:10px;
    background:#28a745;
    color:white;
    text-align:center;
    text-decoration:none;
    border-radius:5px;
}
</style>

</head>
<body>
<!-- NAVBAR  -->
<div class="menu">
    <span class="logo">Ocean View Resort</span>

    <a href="admindashboard.jsp">Home</a>
    <a href="allReservations.jsp">All Reservations</a>
    <a href="about.jsp">About</a>
    <a href="help.jsp">Help</a>
    <a href="adminmessages.jsp">Messages</a>
    <a href="admingallery.jsp">Gallery</a>
    <a href="rooms.jsp">Rooms</a>
    <a href="adminpayments.jsp">All Payments</a>
    <a href="contact.jsp">Contact</a>
	
    <span class="right">
        Welcome, <strong><%= user.getFullName() %></strong>
        <a href="logout" class="logout">Logout</a>
    </span>
</div>

<h2 class="page-title">Gallery Management</h2>

<a class="top-btn" href="<%= request.getContextPath() %>/uploadimage.jsp">
    + Upload New Image
</a>

<div class="grid">
<% for(GalleryImage g : images){ %>
    <div class="card">

        <img src="<%= request.getContextPath() %>/images/gallery/<%= g.getImageName() %>">

        <!-- UPDATE TITLE -->
        <form action="<%= request.getContextPath() %>/updateImageTitle" method="post">
            <input type="hidden" name="id" value="<%= g.getId() %>">
            <input type="text" name="title" value="<%= g.getTitle() %>" required>
            <button type="submit">Update Title</button>
        </form>

        <!-- DELETE -->
        <a class="delete-link"
           href="<%= request.getContextPath() %>/deleteImage?id=<%= g.getId() %>"
           onclick="return confirm('Delete this image?')">
           Delete
        </a>

    </div>
<% } %>
</div>

</body>
</html>