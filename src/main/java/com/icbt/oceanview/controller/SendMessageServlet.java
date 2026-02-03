package com.icbt.oceanview.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.icbt.oceanview.dao.MessageDAO;
import com.icbt.oceanview.model.Message;

@WebServlet("/sendMessage")
public class SendMessageServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        // 1️ Get form data
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String messageText = request.getParameter("message");

        // 2️ Create model
        Message m = new Message();
        m.setSenderName(name);
        m.setSenderEmail(email);
        m.setMessageText(messageText);
        m.setStatus("NEW");
        

        // 3️ Save to DB
        MessageDAO dao = new MessageDAO();
        dao.addMessage(m);

        // 4️ Redirect with success
        response.sendRedirect("contact.jsp?success=true");
    }
}
