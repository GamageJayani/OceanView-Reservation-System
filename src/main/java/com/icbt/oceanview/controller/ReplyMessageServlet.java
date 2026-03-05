package com.icbt.oceanview.controller;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.icbt.oceanview.dao.MessageDAO;

@WebServlet("/replyMessage")
public class ReplyMessageServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws IOException {

        int messageId = Integer.parseInt(request.getParameter("messageId"));
        String replyText = request.getParameter("reply");

        MessageDAO dao = new MessageDAO();
        dao.replyMessage(messageId, replyText);

        response.sendRedirect("adminmessages.jsp?replied=true");
    }
}