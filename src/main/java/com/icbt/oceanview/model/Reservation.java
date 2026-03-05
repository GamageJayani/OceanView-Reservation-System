package com.icbt.oceanview.model;

import java.sql.Date;

public class Reservation {
    private int userId;
    private int reservationId;
    private String guestName;
    private String address;
    private String contact_number;
    private String roomType;
    private int roomId;             // room_id
    private Date checkIn;
    private Date checkOut;
    private boolean breakfast;
    private boolean lunch;
    private boolean dinner;
    private String status;

    // Getters and Setters
    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public int getReservationId() { return reservationId; }
    public void setReservationId(int reservationId) { this.reservationId = reservationId; }

    public String getGuestName() { return guestName; }
    public void setGuestName(String guestName) { this.guestName = guestName; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public String getContactNumber() { return contact_number; }
    public void setContactNumber(String contact_number) { this.contact_number = contact_number; }

    public String getRoomType() { return roomType; }
    public void setRoomType(String roomType) { this.roomType = roomType; }

    public int getRoomId() { return roomId; }
    public void setRoomId(int roomId) { this.roomId = roomId; }

    public Date getCheckIn() { return checkIn; }
    public void setCheckIn(Date checkIn) { this.checkIn = checkIn; }

    public Date getCheckOut() { return checkOut; }
    public void setCheckOut(Date checkOut) { this.checkOut = checkOut; }

    public boolean isBreakfast() { return breakfast; }
    public void setBreakfast(boolean breakfast) { this.breakfast = breakfast; }

    public boolean isLunch() { return lunch; }
    public void setLunch(boolean lunch) { this.lunch = lunch; }

    public boolean isDinner() { return dinner; }
    public void setDinner(boolean dinner) { this.dinner = dinner; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    // Generate meals string for JSP
    public String getMeals() {
        String meals = "";
        if (breakfast) meals += "Breakfast, ";
        if (lunch) meals += "Lunch, ";
        if (dinner) meals += "Dinner, ";
        if (!meals.isEmpty()) meals = meals.substring(0, meals.length() - 2);
        return meals;
    }

    // For compatibility with old JSP using r.getId()
    public int getId() { return reservationId; }
}