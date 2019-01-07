<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Employees Bookings</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="<c:url value="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>">
  <script src="<c:url value="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"/>"></script>
  <script src="<c:url value ="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"/>"> </script>
  <link rel=" stylesheet" type="text/css" href="<c:url value="/resources/styles/Booking.css"/>">
  <link rel="stylesheet" href="<c:url value="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>">
  <link href="<c:url value="https://fonts.googleapis.com/icon?family=Material+Icons"/>" rel="stylesheet">


<!-- Bootstrap Date-Picker Plugin -->
<script type="text/javascript" src="<c:url value="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"/>"></script>
<link rel="stylesheet" href="<c:url value="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>">
<link rel="stylesheet" href="<c:url value="https://formden.com/static/cdn/bootstrap-iso.css" />"> 
 
  <style type="text/css">
  .week:active
  {
  	 
  }
  </style>
</head>


<body>
 <body style="background-color:#fffef2;">
  <!-- header -->
 <div class="container-fluid navbar-fixed " >
     <nav class="navbar navbar-default   "  >
        <div class="container-fluid" >
        
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">

                <img src="<c:url value="/resources/photo/logo2.PNG"/>"  class="img-responsive"  width="220" height="140">
                <div class="dropdown">
                    <button class="btn  dropdown-toggle " type="button" id="headername" data-toggle="dropdown">  Binod Katwal   <span class="  glyphicon glyphicon-user "></span>
                    </button>
                    <ul class="dropdown-menu">
                        <li><a href="login.html">Sign Out</a></li>

                    </ul>
                </div>
            </div>
            <div>
                <ul class="nav navbar-nav navbar-right ">
                    <img src="<c:url value="/resources/photo/syntel.png"/>" class="img-responsive hidden-xs"  width="160" height="170"/>

                    <div class="dropdown">
                        <button class="btn  dropdown-toggle" type="button" id="headerlocation" data-toggle="dropdown"> Memphis,TN
                            <span class=" fa fa-map-marker"></span></button>
                        <ul class="dropdown-menu">
                            <li><a href="">Change Location</a></li>

                        </ul>
                    </div>
                </ul>
            </div>
        </div><!-- /.container-fluid -->
    </nav>
  </div>


<!-- admin navbar     -->
    <nav class="navbar navbar-inverse " >

                <div class="navbar-header">
                    <a class="navbar-brand navbar-text hidden-lg hidden-md hidden-sm hidden-xs"> <img src="logo2.png"  width="90" height="24"> </a>
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">

                        <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                    </button>

                 </div>
              <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav" >
                    <li><a class="hidden-lg  hidden-md hidden-sm"><span><strong>Binod Katwal Memphis,TN</strong></span></a></li> <li><a href="booking" ><strong>Make Booking </strong></a></li>
                    <li><a href="BookingHistory"  ><strong> History Booking</strong></a></li>
                    <li><a href="bookingSchedule"  ><strong>My Booking Schedule</strong></a></li>
                    <li><a href="AllUserBookingSchedule"><strong>Location Booking Schedule</strong></a></li>
                    <li><a class="hidden-lg  hidden-md hidden-sm" href="#s"> <strong> Sign Out </strong></a></li>
                 </ul>

	        </div><!-- /.navbar-collapse -->

    </nav>

 

   <div class="container" >



       <!-------------------------- Booking drop down type Done ----------------------------------------------->





