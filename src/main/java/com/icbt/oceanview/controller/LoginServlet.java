package com.icbt.oceanview.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.icbt.oceanview.dao.UserDAO;
import com.icbt.oceanview.model.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Get form values
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // 2. Check login from DB
        UserDAO userDAO = new UserDAO();
        User user = userDAO.login(username, password);

        // 3. Login success
        if (user != null) {

            HttpSession session = request.getSession();
            session.setAttribute("user", user);
           

            if ("ADMIN".equals(user.getRole())) {
                session.setAttribute("successMessage", "Welcome Admin 👋");
                response.sendRedirect("admindashboard.jsp");

            } else if ("CUSTOMER".equals(user.getRole())) {
                session.setAttribute("successMessage", "Login successful! Welcome 🌊");
                response.sendRedirect("customerdashboard.jsp");
            }

        } else {
            // 4. Login failed
            request.setAttribute("errorMessage", "Invalid username or password");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
