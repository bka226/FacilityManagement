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


<!-- Bootstrap Date-Picker Plugin -->
<script type="text/javascript" src="<c:url value="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"/>"></script>
<link rel="stylesheet" href="<c:url value="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>">
<link rel="stylesheet" href="<c:url value="https://formden.com/static/cdn/bootstrap-iso.css" />">

<script src="<c:url value="/resources/scripts/synbook-general.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/scripts/synbook-room-table.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/scripts/synbook-booking-table.js"/>" type="text/javascript"></script>

<script type="text/javascript">
	var bookingForDelete;
	var bookingForEdit;
	var bookingOfTheWeek;
	var roomForBooking;

	function generateListsWithOnClickAnchors(jqueryLists, anchorOptions) {
		newAnchorElement = $("<a>", anchorOptions);
		
		jqueryLists.append($("<li>").append(newAnchorElement));
	}
	
	function getBookingInfoForRoom(roomId) {
		getRequestToServer(getFRMUrl("selectroom/weekly/viewbooking/") + roomId, function(data) {
			populateBookingTable(data);
		});
	}
	
	function getNormalUSDateFormatter() {
		return getUSDateTimeFormat({ year: '2-digit', month: '2-digit', day: '2-digit' })
	}

	function getRoomsOfRoomType(roomTypeName) {
		var roomType = getRoomTypeObject(roomTypeName);
		
		getRequestToServer(getFRMUrl("viewroom/roomtype/") + roomType.id, function(data) {
			rooms = data.rooms;
			$(".room-combobox").html('');
			rooms.forEach(function(element) {
				var anchorOptions = {
					id: element.id,
					on: {
						click: function(event) {
							getBookingInfoForRoom(event.target.id);
						}
					},
					text: element.name
				};
				generateListsWithOnClickAnchors($(".room-combobox"), anchorOptions);
			});
		});
	}
	
	function getThisWeeksSundaysDate() {
		var sundayDate = new Date();
		
		var sundaysDateValue = sundayDate.getDate() - sundayDate.getDay();
		if (sundaysDateValue < 1) {
			if (sundayDate.getMonth() - 1 < 0) {
				sundayDate.setFullYear(sundayDate.getFullYear() - 1);
				sundayDate.setMonth(11);
			} else {
				sundayDate.setMonth(sundayDate.getMonth() - 1);
			}
			sundayDate.setDate(getDaysInMonth(sundayDate.getMonth(), sundayDate.getFullYear()) + sundaysDateValue);
		} else {
			sundayDate.setDate(sundaysDateValue);
		}
		
		return sundayDate;
	}
	
	function getUSDateTimeFormat(options) {
		return new Intl.DateTimeFormat('en-US', options).format;
	}

	function loadClickEventListenersForPopoverButtons() {
		$(".delete-button").click(function(event){
			showBookingModal($(this), "delete", function(dayOfWeek, bookingNum) {
				bookingForDelete = bookingOfTheWeek[dayOfWeek][bookingNum];
			})
		});
		
		$(".edit-button").click(function(event){
			showBookingModal($(this), "edit", function(dayOfWeek, bookingNum) {
				bookingForEdit = bookingOfTheWeek[dayOfWeek][bookingNum];
				
				$('#date').datepicker("setDate", bookingForEdit.startDate);
				$("#fromTime").val(prettyPrintTimesString(bookingForEdit.startTime, true));
				$("#toTime").val(prettyPrintTimesString(bookingForEdit.endTime, true));
			});
		});
	}
	
	function prettyPrintTimesString(militaryTimeInt, shouldPrintMilitaryTime) {
		var timeDateObj = new Date();
		
		timeDateObj.setHours(militaryTimeInt / 100, militaryTimeInt % 100);
		
		var americanTimeFormatPrinter = getUSDateTimeFormat({ hour: '2-digit', minute: '2-digit', hour12: !shouldPrintMilitaryTime })
		
		return americanTimeFormatPrinter(timeDateObj);
	}
	
	function populateBookingTable(bookingData) {
		var bookings = bookingData.bookings; 
		bookingOfTheWeek = [ [], [], [], [], [] ];
		
		bookings.forEach(function(element) {
			element.startDate = new Date(element.startDate);
			element.endDate = new Date(element.endDate);
			if (element.startDate.getDay() !== 0 && element.startDate.getDay() !== 6) {
				bookingOfTheWeek[element.startDate.getDay() - 1].push(element);	
			}
		});
		
		bookingOfTheWeek.forEach(function(element) {
			element.sort(function(a, b) {
				return a.startTime - b.startTime;
			});
		});
		
		var numOfRowInBookingTable = 0;
		for (var i = 0; i < bookingOfTheWeek.length; i++) {
			if (numOfRowInBookingTable < bookingOfTheWeek[i].length) {
				numOfRowInBookingTable = bookingOfTheWeek[i].length;
			}
		}
		
		var bookingTableBody = $("#bookingTableBody");
		bookingTableBody.html('');
		for (var i = 0; i < numOfRowInBookingTable; i++) {
			var newBookingRow = $("<tr>");
			var weekendTd = $("<td>", {
				"class": "weekend"
			});
			
			newBookingRow.append(weekendTd);
			bookingOfTheWeek.forEach(function(element, index) {
				var weekTd = $("<td>", {
					"class": "week"
				});
				
				if (element.length > i) {
					weekTd.text(prettyPrintTimesString(element[i].startTime) + " - " + prettyPrintTimesString(element[i].endTime));
					weekTd.popover({
						html: true,
						content: '<a id="delete-' + i + ':' + index + '" class="btn btn-primary btn-sm btn-block delete-button">Delete</a> ' +
						'<br> <a id="edit-' + i + ':' + index + '" class="btn btn-primary btn-sm btn-block edit-button">Edit</a>',
						container:"table",
						placement: "right",
					});
					
					$(weekTd).on("shown.bs.popover", function(){
						loadClickEventListenersForPopoverButtons();
					});
				}
				
				newBookingRow.append(weekTd);
			});
			newBookingRow.append(weekendTd.clone());
			
			bookingTableBody.append(newBookingRow);
		}
	}
	
	function showBookingModal(thisBooking, bookingModalId, setupCallback) {
		setupCallback = setupCallback || function(dayOfWeek, bookingNum) {};
		
		var patt = /\d+:\d+/;
		var coordinates = patt.exec(thisBooking.attr("id"))[0].split(":");
		var bookingNum = parseInt(coordinates[0]);
		var dayOfWeek = parseInt(coordinates[1]);
		
		setupCallback(dayOfWeek, bookingNum);
		
		$(".week").popover('hide');
		$("#" + bookingModalId).modal("show");
	}
	
	function updateBookingTableHeaders() {
		var sundayDate = getThisWeeksSundaysDate();
		
		var dateFormatPrinter = getNormalUSDateFormatter();
		
		$("#daysOfWeekRow").children().each(function(index, element) {
			$(element).html('<p class=" fa fa-calendar"></p>' + dateFormatPrinter(sundayDate));
			sundayDate.setDate(sundayDate.getDate() + 1);
		});
	}

	$(document).ready(function() {
		updateBookingTableHeaders();
		
		getRequestToServer(getFRMUrl("viewroomtype"), function(data){
			roomTypes = data.roomTypes;
			roomTypes.forEach(function(element) {
				var anchorOptions = {
					on: {
						click: function(event) {
							getRoomsOfRoomType(event.target.innerHTML);
						}
					},
					text: element.rtype
				};
				generateListsWithOnClickAnchors($(".roomtype-combobox"), anchorOptions);
			});
		});
		
		$("#submitEditForm").click(function(event) {
			event.preventDefault();
			
			updateBookingDateTimeForRequest(bookingForEdit);
			
			postBookingDataToServer("editbooking/savebookingedit", bookingForEdit, function(event) {
    			$("#edit").modal('hide');
    			getBookingInfoForRoom(bookingForEdit.room.id);
    		});
		});
		
		$("#yesDeleteBtn").click(function(event) {
			event.preventDefault();
			
			getRequestToServer(getFRMUrl("cancelbooking/" + bookingForDelete.id), function(event) {
				$("#delete").modal("hide");
				getBookingInfoForRoom(bookingForDelete.room.id);
			}, function(event) {
				alert("Can't delete this booking at this time.")
			});
		});
	});
