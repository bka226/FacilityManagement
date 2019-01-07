<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file = "HeaderAndFooter.jsp" %>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <script src="<c:url value="/resources/scripts/synbook-general.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/scripts/synbook-room-table.js"/>" type="text/javascript"></script>

    <title> SynBook </title>
    
    <script type="text/javascript">
    var roomToDelete;
    var roomToEdit;
    
    function addTableButtonsOnClickEvents() {
    	$("#editRoomButtonRow1").click(function(event) {
    		event.preventDefault();
    		showEditDialogAndRoom(roomsCurrentlyInTable[0]);
    	});
    	
    	$("#editRoomButtonRow2").click(function(event) {
    		event.preventDefault();
    		showEditDialogAndRoom(roomsCurrentlyInTable[1]);
    	});
    	
    	$("#editRoomButtonRow3").click(function(event) {
    		event.preventDefault();
    		showEditDialogAndRoom(roomsCurrentlyInTable[2]);
    	});
    	
    	$("#editRoomButtonRow4").click(function(event) {
    		event.preventDefault();
    		showEditDialogAndRoom(roomsCurrentlyInTable[3]);
    	});
    	
    	$("#editRoomButtonRow5").click(function(event) {
    		event.preventDefault();
    		showEditDialogAndRoom(roomsCurrentlyInTable[4]);
    	});
    	
    	$("#deleteRoomButtonRow1").click(function(event) {
    		event.preventDefault();
    		showDeleteDialogAndRoom(roomsCurrentlyInTable[0]);
    	});
    	
    	$("#deleteRoomButtonRow2").click(function(event) {
    		event.preventDefault();
    		showDeleteDialogAndRoom(roomsCurrentlyInTable[1]);
    	});
    	
    	$("#deleteRoomButtonRow3").click(function(event) {
    		event.preventDefault();
    		showDeleteDialogAndRoom(roomsCurrentlyInTable[2]);
    	});
    	
    	$("#deleteRoomButtonRow4").click(function(event) {
    		event.preventDefault();
    		showDeleteDialogAndRoom(roomsCurrentlyInTable[2]);
    	});
    	
    	$("#deleteRoomButtonRow5").click(function(event) {
    		event.preventDefault();
    		showDeleteDialogAndRoom(roomsCurrentlyInTable[2]);
    	});
    }
    
    function clearFeatureText() {
    	$("#editResourceFeatureMonitors").val('');
    	$("#editResourceFeaturePhone").val('');
    	$("#editResourceFeatureDesks").val('');
    	$("#editResourceFeatureBlackboard").val('');
    	$("#editResourceFeatureChairs").val('');
    }
    
    function showDeleteDialogAndRoom(room) {
    	roomToDelete = room;
    	
    	$("#deleteResourceName").text(roomToDelete.name);
		
		$("#delete").modal('show');
    }
    
	function showEditDialogAndRoom(room) {
		roomToEdit = room;
		
		$("#editResourceSuperRoom").prop('checked', roomToEdit.superRoom);
		$("#editResourceCapacity").val(roomToEdit.capacity);
		$("#editResourceName").val(roomToEdit.name);
		
		clearFeatureText();
		
		updateFeatures(roomToEdit, function(resourceFeatureText, element) {
			resourceFeatureText.val(element.quantity);
		});
		
		$("#edit").modal('show');
    }
	
	function updateFeatures(room, action) {
    	room.features.forEach(function(element) {
    		var resourceFeatureText = $("#editResourceFeature" + element.feature.name);
    		
			if (resourceFeatureText) {
				action(resourceFeatureText, element);
			}
		});
    }
	
	function updateRoomTableWithRefreshedEventHandlerForEditDeleteBtn() {
		var refreshEventHandlerFunc = function() {
			addTableButtonsOnClickEvents();
		}
		
		updateRoomTable(refreshEventHandlerFunc, refreshEventHandlerFunc);
	}
    
    $(document).ready(function() {
    	tableRows = [$("#roomRecordTableRow1"), $("#roomRecordTableRow2"), $("#roomRecordTableRow3"), 
    	             $("#roomRecordTableRow4"), $("#roomRecordTableRow5")];
    	numOfRoomsPerTable = tableRows.length;

    	getRequestToServer(getFRMUrl("viewroomtype"), function(data) {
    		roomTypes = data.roomTypes;
    		roomTypes.forEach(function(element, index) {
    			var newOption = $('<option>', {
    				value: index,
    				text: element.rtype
    			});
    			
    			$("#addResourceRoomType").append(newOption);
    		});
    	});
    	
    	updateRoomTableWithRefreshedEventHandlerForEditDeleteBtn();
    	
    	$("#addResourceForm").submit(function(event) {
    		event.preventDefault();
    		
    		var room = {};
    		
    		room["name"] = $("#addResourceName").val();
    		
    		var roomTypeObj = getRoomTypeObject($("#addResourceRoomType option:selected").text());
    		room["roomType"] = roomTypeObj;

    		room["superRoom"] = $("#addResourceSuperRoom").prop('checked');
    		room["capacity"] = $("#addResourceCapacity").val();
    		
    		postJsonDataToServer(getFRMUrl("saveroom"), room, function(data) {
				console.log("SUCCESS: " + data);
				updateRoomTableWithRefreshedEventHandlerForEditDeleteBtn();
			});
    	});
    	
    	$("#addResourceSubmit").click(function(event) {
    		$("#addResourceForm").submit();
    	});
    	
    	$("#deleteResourceSubmit").click(function(event) {
    		getRequestToServer(getFRMUrl("deleteroom/" + roomToDelete.id), function(data) {
    			updateRoomTableWithRefreshedEventHandlerForEditDeleteBtn();
    		});
    	});
    	
    	$("#editResourceSubmit").click(function(event) {
    		roomToEdit.name = $("#editResourceName").val();
    		roomToEdit.superRoom = $("#editResourceSuperRoom").prop('checked');
    		roomToEdit.capacity = $("#editResourceCapacity").val();
    		
    		updateFeatures(roomToEdit, function(resourceFeatureText, element) {
    			if (resourceFeatureText.val()) {
    				element.quantity = resourceFeatureText.val();
    			} else {
    				element.quantity = 0;
    			}
    		});
    		
    		postJsonDataToServer(getFRMUrl("saveroomedit"), roomToEdit, function(data) {
    			updateRoomTableWithRefreshedEventHandlerForEditDeleteBtn();
    		});
    	});
    });
    </script>
	
  </head>
  <body style="background-color:#fffef2;">

  <!-------------------------- Image Hover ----------------------------------------------->
   <div class="container" >
       <!-------------------------- Room Type Dropdown ----------------------------------------------->



       <div class=" dropdown hidden-xs " id="dropdown_button">

               <a href="#" class=" btn btn-success btn-responsive-lg btn-lg " id="plussign"  data-toggle="modal" data-target="#add">
                   Add  <span class=" glyphicon glyphicon-plus-sign" ></span></a>




           </div>


       <div class=" dropdown hidden-lg hidden-sm hidden-md " id="">
           
           <a href="#" class=" btn btn-success btn-responsive-lg btn-lg " id="plussign"  data-toggle="modal" data-target="#add">Add
               <span class="glyphicon glyphicon-plus-sign" ></span></a>





       </div>

