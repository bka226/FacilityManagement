<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Select Room</title>
</head>
<body>
<%@ taglib uri = "http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<h1>Select Room</h1>
		<table border = "2" cellpadding = "2">
			<tr><th>Id</th><th>Location</th><th>Type</th><th>Super</th><th>Capacity</th><th>Name</th><th>Select</th></tr>
				<c:forEach var = "room" items = "${obj[1]}">
					<tr>				
						<td>${room.id}</td>
						<td>${room.location.getCity()}</td>
						<td>${room.roomType}</td>
						<td>${room.superRoom}</td>
						<td>${room.name}</td>
						<td>
							<form action = "${obj[2]}" method = "post">
							<input type = "hidden" name = "did" value = "${room.id }"/>
							<input type = "submit" value = "select"/>
							</form>
						</td>
					</tr>
				</c:forEach>
		</table>

</body>
</html>