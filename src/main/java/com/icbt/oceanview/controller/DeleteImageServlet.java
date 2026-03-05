package com.icbt.oceanview.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.icbt.oceanview.dao.GalleryDAO;

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

        GalleryDAO dao = new GalleryDAO();

        String fileName = dao.getImageNameById(id);

        String path = getServletContext().getRealPath("/images/gallery");
        File file = new File(path + File.separator + fileName);

        if(file.exists()){
            file.delete();
        }

        dao.deleteImage(id);

        response.sendRedirect(request.getContextPath() + "/admingallery.jsp");
    }
}