</script>
  
</head>
<body>
 <body style="background-color:#fffef2;">
   <div class="container" >



       <!-------------------------- Booking drop down type Done ----------------------------------------------->





		<div class="btn-group" class="list-inline"> 
			<div class="btn-group">
            <div class=" dropdown hidden-xs" id='Scheduleheader'>
               <button class="btn  btn-success dropdown-toggle btn-lg"  type="button"   data-toggle="dropdown">Room Type
                   <span class="caret"></span></button>
               <ul class="dropdown-menu roomtype-combobox" >
               </ul>
		 </div>

    	<div class=" dropdown hidden-lg hidden-sm hidden-md" >
               <button class="btn  btn-success dropdown-toggle btn-lg"  type="button"   data-toggle="dropdown">Room Type
                   <span class="caret"></span></button>
               <ul class="dropdown-menu roomtype-combobox" >
               </ul>
		 </div>
		 </div>
		 <div class="btn-group">

            <div class=" dropdown hidden-xs" id='Scheduleheader2' style="margin-left: 20px;">
               <button class="btn  btn-success dropdown-toggle btn-lg"  type="button"   data-toggle="dropdown">Room Name
                   <span class="caret"></span></button>
               <ul class="dropdown-menu room-combobox" >
               </ul>
		 </div>

    	<div class=" dropdown hidden-lg hidden-sm hidden-md" >
               <button class="btn  btn-success dropdown-toggle btn-lg"  type="button"   data-toggle="dropdown">Room Name
                   <span class="caret"></span></button>
               <ul class="dropdown-menu room-combobox" >
               </ul>
		 </div>
		 </div>
