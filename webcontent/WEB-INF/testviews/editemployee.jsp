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

	<h1> Edit Booking</h1>
	<form:form method ="POST" action ="saveemployeeedit">
		<table>
			<tr>
				<td><form:hidden path="id"/></td>
			</tr>	  
			<tr>
				<td> Home: </td>
				<!-- popup of some sort -->
			</tr>
			<tr>
				<td> Password: </td>
				<td><form:input type = "password" path="password"/></td>
			</tr>
			
			<tr>
				<td> Name: </td>
				<td><form:input path="name"/></td>
			</tr>
			
			<tr>
				<td> Phone Number: </td>
				<td><form:input  path="phone"/></td>
			</tr>	
			
			<tr>
				<td> Email: </td>
				<td><form:input path="email"/></td>
			</tr>
			
			<tr>
				<td> Employee Type: </td>
				<td><form:input path="etype"/></td>
			</tr>
			<tr>
				<td><input type = "submit" value = "save"/></td>
			</tr>		
		</table>		
	</form:form>
</body>
</html>