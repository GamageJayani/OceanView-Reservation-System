package com.icbt.oceanview.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.icbt.oceanview.dao.MessageDAO;

@WebServlet("/replyMessage")
public class ReplyMessageServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        // 1️⃣ Get form values
        int messageId = Integer.parseInt(request.getParameter("messageId"));
        String replyText = request.getParameter("reply");

        // 2️⃣ Update DB
        MessageDAO dao = new MessageDAO();
        dao.replyMessage(messageId, replyText);

        // 3️⃣ Redirect back to inbox
        response.sendRedirect("adminmessages.jsp?replied=true");
    }
}
