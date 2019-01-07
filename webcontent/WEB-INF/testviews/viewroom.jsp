<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Room List</title>
</head>
<body>
<%@ taglib uri = "http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<h1> Room List</h1>
		<table border = "2" cellpadding = "2">
			<tr><th>Id</th><th>Room&nbsp;Type</th><th>Location</th><th>Super&nbsp;Room</th><th>Capacity</th><th>Name</th><th>Features</th><th>Edit</th><th>Delete</th></tr>
				<c:forEach var = "room" items = "${rlist}">
					<tr>				
				<td>${room.id}</td>
				<td>${room.roomType.getRtype()}</td>
				<td>${room.destination.getCity()}</td>
				<td>${room.superRoom}</td>
				<td>${room.capacity}</td>
				<td>${room.name}</td>
				<td><a href = "/FRM/featuresinroom${room.id}">View Features</a></td>
				<td><a href = "/FRM/editroom/${room.id}">Edit</a></td>
				<td><a href = "/FRM/deleteroom/${room.id}">Delete</a></td>
					</tr>
				</c:forEach>
		</table>
	<br/>
		<a href="/FRM/roomform">Add New Room</a>
				
</body>
</html>