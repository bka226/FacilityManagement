/**
 * General functions and globals for displaying or editing room table info.
 * Should be used by booking and resource management.
 * 
 * Depends on:
 * 	- jquery-3.3.1
 * 	- synbook-general
 */

var numOfRoomsPerTable;
var numOfRoomTables;
var rooms;
var roomsCurrentlyInTable;
var roomTypes;
var tableRows;
var tableUserIsCurrentlyViewing = 0;

/*
 * Acceptable roomTypes are the RType defined in the RoomType table of the DB.
 */
function getRoomTypeObject(roomTypeName) {
	return roomTypes.find(function (element) {
		return element.rtype === roomTypeName;
	});
}

function getRoomIconHtmlByRoom(room) {
	switch(room.roomType.id) {
		case 1: // Scrum Room
			return "<span class='fa fa-group iconFont'></span>";
		case 2: // Conference Room 1
		case 3: // Conference Room 2
			return "<span class='fa fa-bullhorn iconFont'></span>";
		case 4: // Training Room
			return "<span class='fa fa-pencil iconFont'></span>";
		case 5: // Game Room
			return "<span class='fa fa-gamepad iconFont'></span>";
	}
	
	return "";
}

/*
 * You must have an empty <ul> with id 'nextButtons' in order to create your next buttons for the room table. 
 */
function loadNextButtons() {
	$("#nextButtons").html('');
	
	$("#nextButtons").append('<li><button class="btn btn-Secondary btn-lg nextBtn" href="#">&laquo;</button></li>');
	for (var i = 1; i <= numOfRoomTables; i++) {
        $("#nextButtons").append('<li><button class="btn btn-Secondary btn-lg nextBtn" href="#">' + i + '</button></li>');
	} 
	$("#nextButtons").append('<li><button class="btn btn-Secondary btn-lg nextBtn" href="#">&raquo;</button></li>');
}

function loadTable(nextButtonClickedNum) {
	if (nextButtonClickedNum > 0 && nextButtonClickedNum <= numOfRoomTables) {
		tableUserIsCurrentlyViewing = nextButtonClickedNum - 1;
    	loadTableWithRooms(tableUserIsCurrentlyViewing);
	}
}

/*
 * In order to use this function, you must follow these rules:
 * 	- Need a table that houses the room with an id of 'roomRecordTable'
 * 	- Need a <tbody> in the 'roomRecordTable'
 * 	- Within the <tbody> you should have at least the following structure (You can add more <td>):
  		<tr id="roomRecordTableRow1" class="primary">
                      <td class="roomRecordTableName">T ROOM</td>
                      <td class="features">
                          <div class="center">

	                          <a href="#" class="confirm-delete"><span class="fa fa-television featureMonitors" >0</span></a>
	                          <a href="#" class="confirm-delete"><span class="fa fa-phone featurePhone" >0</span></a>
	                          <a href="#" class="confirm-delete"><span class="fa fa-table featureDesks" >0</span></a>
	                          <a href="#" class="confirm-delete"><span class="glyphicon glyphicon-blackboard featureBlackboard">0</span></a>
	                          <a href="#" class="confirm-delete"><span class="fa fa-folder-o featureChairs" >0</span></a>
                          </div>
                      </td>
       	</tr>
 */
function loadTableWithRooms(tableNum) {
	var tableBody = $("#roomRecordTable").children('tbody');
	tableBody.html('');
	roomsCurrentlyInTable = [];

	var startingRoom = tableNum * numOfRoomsPerTable;
	for (var i = 0; i < numOfRoomsPerTable && (startingRoom + i) < rooms.length ; i++) {
		var row = tableRows[i];
		roomsCurrentlyInTable.push(rooms[startingRoom + i]);
		row.children('.roomRecordTableIcon').html(getRoomIconHtmlByRoom(roomsCurrentlyInTable[i]));
		row.children('.roomRecordTableName').html(roomsCurrentlyInTable[i].name);
		
		var featuresColumn = row.children('.features').children('.center').children('a');
		roomsCurrentlyInTable[i].features.forEach(function(element){
			var featureImageCount = featuresColumn.children('.feature' + element.feature.name);
			
			if (featureImageCount) {
				featureImageCount.html(element.quantity);
			}
		});
		
		tableBody.append(row);
	}
}

/*
 * This adds event handling to the next buttons.
 * Your next buttons should have the 'nextBtn' class.
 */
function updateRoomTable(afterUpdateCallback, additionalNextBtnFunctionalityCallback) {
	getRequestToServer(getFRMUrl("viewroom"), function(data) {
		rooms = data.rooms;
		numOfRoomTables = Math.ceil(rooms.length / numOfRoomsPerTable);
		
		loadNextButtons();
		loadTable(1);
		
		$("button.nextBtn").click(function(event) {
			var nextButtonVantagePointNum = tableUserIsCurrentlyViewing + 1;
			
			var nextBtnText = $(this).text();
    		switch(nextBtnText) {
    			case "\u00AB":
    				loadTable(nextButtonVantagePointNum - 1);
    				break;
    			case "\u00BB":
    				loadTable(nextButtonVantagePointNum + 1);
    				break;
    			default:
    				loadTable(parseInt(nextBtnText));
    				break;
    		}
    		
    		if (additionalNextBtnFunctionalityCallback) {
    			additionalNextBtnFunctionalityCallback();
    		}
    	});
		
		if (afterUpdateCallback) {
			afterUpdateCallback();
		}
	});
}