<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Booking</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="<c:url value="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>">
  <script src="<c:url value="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"/>"></script>
  <script src="<c:url value ="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"/>"> </script>
  <link rel=" stylesheet" type="text/css" href="<c:url value="/resources/styles/Booking2.css"/>">
  <script src="<c:url value="/resources/codebase/dhtmlxscheduler.js"/>" type="text/javascript"></script>
  <link href="<c:url value="https://fonts.googleapis.com/icon?family=Material+Icons"/>" rel="stylesheet">
<link rel="stylesheet" href="<c:url value="/resources/codebase/dhtmlxscheduler.css"/>" type="text/css">
 
 
 
 <style type="text/css">
 
 
 table
{
	border-style: solid;
	border-color: grey;
	border-width: 2px 1px 2px 1px;
	table-layout:auto;
	width: 100%;
 	background-color: #dadada;
}


th
{
	border-bottom-style:double;
	border-bottom-color:#ffa500;
	border-bottom-width:thick;
   <!-- background-color: #4CAF50;-->
    color: white;
}

th,td
{
	padding: 25px;
	text-align:center;
}

tr:hover 
{
	background-color: #b0f7ae;
}

 .container2
  {
  text-align:center;
  
  }
  
  .form-horizontal
  {
  	text-align:center;
  }
  .modal-header, h4, .close {
      background-color: #5cb85c;
      color:white !important;
      text-align: center;
      font-size: 30px;
  }
  .modal-footer {
      background-color: f9f9f9;
  }
  
.bookingform
  {
  	background-color: #dadada;
  	padding: 20px;
  	border-style:double;
	border-color:#ffa500;
	border-width:thick;
	width:50%;
	text-align:center;
  }
 #submitForm
  {
   background-color: #4CAF50;
   border-color:#4CAF50;
  
  }
  
  #home
  {
  	background-color: #dadada;
  	text-align:center;
  	padding:20px;
  }
  
  
  #scheduler_here
  {
  
  	width: 700px;
  	height: 400px;
  }
  
  
  #mymodal3
{
	width: 1000px;
	height: 600px;
	
	padding: 30px;
}

.dhx_cal_tab
{
	display:inline-block;
	
}
  
 

alter
{

	table-layout:auto;
	width: auto;
 	border-collapse: collapse;
 	display:inline-block;
 	
}


#recipients {

	width: 440px !important;
	display: inline-block;
}

#day
{
	display : inline-table;
}


/*Header CSS to be deleted once on JSP page  */


#headerName
{
  background-color:red;
}
#headerlocation
{
margin-left: 25px;
margin-bottom: 10px;
background-color:orange;
}




/* Footer CSS to be deleted once on JSP page */

/*
footer
{
	background-color:black;
	box-shadow: 0 1px 1px 0 red;
	box-sizing: border-box;
	width: 100%;
	text-align: center;
	padding: 18px;

    left: 0;
    bottom: 0;
 

	color:  #8f9296;
	font-size: 14px;
	margin: 0;
	
	
	
}
*/


.footer-basic-centered
{
	background-color:black;
	box-shadow: 0 1px 1px 0 red;
	box-sizing: border-box;
	width: 100%;
	text-align: center;
	padding: 18px;
	position:fixed;
    left: 0;
    bottom: 0;
 
}
.footer-company-name{
	color:  #8f9296;
	font-size: 14px;
	margin: 0;
}


/*--------------Main Page CSS-----------------*/




#myInput {
  background-image: url('/css/searchicon.png');
  background-position: 10px 10px;
  background-repeat: no-repeat;
  width: 100%;
  font-size: 16px;
  padding: 12px 20px 12px 40px;
  border: 1px solid #ddd;
  margin-bottom: 12px;
}

#myTable {
  border-collapse: collapse;
  width: 100%;
  border: 1px solid #ddd;
  font-size: 18px;
}

#myTable th, #myTable td {
  text-align: left;
  padding: 12px;
}

#myTable tr {
  border-bottom: 1px solid #ddd;
}

#myTable tr.header, #myTable tr:hover {
  background-color: #f1f1f1;
}



  
  
  </style>
  
  
  
  
  
