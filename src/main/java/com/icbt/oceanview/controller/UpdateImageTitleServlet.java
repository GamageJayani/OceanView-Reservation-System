package com.icbt.oceanview.controller;

import java.io.IOException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.icbt.oceanview.dao.GalleryDAO;

/**
 * Servlet implementation class EditImageTitleServlet
 */
@WebServlet("/updateImageTitle")
public class UpdateImageTitleServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");

        new GalleryDAO().updateTitle(id, title);
        response.sendRedirect("admingallery.jsp");
    }
}
