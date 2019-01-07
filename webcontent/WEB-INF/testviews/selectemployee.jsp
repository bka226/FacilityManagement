<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Select Employee</title>
</head>
<body>
<%@ taglib uri = "http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<h1>Select Employee</h1>
		<table border = "2" cellpadding = "2">
			<tr><th>Id</th><th>Location</th><th>Name</th><th>Phone</th><th>Email</th><th>Type</th><th>Select</th></tr>
				<c:forEach var = "employee" items = "${obj[1]}">
					<tr>				
						<td>${employee.id}</td>
						<td>${employee.home.getCity()}</td>
						<td>${employee.name}</td>
						<td>${employee.phone}</td>
						<td>${employee.email}</td>
						<td>${employee.etype}</td>
						<td>
							<form action = "${obj[2] }/${obj[0]}" method = "post">
							<input type = "hidden" name = "did" value = "${employee.id}"/>
							<input type = "submit" value = "select"/>
							</form>
						</td>
					</tr>
				</c:forEach>
		</table>

</body>
</html>