</head>
<body>
<!-- ----------------------------------Header---------------------------------------- -->
 <header> 

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
                    <img src="<c:url value="/resources/photo/syntel.png"/>" class="img-responsive hidden-xs"  width="160" height="170">

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


</header>
<!-- ------------------------------------ End of header ------------------------------- -->

<div class="scroll">
<div class="container">
  <h2>Bookings</h2>
  <ul  class="nav nav-tabs nav-justified" role="tablist" >
    <li class="active"><a data-toggle="tab" id="tabs" href="#home">Schedule Booking</a></li>
   <!--   <li><a data-toggle="tab" id="tabs" href="#makeBook">Make a Booking</a></li> -->
    <li><a data-toggle="tab" id="tabs" href="#history">Booking History</a></li>
  </ul>

  <div class="tab-content">
    <div id="home" class="tab-pane fade in active">
     
     			
 <h5 id="schedule">View My Current Bookings</h5>
 <br>
<input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for room.." title="Type in the room">

	<table id="myTable">
	  <tr class="header">
	    <th >Room</th>
	    <th >Features</th>
	    <th>Building</th>
	  </tr>
	  <tr>
	    <td>Training <i class="material-icons">computer</i></td>
	    <td><p> Maximum of 20 people <br> 1 Projector/Screen<br> 10 Computers<i class="material-icons">&#xe30a;</i><br> 1 White board</p></td>
     	<td class="roomId" id="training"> 102 <span class="glyphicon glyphicon-plus"></span></td>
	  </tr>
	  <tr>
	    <td>Scrum</td>
	    <td><p> Maximum of 12 people <br> 1 Projector/Screen<br> 1 TV</p></td>
     	<td class="roomId" id="scrum"> 303  <span class="glyphicon glyphicon-plus"></span></td>
	  </tr>
	  <tr>
	     <td>Scrum</td>
	    <td><p> Maximum of 12 people <br> 1 Projector/Screen<br> 1 TV</p></td>
     	<td class="roomId" id="scrum"> 402  <span class="glyphicon glyphicon-plus"></span></td>
	  </tr>
	  <tr>
	     <td>Conference</td>
	    <td><p> Maximum of 12 people <br> 1 Projector/Screen<br> 1 TV</p></td>
     	<td class="roomId" id="conference"> 103  <span class="glyphicon glyphicon-plus"></span></td>
	  </tr>
	  <tr>
	    <td>Conference</td>
	    <td><p> Maximum of 12 people <br> 1 Projector/Screen<br> 1 TV</p></td>
     	<td class="roomId" id="conference"> 204  <span class="glyphicon glyphicon-plus"></span></td>
	  </tr>
	  <tr>
	     <td>Training</td>
	    <td><p> Maximum of 22 people <br> 1 Projector/Screen<br> 12 Computers <i class="material-icons">&#xe30a;</i><br> 2 White board</p></td>
     	<td class="roomId" id="training"> 401  <span class="glyphicon glyphicon-plus"></span></td>
	  </tr>
	  <tr>
	     <td>Training</td>
	    <td><p> Maximum of 18 people <br> 1 Projector/Screen<br> 12 Computers <i class="material-icons">&#xe30a;</i><br> 1 White board</p></td>
     	<td class="roomId" id="training"> 267 <br> <span class="glyphicon glyphicon-plus"></span></td>
	  </tr>
	  <tr>
	     <td>Conference</td>
	    <td><p> Maximum of 12 people <br> 1 Projector/Screen<br> 1 TV</p></td>
     	<td class="roomId" id="conference"> 208  <span class="glyphicon glyphicon-plus"></span></td>
	  </tr>
	   <tr>
	     <td>Conference</td>
	    <td><p> Maximum of 12 people <br> 1 Projector/Screen<br> 1 TV</p></td>
     	<td class="roomId" id="conference"> 101  <span class="glyphicon glyphicon-plus"></span></td>
	  </tr>
	   <tr>
	     <td>Conference</td>
	    <td><p> Maximum of 12 people <br> 1 Projector/Screen<br> 1 TV</p></td>
     	<td class="roomId" id="conference"> 133  <span class="glyphicon glyphicon-plus"></span></td>
	  </tr>
	   <tr>
	     <td>Scrum</td>
	    <td><p> Maximum of 12 people <br> 1 Projector/Screen<br> 2 TV</p></td>
     	<td class="roomId" id="scrum">352 <span class="glyphicon glyphicon-plus"></span></td>
	  </tr>
	</table>