<br>
       <!-------------------------- Room Record table ----------------------------------------------->
       <table id="roomRecordTable" class="table table-responsive table-hover table-striped table-bordered">
                  <thead>
                  <tr>

                  </tr>
                  </thead>
                  <tbody>

                  <tr id="roomRecordTableRow1">
                  	  <td class="roomRecordTableIcon"><span class=" fa fa-bullhorn iconFont"></span></td>
                      <td class="roomRecordTableName">T ROOM</td>
                      <td class="features bgcolor">
                          <div class="center">

	                          <a href="#" class="confirm-delete"><span class="fa fa-television featureMonitors" >0</span></a>
	                          <a href="#" class="confirm-delete"><span class="fa fa-phone featurePhone" >0</span></a>
	                          <a href="#" class="confirm-delete"><span class="fa fa-table featureDesks" >0</span></a>
	                          <a href="#" class="confirm-delete"><span class="glyphicon glyphicon-blackboard featureBlackboard">0</span></a>
	                          <a href="#" class="confirm-delete"><span class="fa fa-folder-o featureChairs" >0</span></a>
                          </div>
                      </td>
                      <td>
                      	  <!-- data-toggle="modal" data-target="#edit" -->
                      	  <a href="#" id="editRoomButtonRow1" class="confirm-delete btn-lg btn-default"><span class="glyphicon glyphicon-edit"></span></a>
                          <a href="#" id="deleteRoomButtonRow1" class="confirm-delete  btn-lg btn-danger "><span class="glyphicon glyphicon-trash" ></span></a>
                      </td>
                  </tr>

                  <tr id="roomRecordTableRow2">
                  	  <td class="roomRecordTableIcon"><span class="fa fa-television iconFont"></span></td>
                      <td class="roomRecordTableName">T ROOM</td>
                      <td class="features bgcolor">
                      	  <div class="center">
                      	  	<a href="#" class="confirm-delete"><span class="fa fa-television featureMonitors" >0</span></a>
                          	<a href="#" class="confirm-delete"><span class="fa fa-phone featurePhone" > 0</span></a>
                          	<a href="#" class="confirm-delete"><span class="fa fa-table featureDesks" >0 </span></a>
                          	<a href="#" class="confirm-delete"><span class="glyphicon glyphicon-blackboard featureBlackboard" >0 </span></a>
                          	<a href="#" class="confirm-delete"><span class="fa fa-folder-o featureChairs" >0</span></a>
                      	  </div>
                      </td>
                      <td>   
                      	  <a href="#" id="editRoomButtonRow2" class="confirm-delete btn-lg btn-default "><span class="glyphicon glyphicon-edit"></span> </a>
                          <a href="#" id="deleteRoomButtonRow2" class="confirm-delete  btn-lg btn-danger"><span class="glyphicon glyphicon-trash" ></span></a>
                      </td>
                  </tr>

                  <tr id="roomRecordTableRow3">
                      <td class="roomRecordTableIcon"><span class="glyphicon glyphicon-object-align-vertical iconFont"></span></td>
                      <td class="roomRecordTableName">B ROOM</td>
                      <td class="features bgcolor"> <!-- -->
                      	  <div class="center">
                      	  	<a href="#" class="confirm-delete"><span class="fa fa-television featureMonitors" >0</span></a>
                          	<a href="#" class="confirm-delete"><span class="fa fa-phone featurePhone" > 0</span></a>
                          	<a href="#" class="confirm-delete"><span class="fa fa-table featureDesks" >0 </span></a>
                          	<a href="#" class="confirm-delete"><span class="glyphicon glyphicon-blackboard featureBlackboard" >0 </span></a>
                          	<a href="#" class="confirm-delete"><span class="fa fa-folder-o featureChairs" >0</span></a>
                      	  </div>
                      </td>

                      <td>
                      	  <a href="#" id="editRoomButtonRow3" class="confirm-delete btn-lg btn-default"><span class="glyphicon glyphicon-edit"></span></a>
                          <a href="#" id="deleteRoomButtonRow3" class="confirm-delete  btn-lg btn-danger "><span class="glyphicon glyphicon-trash" ></span></a>
                      </td>
                  </tr >
                  
                  <tr id="roomRecordTableRow4">
                  	  <td class="roomRecordTableIcon"><span class="glyphicon glyphicon-object-align-vertical iconFont"></span></td>
                      <td class="roomRecordTableName">B ROOM</td>
                      <td class="features bgcolor"> <!-- -->
                      	  <div class="center">
                      	  	<a href="#" class="confirm-delete"><span class="fa fa-television featureMonitors" >0</span></a>
                          	<a href="#" class="confirm-delete"><span class="fa fa-phone featurePhone" > 0</span></a>
                          	<a href="#" class="confirm-delete"><span class="fa fa-table featureDesks" >0 </span></a>
                          	<a href="#" class="confirm-delete"><span class="glyphicon glyphicon-blackboard featureBlackboard" >0 </span></a>
                          	<a href="#" class="confirm-delete"><span class="fa fa-folder-o featureChairs" >0</span></a>
                      	  </div>
                      </td>

                      <td>
                      	  <a href="#" id="editRoomButtonRow4" class="confirm-delete btn-lg btn-default"><span class="glyphicon glyphicon-edit"></span></a>
                          <a href="#" id="deleteRoomButtonRow4" class="confirm-delete  btn-lg btn-danger "><span class="glyphicon glyphicon-trash" ></span></a>
                      </td>
                  </tr >
                  
                  <tr id="roomRecordTableRow5">
                      <td class="roomRecordTableIcon"><span class="glyphicon glyphicon-object-align-vertical iconFont"></span></td>
                      <td class="roomRecordTableName">B ROOM</td>
                      <td class="features bgcolor"> <!-- -->
                      	  <div class="center">
                      	  	<a href="#" class="confirm-delete"><span class="fa fa-television featureMonitors" >0</span></a>
                          	<a href="#" class="confirm-delete"><span class="fa fa-phone featurePhone" > 0</span></a>
                          	<a href="#" class="confirm-delete"><span class="fa fa-table featureDesks" >0 </span></a>
                          	<a href="#" class="confirm-delete"><span class="glyphicon glyphicon-blackboard featureBlackboard" >0 </span></a>
                          	<a href="#" class="confirm-delete"><span class="fa fa-folder-o featureChairs" >0</span></a>
                      	  </div>
                      </td>

                      <td>
                      	  <a href="#" id="editRoomButtonRow5" class="confirm-delete btn-lg btn-default"><span class="glyphicon glyphicon-edit"></span></a>
                          <a href="#" id="deleteRoomButtonRow5" class="confirm-delete  btn-lg btn-danger "><span class="glyphicon glyphicon-trash" ></span></a>
                      </td>
                  </tr >

                  </tbody>
              </table>
       <!-------------------------- Next Buttons----------------------------------------------->

         <div class="">
          <ul id="nextButtons" class="pager pager-hover  hidden-xs">
          </ul>
      </div>
  </div>

  <!-------------------------- Footer ----------------------------------------------->
