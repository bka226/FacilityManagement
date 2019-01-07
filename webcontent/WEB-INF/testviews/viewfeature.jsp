<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Feature List</title>
</head>
<body>
<%@ taglib uri = "http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<h1> Feature List</h1>
		<table border = "2" width = "70%" cellpadding = "2">
			<tr><th>Id</th><th>Name</th><th>Image</th><th>Edit</th><th>delete</th></tr>
				<c:forEach var = "feature" items = "${flist}">
					<tr>				
				<td>${feature.id}</td>
				<td>${feature.name}</td>
				<td>${feature.imageFilePath}</td>
				<td><a href = "editfeature/${feature.id}">edit</a></td>
				<td><a href = "deletefeature/${feature.id}">delete</a></td>
					</tr>
				</c:forEach>
		</table>
	<br/>
		<a href="featureform">Add New feature</a>
				
</body>
</html>