<script>
function myFunction() {
  var input, filter, table, tr, td, i;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[0];
    if (td) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}
</script>
     				
    </div>
    
 
    
    
    
    <div id="history" class="tab-pane fade">
      <h3>Booking History</h3>
      <table>
      	<tr>
      		<th> Date </th>
      		<th> Start Time </th>
      		<th> End Time </th>
      		<th> Room </th>
      	</tr>
      	
      	 <tr>
      		<td> 5/7/18 </td>
      		<td> 2:00 p.m. </td>
      		<td> 3:00 p.m. </td>
      		<td> Conference 1 </td>
      	</tr>
      	
      	<tr>
      		<td> 4/5/18 </td>
      		<td> 3:45 p.m. </td>
      		<td> 5:00 p.m. </td>
      		<td> Conference 2 </td>
      	</tr>
      		<tr>
      		<td> 3/30/18 </td>
      		<td> 9:00 a.m. </td>
      		<td> 3:00 p.m. </td>
      		<td> Training 1 </td>
      	</tr>
      	
      	
      		<tr>
      		<td> 3/25/18 </td>
      		<td> 10:00 a.m. </td>
      		<td> 12:40 p.m. </td>
      		<td> Scrum 1 </td>
      	</tr>
      
      </table>
    </div>
  </div>
</div>

<%--<!-- ------------------schedule pick---------------------- -->

<div class="container2">
  <!-- Modal -->
  <div class="modal fade" id="myModal4" role="dialog">
    <div class="modal-dialog ">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title" id="pickroom">Select Schedule Type</h4>
          	
        </div>
         <div class="modal-body">
        <h2 class="picker" id="scrumPick">Scrum Schedule</h2>
      <ul  class="nav nav-tabs nav-justified  nav-stacked" role="tablist" >
   		 <li class="picker"><a data-toggle="tab" id="scrumPick" href="#">Scrum Schedule</a></li>
   		 <li><a data-toggle="tab" class="picker" id="conferencePick" href="#">Conference Schedule</a></li>
   		 <li><a data-toggle="tab" class="picker" id="trainingPick" href="#">Training Schedule</a></li>
  	</ul>
        
        
     
        </div>
        <div class="modal-footer">
        
         
        </div>
    </div>
  </div> 
</div> --%>

