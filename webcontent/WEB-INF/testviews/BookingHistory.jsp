<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page import="model.Employee"%>
<% Employee employee = (Employee)session.getAttribute("employee");
   if (employee.getEtype().endsWith("Admin")) {
%>
<%@include file="HeaderAndFooter.jsp" %>
<% } else { %>
<%@include file="header.jsp" %>
<% } %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Booking History</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel=" stylesheet" type="text/css" href="<c:url value="/resources/styles/Booking.css"/>">
  <link href="<c:url value="https://fonts.googleapis.com/icon?family=Material+Icons"/>" rel="stylesheet">
 
  
</head>
<body>
 <body style="background-color:#fffef2;">
   <div class="container" >



       <!-------------------------- Booking drop down type Done ----------------------------------------------->





         
             <div class=" dropdown hidden-xs" id="historyheader">
               <button class="btn  btn-success dropdown-toggle btn-lg"  type="button"   data-toggle="dropdown">Room Type
                   <span class="caret"></span></button>
               <ul class="dropdown-menu" >
                   <li><a href="#" data-toggle="modal" data-target="#room1">Conference</a></li>
                   <li><a href="#" data-toggle="modal" data-target="#room1">Scrum</a></li>
                   <li><a href="#" data-toggle="modal" data-target="#room1">Training</a></li>
               </ul>
		 </div>

    <div class=" dropdown hidden-lg hidden-sm hidden-md">
               <button class="btn  btn-success dropdown-toggle btn-lg"  type="button"   data-toggle="dropdown">Room Type
                   <span class="caret"></span></button>
               <ul class="dropdown-menu" >
                   <li><a href="#" data-toggle="modal" data-target="#room1">Conference</a></li>
                   <li><a href="#" data-toggle="modal" data-target="#room1">Scrum</a></li>
                   <li><a href="#" data-toggle="modal" data-target="#room1">Training</a></li>
               </ul>
		 </div>


<br>
<br>





       <!-------------------------- Booking Done----------------------------------------------->
<div class="table-responsive-lg table-hover">
	<table class="table table-striped table-bordered" id="editable">
	<thead>
        
		<tr class="primary">
			<th id="conference">Room  <p class=" glyphicon glyphicon-home"></p></th>
			<th id="conference">Date  <p class=" fa fa-calendar"></p></th>
			<th id="training">Start Time <p class="glyphicon glyphicon-time	 "></p></th>
			<th id="training">End Time <i class="material-icons">timer_off</i></th>
		</tr>
	</thead>

	<tbody>

		<tr class="primary">
			<td>Scrum</td>
			<td>05/11/2018</td>
			<td>2:00 p.m.</td>
			<td>3:00 p.m.</td>
		</tr>

		<tr class="success">
			<td>Conference</td>
			<td>04/17/2018</td>
			<td>10:15 a.m.</td>
			<td>12:00 p.m.</td>
		</tr>

		<tr class="primary">
		                     
			<td>Training</td>
			<td>03/11/2018</td>
			<td>9:00 a.m.</td>
			<td>6:00 p.m.</td>
		</tr >

</tbody>
	</table>
    
       
</div>
       <!-------------------------- Next Buttons----------------------------------------------->

         <div class="">
          <ul class="pager pager-hover  hidden-xs">
              <li><button class="btn btn-Secondary btn-lg" hef="#">&laquo;</button></li>
              <li> <button class=" btn btn-Secondary btn-lg active" href="#">1</button></li>
              <li><button class="btn btn-Secondary btn-lg" href="#">2</button></li>
              <li><button class="btn btn-Secondary btn-lg" href="#">3</button></li>
              <li> <button class="btn btn-Secondary btn-lg" href="#">&raquo;</button>
          </ul>
      </div>
  </div>








 <!-------------------------- Footer ----------------------------------------------->
<%@include file="footer.jsp"%> 
</body>
</html>


