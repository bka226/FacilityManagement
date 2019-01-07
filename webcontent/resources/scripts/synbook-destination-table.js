/**
 * General functions and globals for displaying or editing destination table info.
 * Should be used by booking and resource management.
 * 
 * Depends on:
 * 	- jquery-3.3.1
 * 	- synbook-general
 */

var numOfDestinationsPerTable;
var numOfDestinationTables;
var destinations;
var destinationsCurrentlyInTable;
var tableRows;
var tableUserIsCurrentlyViewing = 0;

/*
 * You must have an empty <ul> with id 'nextButtons' in order to create your next buttons for the destination table. 
 */
function loadNextButtons() {
	$("#nextButtons").html('');
	
	$("#nextButtons").append('<li><button class="btn btn-Secondary btn-lg nextBtn" href="#">&laquo;</button></li>');
	for (var i = 1; i <= numOfDestinationTables; i++) {
        $("#nextButtons").append('<li><button class="btn btn-Secondary btn-lg nextBtn" href="#">' + i + '</button></li>');
	} 
	$("#nextButtons").append('<li><button class="btn btn-Secondary btn-lg nextBtn" href="#">&raquo;</button></li>');
}

function loadTable(nextButtonClickedNum) {
	if (nextButtonClickedNum > 0 && nextButtonClickedNum <= numOfDestinationTables) {
		tableUserIsCurrentlyViewing = nextButtonClickedNum - 1;
    	loadTableWithDestinations(tableUserIsCurrentlyViewing);
	}
}

/*
 * In order to use this function, you must follow these rules:
 * 	- Need a table that houses the destination with an id of 'destinationRecordTable'
 * 	- Need a <tbody> in the 'destinationRecordTable'
 * 	- Within the <tbody> you should have at least the following structure (You can add more <td>):
  		<tr id="destinationRecordTableRow1" class="primary">
                      <td class="destinationRecordTableName">T ROOM</td>
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
function loadTableWithDestinations(tableNum) {
	var tableBody = $("#destinationRecordTable").children('tbody');
	tableBody.html('');
	destinationsCurrentlyInTable = [];

	var startingDestination = tableNum * numOfDestinationsPerTable;
	for (var i = 0; i < numOfDestinationsPerTable && (startingDestination + i) < destinations.length ; i++) {
		var row = tableRows[i];
		destinationsCurrentlyInTable.push(destinations[startingDestination + i]);
		row.children('.destinationRecordTableStreet').html(destinationsCurrentlyInTable[i].street);
		row.children('.destinationRecordTableCity').html(destinationsCurrentlyInTable[i].city);
		row.children('.destinationRecordTableState').html(destinationsCurrentlyInTable[i].state);
		row.children('.destinationRecordTableCountry').html(destinationsCurrentlyInTable[i].country);
		
		tableBody.append(row);
	}
}

/*
 * This adds event handling to the next buttons.
 * Your next buttons should have the 'nextBtn' class.
 */
function updateDestinationTable(afterUpdateCallback, additionalNextBtnFunctionalityCallback) {
	getRequestToServer(getFRMUrl("viewdestination"), function(data) {
		destinations = data.destinations;
		numOfDestinationTables = Math.ceil(destinations.length / numOfDestinationsPerTable);
		
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