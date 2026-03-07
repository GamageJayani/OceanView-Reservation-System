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

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        UserDAO userDAO = new UserDAO();
        User user = userDAO.login(username, password);

        if (user != null) {

            HttpSession oldSession = request.getSession(false);
            if (oldSession != null) {
                oldSession.invalidate();
            }

            HttpSession newSession = request.getSession(true);
            newSession.setAttribute("user", user);

            if ("ADMIN".equals(user.getRole())) {

                newSession.setAttribute("successMessage", "Welcome Admin 👋");
                response.sendRedirect("admindashboard.jsp?success=1");

            } else if ("CUSTOMER".equals(user.getRole())) {

                newSession.setAttribute("successMessage", "Login successful! Welcome 🌊");
                response.sendRedirect("login.jsp?success=1");
            }

        } else {

            request.setAttribute("errorMessage", "Invalid username or password");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}