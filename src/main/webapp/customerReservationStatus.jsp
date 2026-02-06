<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.icbt.oceanview.model.Reservation" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:forEach var="r" items="${reservations}">
    ${r.reservationId}
    ${r.roomType}
    ${r.status}
</c:forEach>

<h2>My Reservations</h2>
<table border="1">
<tr>
    <th>ID</th><th>Room</th><th>Check In</th><th>Check Out</th><th>Status</th>
</tr>


<%

List<Reservation> list = (List<Reservation>)request.getAttribute("reservations");
for(Reservation r : list){
%>
<tr>
<td><%=r.getReservationId()%></td>
<td><%=r.getRoomType()%></td>
<td><%=r.getCheckIn()%></td>
<td><%=r.getCheckOut()%></td>
<td><%=r.getStatus()%></td>
</tr>
<% } %>
</table>
</body>
</html>