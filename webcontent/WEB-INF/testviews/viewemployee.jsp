<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee List</title>
</head>
<body>
<%@ taglib uri = "http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<h1> Employee List</h1>
		<table border = "2" cellpadding = "2">
			<tr><th>Id</th><th>Location</th><th>Password</th><th>Name</th><th>Phone</th><th>Email</th><th>Employee&nbsp;Type</th> <th>Edit</th><th>Delete</th><th>Change&nbsp;Location</th></tr>
				<c:forEach var = "employee" items = "${elist}">
					<tr>				
				<td>${employee.id}</td>
				<td>${employee.home.getName()}</td>
				<td>${employee.password}</td>
				<td>${employee.name}</td>
				<td>${employee.phone}</td>
				<td>${employee.email}</td>
				<td>${employee.etype}</td>
				<td><a href = "editemployee/${employee.id}">edit</a></td>
				<td><a href = "deleteemployee/${employee.id}">delete</a></td>
				<td><a href = "changeemployeehome/${employee.id }">Set Home</a></td>
					</tr>
				</c:forEach>
		</table>
	<br>
		<a href="employeeform">Add New Employee</a>
</body>
</html>