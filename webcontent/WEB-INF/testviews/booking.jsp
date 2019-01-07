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
  <title>Booking</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Make Booking</title>
  <link rel=" stylesheet" type="text/css" href="<c:url value="/resources/styles/Booking.css"/>">
  <link href="<c:url value="https://fonts.googleapis.com/icon?family=Material+Icons"/>" rel="stylesheet">

<!-- Bootstrap Date-Picker Plugin -->
<script type="text/javascript" src="<c:url value="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"/>"></script>
<link rel="stylesheet" href="<c:url value="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>">

<script src="<c:url value="/resources/scripts/synbook-general.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/scripts/synbook-room-table.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/scripts/synbook-booking-table.js"/>" type="text/javascript"></script>

<script type="text/javascript">
	var roomForBooking;
	
	function addTableButtonsOnClickEvents() {
    	$("#bookingButtonRow1").click(function(event) {
    		event.preventDefault();
    		showBookingDialog(roomsCurrentlyInTable[0]);
    	});
    	
    	$("#bookingButtonRow2").click(function(event) {
    		event.preventDefault();
    		showBookingDialog(roomsCurrentlyInTable[1]);
    	});
    	
    	$("#bookingButtonRow3").click(function(event) {
    		event.preventDefault();
    		showBookingDialog(roomsCurrentlyInTable[2]);
    	});
    	
    	$("#bookingButtonRow4").click(function(event) {
    		event.preventDefault();
    		showBookingDialog(roomsCurrentlyInTable[3]);
    	});
    	
    	$("#bookingButtonRow5").click(function(event) {
    		event.preventDefault();
    		showBookingDialog(roomsCurrentlyInTable[4]);
    	});
    }

	function getDateFromBookingDialogInfo(month, day, timeString, amPm) {
		var date = new Date();
		date.setMonth(month, day);
		
		var timeArray = timeString.split(":");
		for (var i = 0; i < timeArray.length; i++) {
			timeArray[i] = parseInt(timeArray[i]);
		}
		
		if (amPm === "pm") {
			timeArray[0] += 12;
		}
		
		date.setHours(timeArray[0], timeArray[1], 0);
		
		if (date < Date.now()) {
			date.setFullYear(date.getFullYear() + 1);
		} 
		
		return date;
	}
	
	function showBookingDialog(room) {
		roomForBooking = room;
		
		$("#edit").modal('show');
	}
	
	$(document).ready(function() {
		tableRows = [$("#roomRecordTableRow1"), $("#roomRecordTableRow2"), $("#roomRecordTableRow3"),
		             $("#roomRecordTableRow4"), $("#roomRecordTableRow5")];
    	numOfRoomsPerTable = tableRows.length;
    	
    	updateRoomTable(addTableButtonsOnClickEvents, addTableButtonsOnClickEvents);
    	
    	$("#submitForm").click(function(event) {
    		event.preventDefault();
    		
    		var data = {};
    		
    		updateBookingDateTimeForRequest(data);
    		data["room"] = roomForBooking;
    		
    		postBookingDataToServer("savebooking", data, function(event) {
    			alert("Your booking has been created.")
    			$("#edit").modal('hide');
    		});
    	});
	});
</script>

  
</head>
<body>
 <body style="background-color:#fffef2;">

       <!-------------------------- Booking drop down type Done ----------------------------------------------->



		<!-- 

             <div class=" dropdown hidden-xs" id='roomheader'>
               <button class="btn  btn-success dropdown-toggle btn-lg"  type="button"   data-toggle="dropdown">Room Type
                   <span class="caret"></span></button>
               <ul class="dropdown-menu" >
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
		 
		  -->

