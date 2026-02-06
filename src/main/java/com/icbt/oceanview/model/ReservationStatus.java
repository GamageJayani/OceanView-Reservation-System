package com.icbt.oceanview.model;

public class ReservationStatus {
    private int reservationId;
    private String status; // PENDING, CONFIRMED, CANCELLED

    public int getReservationId() {
        return reservationId;
    }
    public void setReservationId(int reservationId) {
        this.reservationId = reservationId;
    }

    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }
}
