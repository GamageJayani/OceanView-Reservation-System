package com.icbt.oceanview.model;

import java.util.Date;

public class GalleryImage {

    private int id;
    private String title;
    private String imageName;
    private Date uploadedDate;

    // getters & setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getImageName() { return imageName; }
    public void setImageName(String imageName) { this.imageName = imageName; }

    public Date getUploadedDate() { return uploadedDate; }
    public void setUploadedDate(Date uploadedDate) { this.uploadedDate = uploadedDate; }
}