<!------------------------------------Schedule------------------>
<div class="container2">
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog ">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title" id="roomTitle1">Your Schedule</h4>
          	
        </div>
        
        
        
        <script>
     		$(document).ready(function(){
     			
	     		$("#scrumPick").click(function(){
	     			if($(this).change())
	     				{
	     				 $("#roomTitle1").text("Your Scrum Room Bookings");
	     				}
	     			
	     			});
	     		$("#conferencePick").click(function (){
	     			if($(this).change())
	     				{
	     			 	$("#roomTitle1").text("Your Conference Room Bookings");
	     				}
	     		});
		 			
	     		$("#trainingPick").click(function (){
	     			if($(this).change())
	   	 			 $("#roomTitle1").text("Your Training Room Bookings");
	   	 			
	     		});
	 		
  
     		});
     	</script>
        
        <div class="modal-body">
        <table id="roomTimes" class="table table-striped table-bordered nowrap" style="width:100%">
	      	<tr>
	      		<th> 5/14/18 </th>
	      		<th> 5/16/18 </th>
	      		<th> 5/15/18 </th>
	      		<th> 5/17/18 </th>
	      		<th> 5/18/18 </th>
	      	</tr>
	      		<tr>
	      		<th> Training: </th>
	      		<th>  </th>
	      		<th> Conference:  </th>
	      		<th></th>
	      		<th> Scrum: </th>
	      	</tr>
	      	<tr>
	      		<td>  2:00 p.m.- 4:00 p.m. </td>
	      		<td>  </td> 
	      		<td> 2:00 p.m.- 4:00 p.m. </td>
	      		<td>  </td>
	      		<td> 9:00 a.m.- 10:00 a.m. </td>
	      		
	      	</tr>
	      	<tr>
	      		<th> Scrum: </th>
	      		<th>  </th>
	      		<th> Scrum:  </th>
	      		<th> Conference:</th>
	      		<th>  </th>
	      	</tr>
	      	<tr>
	      		<td>2:00 p.m.- 4:00 p.m. </td>
	      		<td>  </td>
	      		<td> 2:00 p.m.- 4:00 p.m. </td>
	      		<td> 2:00 p.m.- 4:00 p.m. </td>
	      		<td>  </td>
	      	</tr>
	      		<tr>
	      		<th> Training: </th>
	      		<th>  </th>
	      		<th>  </th>
	      		<th> Scrum:</th>
	      		<th>  </th>
	      	</tr>
	      	<tr>
	      		<td>2:00 p.m.- 4:00 p.m. </td>
	      		<td>  </td>
	      		<td>  </td>
	      		<td> 2:00 p.m.- 4:00 p.m. </td>
	      		<td>  </td>
	
	      	</tr>
      	
      
      </table> 
      
             <button type="submit" class="btn btn-success" id="editRow"><span class="glyphicon glyphicon-pencil"></span> Edit</button>
              
        </div>
        <div class="modal-footer">
         <%-- <button type="submit" class="btn btn-secondary " id="bookNow"><span class="glyphicon glyphicon-plus"></span> Make New Booking</button> --%>
          <button type="submit" class="btn btn-secondary" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Close</button>
         
        </div>
      </div>
    </div>
  </div> 
</div>
 