<%@include file="footer.jsp" %>
        
        <!-------------------------- Modals-ADD ----------------------------------------------->
<div id="add" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
	<form id="addResourceForm">
    <div class="vertical-alignment-helper">
    <div class="modal-dialog model-lg vertical-align-center">
        <div class="modal-content">
            <div class="modal-header" style="background-color:black; color:white;">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
                <h1 class="text-center"><strong> Add Room </strong></h1>
            </div>
            <div class="modal-body">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="text-center ">
                                <div class="panel-body">

                                    <div class="form-group">

                                        <div class="input-group">
                                            <span class="input-group-addon"> <i class=" "> </i> </span>
                                            <input id="addResourceName" class="form-control" placeholder="Room Name" required/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="input-group">
                                            <span class="input-group-addon"> <i class=" "> </i> </span>
                                            <select id="addResourceRoomType" class="form-control text-center" required>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                    	<label for="addResourceSuperRoom">Super Room</label>
                                    	<input id="addResourceSuperRoom" type="checkbox" value="Super Room">
                                    </div>

									<div class="form-group">

                                        <div class="input-group">
                                            <span class="input-group-addon"> <i class=" "> </i> </span>
                                            <input id="addResourceCapacity" type="number" class="form-control" placeholder="Capacity" required/>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">

                <div class="col-md-9">
                    <button class="btn btn-lg" data-dismiss="modal" aria-hidden="true">Cancel</button>
                </div>
                <div class="col-md-2">
                    <input type="submit" id="addResourceSubmit" class="btn btn-primary btn-lg" data-dismiss="modal" aria-hidden="true" value="Add">
                </div>
            </div>
        </div>
    </div>
    </div>
    </form>
