package com.icbt.oceanview.controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;

import com.icbt.oceanview.dao.GalleryDAO;
import com.icbt.oceanview.model.GalleryImage;

@MultipartConfig
public class UploadImageServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String title = req.getParameter("title");
        Part filePart = req.getPart("image");

        String fileName = System.currentTimeMillis() + "_" + filePart.getSubmittedFileName();

        String uploadPath = getServletContext()
                .getRealPath("/images/gallery");

        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdirs();

        filePart.write(uploadPath + File.separator + fileName);

        GalleryImage img = new GalleryImage();
        img.setTitle(title);
        img.setImageName(fileName);

        new GalleryDAO().saveImage(img);

        resp.sendRedirect("admin/uploadimage.jsp?success=true");
    }
}
