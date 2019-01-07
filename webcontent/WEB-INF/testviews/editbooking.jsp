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
	<form:form method ="POST" action ="savebookingedit">
		<table>
			<tr>
				<td><form:hidden path="id"/></td>
			</tr>	
		<!--  
			<tr>
				<td> Employee: </td>
				<td><form:hidden path="employee"/></td>
			</tr>	
			
			<tr>
				<td> Room: </td>
				<td><form:hidden path="room"/></td>
			</tr>
			-->
			<tr>
				<td> Start-Date: </td>
				<td><form:input type = "date" path="startDate"/></td>
			</tr>
			
			<tr>
				<td> End-Date: </td>
				<td><form:input type = "date" path="endDate"/></td>
			</tr>	
			
			<tr>
				<td> Start-Time: </td>
				<td><form:input path="startTime"/></td>
			</tr>
			
			<tr>
				<td> End-Time: </td>
				<td><form:input path="endTime"/></td>
			</tr>
			
			<tr>
			
			<td> </td>
			<tr>
				<td><input type = "submit" value = "save"/></td>
			</tr>		
		</table>	
	</form:form>
</body>
</html>