<br>
<br>





       <!-------------------------- Booking Done----------------------------------------------->
      
       <div class="table-responsive-lg table-hover">
       <table id="roomRecordTable" class="table table-striped table-bordered">
                  <thead>
                  <tr>

                  </tr>
                  </thead>
                  <tbody>
                  
                  

                  <tr id="roomRecordTableRow1">
                  	 <td class="roomRecordTableIcon"><span class=" fa fa-bullhorn iconFont"></span></td>
                      <td id="roomName1" class="roomRecordTableName"><span>Conference</span></td>
                      <td class="features bgcolor">
                          <div class="center">
	                          <a href="#" class="confirm-delete"><span class="fa fa-television featureMonitors">0</span></a>
	                          <a href="#" class="confirm-delete"><span class="fa fa-phone featurePhone">0</span></a>
	                          <a href="#" class="confirm-delete"><span class="fa fa-table featureDesks">0</span></a>
	                          <a href="#" class="confirm-delete"><span class="glyphicon glyphicon-blackboard featureBlackboard">0</span></a>
	                          <a href="#" class="confirm-delete"><span class="fa fa-folder-o featureChairs">0</span></a>
                          </div>
                      </td>
                       <td><a href="#" id="bookingButtonRow1" class="roomId" class="confirm-delete  btn-sucess btn-lg "> <span class="glyphicon glyphicon-plus"> </span> </a></td>
                  </tr>

                  <tr id="roomRecordTableRow2">
                  	<td class="roomRecordTableIcon"><span class="fa fa-television iconFont"></span></td>
                      <td id="roomName2" class="roomRecordTableName"><span>Training</span></td>
                      <td class="features bgcolor">
						  <div class="center">
						  	<a href="#" class="confirm-delete"><span class="fa fa-television featureMonitors" >0</span></a>
                          	<a href="#" class="confirm-delete"><span class="fa fa-phone featurePhone" >0</span></a>
                          	<a href="#" class="confirm-delete"><span class="fa fa-table featureDesks" >0</span></a>
                          	<a href="#" class="confirm-delete"><span class="glyphicon glyphicon-blackboard featureBlackboard" >0</span></a>
                          	<a href="#" class="confirm-delete"><span class="fa fa-folder-o featureChairs" >0</span></a>
						  </div>
                      </td>
           
                      <td><a href="#" id="bookingButtonRow2" class="roomId"class="confirm-delete  btn-sucess btn-lg "> <span class="glyphicon glyphicon-plus"> </span> </a></td>
                  </tr>

                  <tr id="roomRecordTableRow3" class="primary">
                   	 <td class="roomRecordTableIcon"><span class="glyphicon glyphicon-object-align-vertical iconFont"></span></td>
                      <td id="roomName3" class="roomName roomRecordTableName"><span>Scrum </span></td>
                      <td class="features bgcolor">
                      	<div class="center">
                      		<a href="#" class="confirm-delete"><span class="fa fa-television featureMonitors" >0</span></a>
                          	<a href="#" class="confirm-delete"><span class="fa fa-phone featurePhone" >0</span></a>
                          	<a href="#" class="confirm-delete"><span class="fa fa-table featureDesks" >0</span></a>
                          	<a href="#" class="confirm-delete"><span class="glyphicon glyphicon-blackboard featureBlackboard" >0</span></a>
                          	<a href="#" class="confirm-delete"><span class="fa fa-folder-o featureChairs" >0</span></a>
                      	</div>
                      </td>

                       <td><a href="#" id="bookingButtonRow3" class="roomId" class="confirm-delete  btn-sucess btn-lg "> <span class="glyphicon glyphicon-plus"> </span> </a></td>
                  </tr >
                  
                  <tr id="roomRecordTableRow4" class="primary">
                   	 <td class="roomRecordTableIcon"><span class="glyphicon glyphicon-object-align-vertical iconFont"></span></td>
                      <td id="roomName4" class="roomName roomRecordTableName"><span>Scrum </span></td>
                      <td class="features bgcolor">
                      	<div class="center">
                      		<a href="#" class="confirm-delete"><span class="fa fa-television featureMonitors" >0</span></a>
                          	<a href="#" class="confirm-delete"><span class="fa fa-phone featurePhone" >0</span></a>
                          	<a href="#" class="confirm-delete"><span class="fa fa-table featureDesks" >0</span></a>
                          	<a href="#" class="confirm-delete"><span class="glyphicon glyphicon-blackboard featureBlackboard" >0</span></a>
                          	<a href="#" class="confirm-delete"><span class="fa fa-folder-o featureChairs" >0</span></a>
                      	</div>
                      </td>

                       <td><a href="#" id="bookingButtonRow4" class="roomId" class="confirm-delete  btn-sucess btn-lg "> <span class="glyphicon glyphicon-plus"> </span> </a></td>
                  </tr >
                  
                  <tr id="roomRecordTableRow5" class="primary">
                   	 <td class="roomRecordTableIcon"><span class="glyphicon glyphicon-object-align-vertical iconFont"></span></td>
                      <td id="roomName1" class="roomName roomRecordTableName"><span>Scrum </span></td>
                      <td class="features bgcolor">
                      	<div class="center">
                      		<a href="#" class="confirm-delete"><span class="fa fa-television featureMonitors" >0</span></a>
                          	<a href="#" class="confirm-delete"><span class="fa fa-phone featurePhone" >0</span></a>
                          	<a href="#" class="confirm-delete"><span class="fa fa-table featureDesks" >0</span></a>
                          	<a href="#" class="confirm-delete"><span class="glyphicon glyphicon-blackboard featureBlackboard" >0</span></a>
                          	<a href="#" class="confirm-delete"><span class="fa fa-folder-o featureChairs" >0</span></a>
                      	</div>
                      </td>

                       <td><a href="#" id="bookingButtonRow5" class="roomId" class="confirm-delete  btn-sucess btn-lg "> <span class="glyphicon glyphicon-plus"> </span> </a></td>
                  </tr >

                  </tbody>
              </table>
      
     
       
   </div>
       <!-------------------------- Next Buttons----------------------------------------------->

         <div class="">
          <ul id="nextButtons" class="pager pager-hover  hidden-xs">
          </ul>
      </div>
  </div>