<!-- -------------------------------------Make a booking Modal------------------------------ -->
<div class="container2">
  <!-- Modal -->
  <div class="modal fade" id="myModal3" role="dialog">
    <div class="modal-dialog modal-lg ">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" id="roomTitle"></h4>
         
    
        </div>
        
         
        <script>
     		$(document).ready(function(){
     			
     			$("#scrum").click(function(){
	     			if($(this).change())
	     				{
	     				 $("#roomTitle").text("Make a Scrum Room Booking");
	     				}
	     			
	     			});
	     		$("#conference").click(function (){
	     			if($(this).change())
	     				{
	     			 	$("#roomTitle").text("Make a Conference Room Booking");
	     				}
	     		});
		 			
	     		$("#training").click(function (){
	     			if($(this).change())
	   	 			 $("#roomTitle").text("Make a Training Room Booking");
	   	 			
	     		});
	 		
  
     		});
     	</script>
        
        
		<div class="modal-body">
		<form class="bookingform">
		<div class="form-group row">
     	<label for="month">Month:</label>
     	<select class="form-control" class="mr-sm-2" id="month" required>
     		<option value="" selected hidden>Pick a Month </option>
     		<option >January </option>
     		<option value=2>February </option>
     		<option>March </option>
     		<option value=1>April </option>
     		<option>May </option>
     		<option value=1>June </option>
     		<option>July </option>
     		<option>August </option>
     		<option value=1>September </option>
     		<option>October </option>
     		<option value=1>November </option>
     		<option>December </option>
     	</select>
     		<label for="day">Day:</label>
     	 	<select class="form-control" class="mr-sm-2" id="day" required>
     		<option value="" selected hidden>Pick a Day </option>
     		<option >1 </option>
     		<option >2 </option>
     		<option >4 </option>
     		<option >5 </option>
     		<option >6 </option>
     		<option >7 </option>
     		<option >8 </option>
     		<option >9 </option>
     		<option >10 </option>
     		<option >11 </option>
     		<option >12 </option>
     		<option >13 </option>
     		<option >14 </option>
     		<option >15 </option>
     		<option >16 </option>
     		<option >17 </option>
     		<option >18 </option>
     		<option >19 </option>
     		<option >20 </option>
     		<option >21 </option>
     		<option >22 </option>
     		<option >23 </option>
     		<option >24 </option>
     		<option >25 </option>
     		<option >26 </option>
     		<option >27 </option>
     		<option id="hidedate1">28 </option>
     		<option id="hidedate1">29 </option>
     		<option id="hidedate1" >30 </option>
     		<option id="hidedate2">31 </option>
     	</select>
     	
     
     	</div>
     	<br>
     	<br> 
     	 <br>
     		<br>
     		<label>Pick Time:</label>
     		<br>
     		<br>
     		
    <div class="form-group row ">	
     		<div class="col-xs-4">
     	<label> from:</label>
     	<select class="form-control"   id="fromTime" >
     		<option value="" selected hidden>Pick a start time </option>
     		<option class="am" value="1">9:00</option>
     		<option class="am" value="2">9:15</option>
     		<option class="am" value="3">9:30</option>
     		<option class="am" value="4">9:45</option>
     		<option class="am" value="5">10:00</option>
     		<option class="am" value="6">10:15</option>
     		<option class="am" value="7">10:30</option>
     		<option class="am" value="8">10:45</option>
     		<option class="am" value="9">11:00</option>
     		<option class="am" value="10">11:15</option>
     		<option class="am" value="11">11:30</option>
     		<option class="am" value="12">11:45</option>
     		<option class="pm" value="13">12:00</option>
     		<option class="pm" value="14">12:15</option>
     		<option class="pm" value="15">12:30</option>
     		<option class="pm" value="16">12:45</option>
     		<option class="pm" value="17">1:00</option>
     		<option class="pm" value="18">1:15</option>
     		<option class="pm" value="19">1:30</option>
     		<option class="pm" value="20">1:45</option>
     		<option class="pm" value="21">2:00</option>
     		<option class="pm" value="22">2:15</option>
     		<option class="pm" value="23">2:30</option>
     		<option class="pm" value="24">2:45</option>
     		<option class="pm" value="25">3:00</option>
     		<option class="pm" value="26">3:15</option>
     		<option class="pm" value="27">3:30</option>
     		<option class="pm" value="28">3:45</option>
     		<option class="pm" value="29">4:00</option>
     		<option class="pm" value="30">4:15</option>
     		<option class="pm" value="31">4:30</option>
     		<option class="pm" value="32">4:45</option>
     		<option class="pm" value="33">5:00</option>
     		<option class="pm" value="34">5:15</option>
     		<option class="pm" value="35">5:30</option>
     		<option class="pm" value="36">5:45</option>
     		<option class="pm" value="37">6:00</option>
     	</select> 
     	</div>
     	
     	
     	<div class="col-xs-2">
     	<label for="am"> <br></label>
     	
     	<select class="form-control"   class="ampm" id="am" >
     		<option class="am" id="1">a.m.</option>
     		<option class="pm" id="2">p.m.</option>
     	</select> 
     
     	</div>
     	
     	
     	<div class="col-xs-4">
     	<label> to:</label>
     	<select class="form-control"  id="toTime" >
     		<option value="" selected hidden>Pick a end time </option>
     		<option class="am" value="1">9:00</option>
     		<option class="am" value="2">9:15</option>
     		<option class="am" value="3">9:30</option>
     		<option class="am" value="4">9:45</option>
     		<option class="am" value="5">10:00</option>
     		<option class="am" value="6">10:15</option>
     		<option class="am" value="7">10:30</option>
     		<option class="am" value="8">10:45</option>
     		<option class="am" value="9">11:00</option>
     		<option class="am" value="10">11:15</option>
     		<option class="am" value="11">11:30</option>
     		<option class="am" value="12">11:45</option>
     		<option class="pm" value="13">12:00</option>
     		<option class="pm" value="14">12:15</option>
     		<option class="pm" value="15">12:30</option>
     		<option class="pm" value="16">12:45</option>
     		<option class="pm" value="17">1:00</option>
     		<option class="pm" value="18">1:15</option>
     		<option class="pm" value="19">1:30</option>
     		<option class="pm" value="20">1:45</option>
     		<option class="pm" value="21">2:00</option>
     		<option class="pm" value="22">2:15</option>
     		<option class="pm" value="23">2:30</option>
     		<option class="pm" value="24">2:45</option>
     		<option class="pm" value="25">3:00</option>
     		<option class="pm" value="26">3:15</option>
     		<option class="pm" value="27">3:30</option>
     		<option class="pm" value="28">3:45</option>
     		<option class="pm" value="29">4:00</option>
     		<option class="pm" value="30">4:15</option>
     		<option class="pm" value="31">4:30</option>
     		<option class="pm" value="32">4:45</option>
     		<option class="pm" value="33">5:00</option>
     		<option class="pm" value="34">5:15</option>
     		<option class="pm" value="35">5:30</option>
     		<option class="pm" value="36">5:45</option>
     		<option class="pm" value="37">6:00</option>
     	</select> 
     	</div>
     	
     
     	<div class="col-xs-2">
     		<label for="am2"><br> </label>
     	<select class="form-control"  class="ampm" id="am2" required>
     		<option class="am" id="1">a.m.</option>
     		<option class="pm" id="2">p.m.</option>
     	</select> 
   		 </div>
   </div>
     	<br><br>
     	<label for="recipients">Invite a Group:</label>
     		<div class="form-group">
			  <textarea class="form-control" rows="5" id="recipients" placeholder="Recipient's: example1@syntelinc.com, example2@syntelinc.com"></textarea>
			</div>
     	<br>
     	<br>
     
     	<button type="submit" id="submitForm" class="btn btn-primary ">Submit</button>
     	<button type="reset" id="submitForm" class="btn btn-primary  ">Reset</button>
     </form>
		
		
        
		 	<%--<div id="scheduler_here" class="dhx_cal_container">
		    <div class="dhx_cal_navline">
		        <div class="dhx_cal_prev_button">&nbsp;</div>
		        <div class="dhx_cal_next_button">&nbsp;</div>
		        <div class="dhx_cal_today_button"></div>
		        <div class="dhx_cal_date"></div>
		        <div class="dhx_cal_tab" name="day_tab" style="display: inline ;right:204px;"></div>
		        <div class="dhx_cal_tab" name="week_tab" style="display: inline ;right:140px;"></div>
		        <div class="dhx_cal_tab" name="month_tab" style="display: inline ;right:76px;"></div>
		    </div>
		    <div class="dhx_cal_header"></div>
		    <div class="dhx_cal_data"></div>       
		</div> --%>
  
 
   
        </div>
        <div class="modal-footer">
         
        </div>
      </div>
    </div>
  </div> 
