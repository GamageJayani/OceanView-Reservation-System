<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.icbt.oceanview.dao.DBConnection" %>
<%@ page import="com.icbt.oceanview.model.User" %>

<%
    // Get user session
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Get paymentId from request
    String paymentParam = request.getParameter("paymentId");
    if (paymentParam == null) {
        out.println("<h3>Invalid Access! Payment ID missing.</h3>");
        return;
    }

    int paymentId = 0;
    try { paymentId = Integer.parseInt(paymentParam); } 
    catch(NumberFormatException e) { 
        out.println("<h3>Invalid Payment ID!</h3>"); return; 
    }

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        con = DBConnection.getConnection();

        // Join payments with reservations and rooms
        String sql = "SELECT p.invoice_no, p.amount, p.method, p.status AS payment_status, p.created_at, "
                   + "r.guest_name, r.room_type, r.check_in, r.check_out, rm.type AS room_actual_type "
                   + "FROM payments p "
                   + "JOIN reservations r ON p.reservation_id = r.id "
                   + "JOIN rooms rm ON r.room_id = rm.id "
                   + "WHERE p.payment_id = ?";

        ps = con.prepareStatement(sql);
        ps.setInt(1, paymentId);
        rs = ps.executeQuery();

        if (!rs.next()) {
            out.println("<h3>No payment record found!</h3>");
            return;
        }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Invoice</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        .invoice-box { 
            max-width: 700px; 
            margin: 50px auto; 
            padding: 30px; 
            border: 1px solid #eee; 
            box-shadow: 0 0 10px rgba(0,0,0,0.1); 
            font-family: Arial, sans-serif; 
            background: #fff; 
        }
        .invoice-box h2 { color:#003366; text-align:center; }
        .invoice-box p { line-height: 1.5; font-size: 16px; }
        .invoice-box button { 
            padding: 8px 15px; 
            margin: 10px 5px; 
            border:none; 
            background:#003366; 
            color:white; 
            border-radius:4px; 
            cursor:pointer; 
        }
        .invoice-box button:hover { background:#0055a5; }
    </style>
</head>
<body>

<div class="invoice-box">
    <h2>Payment Invoice</h2>

    <p><strong>Invoice No:</strong> <%= rs.getString("invoice_no") %></p>
    <p><strong>Guest Name:</strong> <%= rs.getString("guest_name") %></p>
    <p><strong>Room Type:</strong> <%= rs.getString("room_actual_type") %></p>
    <p><strong>Check-In:</strong> <%= rs.getDate("check_in") %></p>
    <p><strong>Check-Out:</strong> <%= rs.getDate("check_out") %></p>
    <p><strong>Amount Paid:</strong> LKR <%= rs.getDouble("amount") %></p>
    <p><strong>Payment Method:</strong> <%= rs.getString("method") %></p>
    <p><strong>Status:</strong> <%= rs.getString("payment_status") %></p>
    <p><strong>Date:</strong> <%= rs.getTimestamp("created_at") %></p>

    <br>
    <button onclick="window.print()">Print Invoice</button>
    <a href="customerdashboard.jsp"><button>Back</button></a>
</div>

</body>
</html>

<%
    } catch(Exception e){
        e.printStackTrace();
        out.println("<h3>Server error occurred!</h3>");
    } finally {
        if(rs != null) try { rs.close(); } catch(Exception e){}
        if(ps != null) try { ps.close(); } catch(Exception e){}
        if(con != null) try { con.close(); } catch(Exception e){}
    }
%>