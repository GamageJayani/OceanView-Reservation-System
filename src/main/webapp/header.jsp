<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.icbt.oceanview.model.User" %>
<%
    User user = (User) session.getAttribute("user");

    if(user == null){
        response.sendRedirect("login.jsp");
        return;
    }

    String dashboardLink = "customerDashboard.jsp";
    if("ADMIN".equals(user.getRole())){
        dashboardLink = "admindashboard.jsp";
    }
%>


