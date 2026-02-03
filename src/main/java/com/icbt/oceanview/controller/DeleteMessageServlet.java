package com.icbt.oceanview.controller;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.icbt.oceanview.dao.MessageDAO;

@WebServlet("/deleteMessage")
public class DeleteMessageServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        MessageDAO dao = new MessageDAO();
        dao.deleteMessage(id);

        response.sendRedirect("adminmessages.jsp?deleted=true");
    }
}
