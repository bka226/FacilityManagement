/**
 * General functions shared amongst most or all scripts in the SynBook project.
 */

function getDaysInMonth(month, year) {
	return new Date(year, month+1, 0).getDate();
}

function getFRMUrl(path) {
	return "http://localhost:9880/FRM/" + path;
}

function getRequestToServer(targetUrl, successCallback, errorCallback) {
	requestToServer(targetUrl, successCallback, errorCallback);
}

/*
 * Determines whether to make a GET or POST based on objData.
 * Refrain from using this function. Please use the helper functions:
 * 	- getRequestToServer
 * 	- postJsonDataToServer 
 */
function requestToServer(targetUrl, successCallback, errorCallback, contentType, objData, objDataTranslator) {
	successCallback = successCallback || function() {};
	errorCallback = errorCallback || function() {};
	
	if (objData) {
		$.ajax({
			type: "POST",
			contentType: contentType,
			url: targetUrl,
			data: objDataTranslator(objData),
			success: successCallback,
			error: errorCallback
		});
	} else {
		$.ajax({
			url: targetUrl,
			success: successCallback,
			error: errorCallback
		});
	}
}

function postJsonDataToServer(targetUrl, objData, successCallback, errorCallback) {
	requestToServer(targetUrl, successCallback, errorCallback, "application/json", objData, function(objData) {
		return JSON.stringify(objData);
	});
}