</div>

<!-------------------------- ----------------------------------------------------------------------->
<!-------------------------- ----------------- ----------------------------------------------->
<!------------------------------------ Modals-EDIT ----------------------------------------------->

<!--modal-->
<div id="edit" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="vertical-alignment-helper">
        <div class="modal-dialog model-lg vertical-align-center">


            <div class="modal-content">
 				<div class="modal-header" style="background-color:black; color:white;">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
                <h1 class="text-center"><strong> Edit</strong></h1>
                </div>
                
                <div class="modal-body">
                    <div class="text-center">
                        <table class="table table-responsive table-hover hidden-xs">
                            <thead>
                            <tr>
                                <th>Super Room</th>
                                <th colspan="2">Capacity</th>
                                <th colspan="2">Name</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td><input id="editResourceSuperRoom" type="checkbox"></td>
                                <td colspan="2"><input id="editResourceCapacity" type="number"></td>
                                <td colspan="2"><input id="editResourceName" type="text"></td>
                            </tr>
                            </tbody>
                          </table>

							<table class="table table-responsive table-hover hidden-xs">

								<tr>
									<td><span class="fa fa-television"></span><input
										id="editResourceFeatureMonitors" type="number"></td>
								</tr>
								<tr>
									<td><span class="fa fa-phone"></span><input
										id="editResourceFeaturePhone " type="number"></td>
								</tr>
								<tr>
									<td><span class="fa fa-table"></span><input
										id="editResourceFeatureDesks" type="number"></td>
								</tr>
								<tr>
									<td><span class="glyphicon glyphicon-blackboard"></span><input
										id="editResourceFeatureBlackboard" type="number"></td>
								</tr>
								<tr>
									<td><span class="fa fa-folder-o"></span><input
										id="editResourceFeatureChairs" type="number">
									</td>
								</tr>
								
							</table>
						</div>
                </div>

                <div class="modal-footer">

                    <div class="col-md-9">
                        <button class="btn btn-lg" data-dismiss="modal" aria-hidden="true">Cancel</button>
                       
                    </div>
                     <div class="col-md-2">
                      <button id="editResourceSubmit" class="btn btn-primary btn-lg" data-dismiss="modal" aria-hidden="true">Save</button>
                     </div>
                </div>
            </div>
        </div>
    </div>
</div>


<!-------------------------- Modals-DELETE ----------------------------------------------->
<div id="delete" class="modal fade modal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="vertical-alignment-helper">
        <div class="modal-dialog model-lg vertical-align-center">

        <div class="modal-content">
			 <div class="modal-header" style="background-color:black; color:white;">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
                <h1 class="text-center"><strong> Delete </strong></h1>
			</div>

                <div class="col-md-12">
                            <div class="text-center ">
                                    <h1> Are you sure? </h1>
                            </div>


                </div>

            <div class="modal-footer">

                <div class="col-md-9">
                    <button class="btn btn-lg" data-dismiss="modal" aria-hidden="true">No</button>
                </div>
                <div class="col-md-2">
                    <button id="deleteResourceSubmit" class="btn btn-primary btn-lg" data-dismiss="modal" aria-hidden="true">Yes</button>
                </div>
            </div>
        </div>
        </div>
    </div>
</div>

</body>

</html>
