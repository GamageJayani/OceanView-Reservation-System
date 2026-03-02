package com.icbt.oceanview.model;

import java.sql.Date;

public class Reservation {
    private int reservationId;
    private String guestName;
    private String address;
    private String phone;
    private String roomType;
    private Date checkIn;
    private Date checkOut;

    private boolean breakfast;
    private boolean lunch;
    private boolean dinner;

    private String status;
	

    // getters and setters
    public int getReservationId() { return reservationId; }
    public void setReservationId(int reservationId) { this.reservationId = reservationId; }

    public String getGuestName() { return guestName; }
    public void setGuestName(String guestName) { this.guestName = guestName; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public String getPhone() { return getPhone(); }
    public void setPhone(String phone) { this.phone = phone; }

    public String getRoomType() { return roomType; }
    public void setRoomType(String roomType) { this.roomType = roomType; }

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

    //  For compatibility with old JSP using r.getId()
    public int getId() { return reservationId; }
}