<div class="btn-group" class="list-inline">  
	
            <div class=" dropdown hidden-xs" id='Scheduleheader'>
               <button class="btn  btn-success dropdown-toggle btn-lg"  type="button"   data-toggle="dropdown">Room Type
                   <span class="caret"></span></button>
               <ul class="dropdown-menu" role="menu" >
                   <li><a href="#" data-toggle="modal" data-target="#room1">Conference</a></li>
                   <li><a href="#" data-toggle="modal" data-target="#room1">Scrum</a></li>
                   <li><a href="#" data-toggle="modal" data-target="#room1">Training</a></li>
               </ul>
		 </div>

    	<div class=" dropdown hidden-lg hidden-sm hidden-md" >
               <button class="btn  btn-success dropdown-toggle btn-lg"  type="button"   data-toggle="dropdown">Room Type
                   <span class="caret"></span></button>
               <ul class="dropdown-menu" >
                   <li><a href="#" data-toggle="modal" data-target="#room1">Conference</a></li>
                   <li><a href="#" data-toggle="modal" data-target="#room1">Scrum</a></li>
                   <li><a href="#" data-toggle="modal" data-target="#room1">Training</a></li>
               </ul>
		 </div>
	 
</div>		
<div class="btn-group" class="list-inline">  		
		   
            <div class=" dropdown hidden-xs" id='Scheduleheader2'>
               <button class="btn  btn-success dropdown-toggle btn-lg"  type="button"   data-toggle="dropdown" >Room Name
                   <span class="caret"></span></button>
               <ul class="dropdown-menu" role="menu">
                   <li><a href="#" data-toggle="modal" data-target="#room1">Super Conference Room 203</a></li>
                   <li><a href="#" data-toggle="modal" data-target="#room1">Small Scrum Room 432</a></li>
                   <li><a href="#" data-toggle="modal" data-target="#room1">Big Dog Training Room 101</a></li>
               </ul>
		 </div>

    	<div class=" dropdown hidden-lg hidden-sm hidden-md" >
               <button class="btn  btn-success dropdown-toggle btn-lg"  type="button"   data-toggle="dropdown">Room Name
                   <span class="caret"></span></button>
               <ul class="dropdown-menu" >
                  <li><a href="#" data-toggle="modal" data-target="#room1">Super Conference Room 203</a></li>
                   <li><a href="#" data-toggle="modal" data-target="#room1">Small Scrum Room 432</a></li>
                   <li><a href="#" data-toggle="modal" data-target="#room1">Big Dog Training Room 101</a></li>
               </ul>
		 
		 </div>
</div> 

<br>
<br>




 <!-------------------------- All Users Schedule Table----------------------------------------------->

<h1 align="center"> All Employee Bookings</h1>
<h2> <span class=" fa fa-calendar">&nbsp;</span>5/17/2018</h2>

  <div align="center" class="list-inline" >
         
            <button class="btn btn-Secondary btn-lg" href="#">&laquo;</button>
         	 <span  class=" fa fa-calendar" id="bigDate">&nbsp;5/17/2018 &nbsp;</span>
         	 <button class="btn btn-Secondary btn-lg" href="#">&raquo;</button>
        
 </div>
 <br>
 
<div class="table-responsive-lg table-hover">

	<table class="table table-striped table-bordered">
		<thead>
		
			<tr>
				<th>Room Type</th>
				<th>Room Time</th>
				<th>User</th>
			</tr>
		</thead>
		<tbody>
		<tr>
			<td>Scrum</td>
			<td>2:00 p.m.- 3:00 p.m.</td>
			<td>Kelly</td>
		</tr>
		<tr>
			<td>Training</td>
			<td>9:00 p.m.- 6:00 p.m.</td>
			<td>Joe</td>
		</tr>
		<tr>
			<td>Conference</td>
			<td>11:00 p.m.- 2:00 p.m.</td>
			<td>Binod</td>
		</tr>
		
		</tbody>	
		
	
	</table>


</div>
	
 
      <!-------------------------- Next Buttons----------------------------------------------->

         <div class="">
          <ul class="pager pager-hover  hidden-xs">
              <li><button class="btn btn-Secondary btn-lg" href="#">&laquo;</button></li>
            
              <li> <button class="btn btn-Secondary btn-lg" href="#">&raquo;</button>
          </ul>
      </div>
  </div>





<br>
<br>
<br>
<br>





 <!-------------------------- Footer ----------------------------------------------->
     <%@include file='/Static Webpage/footer.html' %>    
</body>
</html>