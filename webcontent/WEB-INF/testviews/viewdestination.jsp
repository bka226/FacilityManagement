<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ taglib uri = "http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>


		<h1>----View Locations----</h1>

	<h1> Location List</h1>
		<table border = "2" width = "70%" cellpadding = "2">
			<tr><th>Id</th><th>Street</th><th>City</th><th>State</th><th>Country</th><th>Edit</th><th>delete</th></tr>
				<c:forEach var = "destination" items = "${dlist}">
					<tr>				
				<td>${destination.id}</td>
				<td>${destination.street}</td>
				<td>${destination.city}</td>
				<td>${destination.state}</td>
				<td>${destination.country}</td>
				<td><a href = "editdestination/${destination.id}">edit</a></td>
				<td><a href = "deletedestination/${destination.id}">delete</a></td>
					</tr>
				</c:forEach>
		</table>
	<br/>
		<a href="destinationform">Add New Destination</a>
				
</body>
</html>