<!-------------------------- Footer ----------------------------------------------->
<%@include file="footer.jsp"%> 


<!------------------------------------ Booking form ----------------------------------------------->

<!--modal-->
<!-- TODO: Get the error modal working if time permits. 
<div id="bookingError" class="modal fade modal" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="vertical-alignment-helper">
		<div class="modal-dialog model-sm vertical-align-center">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
                	<h1 class="text-center" id="roomTitle"><strong>Error</strong></h1>
				</div>
				<div class="modal-body">
				</div>
				<div class="modal-footer">
				</div>
			</div>
		</div>
	</div>
</div>
-->

<div id="edit" class="modal fade " tabindex="-1" role="dialog" aria-hidden="true">
<div class="vertical-alignment-helper">
<div class=" modal-dialog  vertical-align-center">
			<div class="modal-content">
			 <div class="modal-header">

                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
                <h1 class="text-center" id="roomTitle"><strong>Make Booking</strong></h1>
			  </div>
			  
			    <div class="modal-body">    
         <div class="text-center ">  
                    
      <form class="form-inline"> 
		<div class="form-group">
     	
		      <label class="control-label requiredField" for="date">
		       Date:<span class="asteriskField"></span></label>
	      <input class="form-control" id="date" name="date" placeholder="MM/DD/YYYY" type="text"/>
			<br><br> 
     	</div>  
 	 <div class="form-group ">
    		
     		<label>Pick Time:</label>
     		<br>	<br>
     	<label> From:</label>
     		<input class="form-control"   id="fromTime" type="time">
     	  
     	<label> To:</label>
     		<input class="form-control"   id="toTime" type="time">
	</div>
     	<br><br> <!--  
     	<label for="recipients">Invite a Group:</label>
     		<div class="form-group">
			  <textarea class="form-control" rows="5" id="recipients" placeholder="Recipient's: example1@syntelinc.com, example2@syntelinc.com"></textarea>
			</div> -->
     	<br>
     	<br>
     
    
                <div class="modal-footer">

                    <div class="col-md-6">
                        <button type="submit" id="submitForm" class="btn btn-primary btn-lg">Submit</button>
                    </div>
                    <div class="col-md-3">
                        <button  type="reset" id="resetForm" class="btn btn-primary btn-lg" data-dismiss="modal" aria-hidden="true">Reset</button>
                    </div>
                 
                </div>
     </form>              
                                          
 </div>        


                
            </div>
        </div>
</div>
</div>


    <script>
    $(document).ready(function(){
      var date_input=$('input[name="date"]'); //our date input has the name "date"
      var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
      var options={
        format: 'mm/dd/yyyy',
        container: container,
        todayHighlight: true,
        autoclose: true,
      };
      date_input.datepicker(options);
      
      
      
    
    });
</script> 
</div>


</body>
</html>