</div>
 
 <!-- -------------------------------------End of Make a booking Modal------------------------------ -->
 
 
 <div class="container2">
  <!-- Modal2 -->
  <div class="modal fade" id="myModal2" role="dialog">
    <div class="modal-dialog" >
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"><span class="glyphicon glyphicon-pencil"></span>Edit</h4>
        </div>
        <div class="modal-body">
    <form class="form-horizontal" role="form"> 
    <div class="form-group row">
     		<label>Alter Date:</label>
     	 	<br>
     	 <div class="col-xs-4">
     	<label for="month"> Month:</label>
     	<select class="form-control" id="month">
     		<option value="" selected hidden>Pick a Month </option>
     		<option >January </option>
     		<option value=2>February </option>
     		<option>March </option>
     		<option value=1>April </option>
     		<option>May </option>
     		<option value=1>June </option>
     		<option>July </option>
     		<option>August </option>
     		<option value=1>September </option>
     		<option>October </option>
     		<option value=1>November </option>
     		<option>December </option>
     	</select>
     	</div>
     	
     	<div class="col-xs-4">
     	<label for="day"> Day:</label>
     	<select class="form-control" id="day" >
     		<option value="" selected hidden>Pick a Day </option>
     		<option >1 </option>
     		<option >2 </option>
     		<option >4 </option>
     		<option >5 </option>
     		<option >6 </option>
     		<option >7 </option>
     		<option >8 </option>
     		<option >9 </option>
     		<option >10 </option>
     		<option >11 </option>
     		<option >12 </option>
     		<option >13 </option>
     		<option >14 </option>
     		<option >15 </option>
     		<option >16 </option>
     		<option >17 </option>
     		<option >18 </option>
     		<option >19 </option>
     		<option >20 </option>
     		<option >21 </option>
     		<option >22 </option>
     		<option >23 </option>
     		<option >24 </option>
     		<option >25 </option>
     		<option >26 </option>
     		<option >27 </option>
     		<option >28 </option>
     		<option class="hidedate1">29 </option>
     		<option class="hidedate1" >30 </option>
     		<option class="hidedate2">31 </option>
     	</select>
     	</div> 
    </div>	 
     		<br>
     		<br>
     		<label>Alter Time:</label>
     		<br>
     		<br>
     		
    <div class="form-group row ">	
     	<div class="col-xs-4">
     	<label> from:</label>
     	<select class="form-control"   id="fromTime" >
     		<option value="" selected hidden>Pick a start time </option>
     		<option class="am" value="1">9:00</option>
     		<option class="am" value="2">9:15</option>
     		<option class="am" value="3">9:30</option>
     		<option class="am" value="4">9:45</option>
     		<option class="am" value="5">10:00</option>
     		<option class="am" value="6">10:15</option>
     		<option class="am" value="7">10:30</option>
     		<option class="am" value="8">10:45</option>
     		<option class="am" value="9">11:00</option>
     		<option class="am" value="10">11:15</option>
     		<option class="am" value="11">11:30</option>
     		<option class="am" value="12">11:45</option>
     		<option class="pm" value="13">12:00</option>
     		<option class="pm" value="14">12:15</option>
     		<option class="pm" value="15">12:30</option>
     		<option class="pm" value="16">12:45</option>
     		<option class="pm" value="17">1:00</option>
     		<option class="pm" value="18">1:15</option>
     		<option class="pm" value="19">1:30</option>
     		<option class="pm" value="20">1:45</option>
     		<option class="pm" value="21">2:00</option>
     		<option class="pm" value="22">2:15</option>
     		<option class="pm" value="23">2:30</option>
     		<option class="pm" value="24">2:45</option>
     		<option class="pm" value="25">3:00</option>
     		<option class="pm" value="26">3:15</option>
     		<option class="pm" value="27">3:30</option>
     		<option class="pm" value="28">3:45</option>
     		<option class="pm" value="29">4:00</option>
     		<option class="pm" value="30">4:15</option>
     		<option class="pm" value="31">4:30</option>
     		<option class="pm" value="32">4:45</option>
     		<option class="pm" value="33">5:00</option>
     		<option class="pm" value="34">5:15</option>
     		<option class="pm" value="35">5:30</option>
     		<option class="pm" value="36">5:45</option>
     		<option class="pm" value="37">6:00</option>
     	</select> 
     	</div>
     	
     	
     	<div class="col-xs-2">
     	<label for="am"> <br></label>
     	
     	<select class="form-control"   class="ampm" id="am" >
     		<option class="am" id="1">a.m.</option>
     		<option class="pm" id="2">p.m.</option>
     	</select> 
     
     	</div>
     	
     	
     	<div class="col-xs-4">
     	<label> to:</label>
     	<select class="form-control"  id="toTime" >
     		<option value="" selected hidden>Pick a end time </option>
     		<option class="am" value="1">9:00</option>
     		<option class="am" value="2">9:15</option>
     		<option class="am" value="3">9:30</option>
     		<option class="am" value="4">9:45</option>
     		<option class="am" value="5">10:00</option>
     		<option class="am" value="6">10:15</option>
     		<option class="am" value="7">10:30</option>
     		<option class="am" value="8">10:45</option>
     		<option class="am" value="9">11:00</option>
     		<option class="am" value="10">11:15</option>
     		<option class="am" value="11">11:30</option>
     		<option class="am" value="12">11:45</option>
     		<option class="pm" value="13">12:00</option>
     		<option class="pm" value="14">12:15</option>
     		<option class="pm" value="15">12:30</option>
     		<option class="pm" value="16">12:45</option>
     		<option class="pm" value="17">1:00</option>
     		<option class="pm" value="18">1:15</option>
     		<option class="pm" value="19">1:30</option>
     		<option class="pm" value="20">1:45</option>
     		<option class="pm" value="21">2:00</option>
     		<option class="pm" value="22">2:15</option>
     		<option class="pm" value="23">2:30</option>
     		<option class="pm" value="24">2:45</option>
     		<option class="pm" value="25">3:00</option>
     		<option class="pm" value="26">3:15</option>
     		<option class="pm" value="27">3:30</option>
     		<option class="pm" value="28">3:45</option>
     		<option class="pm" value="29">4:00</option>
     		<option class="pm" value="30">4:15</option>
     		<option class="pm" value="31">4:30</option>
     		<option class="pm" value="32">4:45</option>
     		<option class="pm" value="33">5:00</option>
     		<option class="pm" value="34">5:15</option>
     		<option class="pm" value="35">5:30</option>
     		<option class="pm" value="36">5:45</option>
     		<option class="pm" value="37">6:00</option>
     	</select> 
     	</div>
     	
     
     	<div class="col-xs-2">
     		<label for="am2"><br> </label>
     	<select class="form-control"  class="ampm" id="am2" required>
     		<option class="am" id="1">a.m.</option>
     		<option class="pm" id="2">p.m.</option>
     	</select> 
   		 </div>
   </div>

     	<br>
     	<br>
     		<br>
     		<br>
     		<label for="recipients">Invite Additional Recipients:</label>
     		<div class="form-group">
			  <textarea class="form-control" rows="5" id="recipients" placeholder="Recipient's: example1@syntelinc.com, example2@syntelinc.com"></textarea>
			</div>
     		<br>
     		<br>
              <button type="submit"  class="btn btn-primary"><span class="glyphicon glyphicon-floppy-disk" id="deleteRow"></span>Save Changes</button>
              <button type="submit" class="btn btn-success" id="deleteRow"><span class="glyphicon glyphicon-trash"></span>Delete Booking</button>
              <button type="submit" class="btn btn-secondary" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
          </form>
          </div>
        </div>
      </div>
    </div>
  </div>
 
 
