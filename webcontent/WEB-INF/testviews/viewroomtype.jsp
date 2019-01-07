<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>List of Room Types</title>
</head>
<body>

<%@ taglib uri = "http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>


	<h1>List of Room Types</h1>
		<table border = "2" cellpadding = "2">
			<tr><th>Id</th><th>Type</th><th>Image Path</th><th>Edit</th><th>Delete</th></tr>
				<c:forEach var = "roomtype" items = "${rtlist}">
					<tr>				
				<td>${roomtype.id}</td>
				<td>${roomtype.rtype}</td>
				<td>${roomtype.imageFilePath}</td>
				<td><a href = "editroomtype/${roomtype.id}">Edit</a></td>
				<td><a href = "deleteroomtype/${roomtype.id}">Delete</a></td>
					</tr>
				</c:forEach>
		</table>
	<br>
		<a href="roomtypeform">Add New Room Type</a>

</body>
</html>