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
<%@ include file = "HeaderAndFooter.jsp" %>
	<h1> Add New Destination</h1>
	<form:form method ="POST" action="savedestination">
<table>
			<tr>
				
				<td><form:hidden path="id"/></td>
			</tr>	
		
			<tr>
				<td> Street: </td>
				<td><form:input path="street"/></td>
			</tr>	
			
			<tr>
				<td> City: </td>
				<td><form:input path="city"/></td>
			</tr>
			
			<tr>
				<td> State: </td>
				<td><form:input path="state"/></td>
			</tr>
			
			<tr>
				<td> Country: </td>
				<td><form:input path="country"/></td>
			</tr>	
		
			
			<tr>
				<td> Rooms: </td>
				<td><form:hidden path="rooms"/></td>
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