<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Bookings</title>
</head>
<body>

<%@ taglib uri = "http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>


	<h1> Booking List</h1>
		<table border = "2" width = "70%" cellpadding = "2">
			<tr><th>Id</th><th>Employee</th><th>Room</th><th>Start&nbsp;Date</th><th>End&nbsp;Date</th><th>Start&nbsp;Time</th><th>End&nbsp;Time</th><th>Edit</th><th>delete</th></tr>
				<c:forEach var = "booking" items = "${blist}">
					<tr>				
				<td>${booking.id}</td>
				<td>${booking.employee.getName()}</td>
				<td>${booking.room.getName()}</td>
				<td>${booking.startDate}</td>
				<td>${booking.endDate}</td>
				<td>${booking.startTime}</td>
				<td>${booking.endTime}</td>
				<td><a href = "editbooking/${booking.id}">edit</a></td>
				<td><a href = "cancelbooking/${booking.id}">delete</a></td>
					</tr>
				</c:forEach>
		</table>
	<br/>
		<a href="bookingform">Add New Booking</a>
				
</body>
</html>