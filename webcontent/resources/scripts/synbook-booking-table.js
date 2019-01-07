/**
 * General functions for booking.
 */

/*
 * Examples of short URL are "savebooking". This function uses getFRMUrl.
 */
function postBookingDataToServer(shortUrl, data, successCallback) {
	postJsonDataToServer(getFRMUrl(shortUrl), data, successCallback, function(jqXHR, textStatus, errorThrown) {
		alert("There seems to be a scheduling conflict for your booking.");
	});
}

/*
 * Depends on the following:
 * 	- A date input field with the id of 'date'
 * 	- A time input field with the id of 'fromTime'
 * 	- A time input field with the id of 'toTime'
 */
function updateBookingDateTimeForRequest(data) {
	var date = $("#date").val();
	var fromTime = $("#fromTime").val();
	var toTime = $("#toTime").val();
	
	var fromHourMin = fromTime.split(':');
	var toHourMin = toTime.split(':');
	
	data["startDate"] = date;
	data["endDate"] = date;
	data["startTime"] = parseInt(fromHourMin[0]) * 100 + parseInt(fromHourMin[1]);
	data["endTime"] = parseInt(toHourMin[0]) * 100 + parseInt(toHourMin[1]);
}