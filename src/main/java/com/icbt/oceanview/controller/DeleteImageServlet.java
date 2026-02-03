package com.icbt.oceanview.controller;

import java.io.IOException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.icbt.oceanview.dao.GalleryDAO;

/**
 * Servlet implementation class DeleteImageServlet
 */
@WebServlet("/deleteImage")
public class DeleteImageServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        new GalleryDAO().deleteImage(id);
        response.sendRedirect("admingallery.jsp");
    }
}
