package com.icbt.oceanview.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.icbt.oceanview.dao.UserDAO;
import com.icbt.oceanview.model.User;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
throws ServletException, IOException {

System.out.println("RegisterServlet doPost called!");

User user = new User();
user.setFullName(request.getParameter("fullName"));
user.setEmail(request.getParameter("email"));
user.setPhone(request.getParameter("phone"));
user.setUsername(request.getParameter("username"));
user.setPassword(request.getParameter("password"));
user.setRole("CUSTOMER");

UserDAO dao = new UserDAO();
boolean success = dao.registerUser(user);

System.out.println("Insert result: " + success);

if(success){
response.sendRedirect("login.jsp?registered=true");
} else {
response.sendRedirect("register.jsp?error=true");
}
}

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("register.jsp");
    }
}