<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Room Feature List</title>
</head>
<body>

<%@ taglib uri = "http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<h1> Room Feature List</h1>
		<table border = "2" width = "70%" cellpadding = "2">
			<tr><th>Id</th><th>Room ID</th><th>Feature</th><th>Quantity</th><th>Edit</th><th>Delete</th></tr>
				<c:forEach var = "roomfeature" items = "${rflist}">
					<tr>				
				<td>${roomfeature.id}</td>
				<td>${roomfeature.roomId}</td>
				<td>${roomfeature.feature.getName()}</td>
				<td>${roomfeature.quantity}</td>
				<td><a href = "/FRM/editroomfeature/${roomfeature.id}">Edit</a></td>
				<td><a href = "/FRM/deleteroomfeature/${roomfeature.id}">Delete</a></td>
					</tr>
				</c:forEach>
		</table>
	<br/>
		<a href="/FRM/roomfeatureform">Add New Room-Feature</a>
				
</body>
</html>