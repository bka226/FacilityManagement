<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add a Room Type</title>
</head>
<body>
<%@ taglib uri = "http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<h1> Add new Room Type</h1>
	<form:form method ="POST" action="saveroomtype">
		<table>
			<tr>
				<td><form:hidden path="id"/></td>
			</tr>
			<tr>
				<td> Type: </td>
				<td><form:input path="rtype"/></td>
			</tr>
			
			<tr>
				<td> File Path for image: </td>
				<td><form:input path="imageFilePath"/></td>
			</tr>
			<tr>
				<td><input type = "submit" value = "save"/></td>
			</tr>		
		</table>		
	</form:form>
</body>
</html>