<script>
$(document).ready(function(){
    $(".roomId").click( function(){
    	var getID=$(this).text()
    	//alert(getID);
        $("#myModal3").modal();
    	scheduler.config.details_on_create = true;
    	scheduler.init('scheduler_here', new Date(), "week");
        
    });
    
    
    
    
        
     $("#schedule").click(function(){
    	  $("#myModal").modal();
           		 $('#roomTimes').click(function (){
	            	$('td').click(function (){
	            		//var time = $(this).text();
	                	//alert(time);
	            		$("#myModal2").modal(function (){
	            			
		            	 	$("#fromTime").change(function(){
		            	 		var fromtime= $(this).val();
		    	           	 	alert(fromtime);
		    	           	 	var totime= $("#toTime").val();
	    	           	 	
	    	           	 		
							});
		            	
						});
					});          	        
				});
	            	
		
    	 
    
            
            $("#editRow").click(function(){
                $("#myModal2").modal();
            
       		 });
  
    });
   
     
     $('#month').change(function (){
    	 if ($(this).val()==2)
    		 {
    		 $('.hidedate1').hide();
    		 $('.hidedate2').hide();
    		 }
    	 if ($(this).val()==1)
    		 {
    		 $('.hidedate1').show();
    		 $('.hidedate2').hide();
    		 }
     });
});



<%--original

 $(document).ready(function(){
    $(".roomId").click( function(){
    	var getID=$(this).text()
    	//alert(getID);
        $("#myModal").modal();
        
        $("#editRow").click(function(){
            $("#myModal2").modal();
        });
        
        $("#bookNow").click(function(){
            $("#myModal3").modal();
            	
            	scheduler.config.details_on_create = true;
            	scheduler.init('scheduler_here', new Date(), "week");
            	
            
        
        });
      
    });
   
});  --%>

</script>

</div>

<br>
<br>
<br>
 
</body>
<br>
</html>

<!-- Footer -->

<%@include file='/Static Webpage/footer.html' %> 

