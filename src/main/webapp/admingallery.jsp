<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.icbt.oceanview.dao.GalleryDAO"%>
<%@ page import="com.icbt.oceanview.model.GalleryImage"%>

<%
    GalleryDAO dao = new GalleryDAO();
    List<GalleryImage> images = dao.getAllImages();
%>

<!DOCTYPE html>
<html>
<head>
<title>Admin | Gallery</title>

<style>
.grid{
    display:grid;
    grid-template-columns:repeat(auto-fill,minmax(220px,1fr));
    gap:20px;
}
.card{
    background:#fff;
    padding:10px;
    border-radius:8px;
    box-shadow:0 4px 10px rgba(0,0,0,0.2);
}
.card img{
    width:100%;
    height:150px;
    object-fit:cover;
}
</style>

</head>
<body>

<h2>Gallery Management</h2>

<div class="grid">
<% for(GalleryImage g : images){ %>
    <div class="card">
        <img src="images/gallery/<%= g.getImageName() %>">

        <!-- ✏ Edit title -->
        <form action="updateImageTitle" method="post">
            <input type="hidden" name="id" value="<%= g.getId() %>">
            <input type="text" name="title"
                   value="<%= g.getTitle() %>"
                   style="width:100%;margin-top:5px;">
            <button>Update</button>
        </form>

        <!-- 🗑 Delete -->
        <a href="deleteImage?id=<%= g.getId() %>"
           onclick="return confirm('Delete this image?')"
           style="color:red;display:block;margin-top:5px;">
           Delete
        </a>
    </div>
<% } %>
</div>

</body>
</html>