</div> 

<br>
<br>




 <!-------------------------- Schedule Table----------------------------------------------->

<div class="table-responsive-lg table-hover">
	<table class="table table-striped table-bordered" id="schedule">
	<thead>
        
		<tr id="daysOfWeekRow">
				<th class="weekend"><p class=" fa fa-calendar"></p> 5/13/18  </th>
	      		<th><p class=" fa fa-calendar"></p> 5/14/18  </th>
	      		<th><p class=" fa fa-calendar"></p> 5/16/18 </th>
	      		<th><p class=" fa fa-calendar"></p> 5/15/18 </th>
	      		<th><p class=" fa fa-calendar"></p> 5/17/18 </th>
	      		<th><p class=" fa fa-calendar"></p> 5/18/18 </th>
	      		<th class="weekend"><p class=" fa fa-calendar"></p> 5/19/18 </th>
		</tr>
	</thead>

	<tbody id="bookingTableBody">
	</tbody>
	</table>
	
 <!-------------------------------- Script for  Modal ----------------------------------------------->
	
	<%-- <script> 
	
	$(document).ready(function(){
	    $("#test").click( function(){
	    	//var getID=$(this).text()
	    	//alert(getID);
	        $("#edit").modal();
	    });
	
	
	</script> --%>
    
       
</div>
      <!-------------------------- Next Buttons----------------------------------------------->

	<!-- TODO: Have the option to look weeks in advance for scheduling. 
         <div class="">
          <ul class="pager pager-hover  hidden-xs">
              <li><button class="btn btn-Secondary btn-lg" hef="#">&laquo;</button></li>
            
              <li> <button class="btn btn-Secondary btn-lg" href="#">&raquo;</button>
          </ul>
      </div>
      -->
  </div>
  
     <!--------------------------------  Modal to edit----------------------------------------------->
     
   <div id="edit" class="modal fade " tabindex="-1" role="dialog" aria-hidden="true">
<div class="vertical-alignment-helper">
<div class=" modal-dialog  vertical-align-center">
			<div class="modal-content">
			 <div class="modal-header">

                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
                <h1 class="text-center" id="roomTitle"><strong>Alter Booking</strong></h1>
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
    		
     		<label>Alter Time:</label>
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

                    <div class="col-md-9">
                        <button type="submit" id="submitEditForm" class="btn btn-primary btn-lg">Save Changes</button>
                    </div>
                    <div class="col-md-2">
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
	
	<!--------------------------------- Modal to delete -------------------------------------------->
     <div id="delete" class="modal fade modal" tabindex="-1" role="dialog">
	     <div class="vertical-alignment-helper">
	     	<div class="modal-dialog model-lg vertical-align-center">
	     		<div class="modal-content">
	     			<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
						<h1 class="text-center" id="deleteConfirmationTitle"><strong>Delete Booking</strong></h1>
					</div>
					<div class="modal-body text-center">
						<h2>Are you sure?</h2>
					</div>
					<div class="modal-footer">
						<div class="col-md-9">
							<button id="yesDeleteBtn" class="btn btn-primary btn-lg" >Yes</button>
						</div>
						<div class="col-md-2">
							<button id="noDeleteBtn" class="btn btn-lg" data-dismiss="modal" aria-hidden="true">No</button>
						</div>
					</div>
	     		</div>
	     	</div>
     	</div>
     </div>


    <script>
    
    $(document).ready(function(){
      var date_input=$('input[name="date"]'); //our date input has tde name "date"
      var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
      var options={
        format: 'mm/dd/yyyy',
        container: container,
        todayHighlight: true,
        autoclose: true,
      };
      date_input.datepicker(options);
      
      
      <%--
      $(".week").click( function(){
	    	var getID=$(this).text()
	    	alert(getID);

	    	
	        $("#edit").modal();
      }); --%>
    });
</script> 
     
  
     
     
     </div>

<br>
<br>
<br>
<br>





 <!-------------------------- Footer ----------------------------------------------->
<%@include file="footer.jsp"%>    
</body>
</html>
