<%@page import="model.CalendarEvent"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>Calendar</title>
<script src="<c:url value="/resources/codebase/dhtmlxscheduler.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/scripts/jquery-3.3.1.min.js"/>" type="text/javascript"></script>
<link rel="stylesheet" href="<c:url value="/resources/codebase/dhtmlxscheduler.css"/>" type="text/css">

<style type="text/css" media="screen">
    html, body{
        margin:0px;
        padding:0px;
        height:100%;
        overflow:hidden;
    }   
</style>
</head>
<body>
<div id="scheduler_here" class="dhx_cal_container" style='width:100%; height:100%;'>
    <div class="dhx_cal_navline">
        <div class="dhx_cal_prev_button">&nbsp;</div>
        <div class="dhx_cal_next_button">&nbsp;</div>
        <div class="dhx_cal_today_button"></div>
        <div class="dhx_cal_date"></div>
        <div class="dhx_cal_tab" name="day_tab" style="right:204px;"></div>
        <div class="dhx_cal_tab" name="week_tab" style="right:140px;"></div>
        <div class="dhx_cal_tab" name="month_tab" style="right:76px;"></div>
    </div>
    <div class="dhx_cal_header"></div>
    <div class="dhx_cal_data"></div>       
</div>

<script type="text/javascript">
	calEventList = [];
</script>

<c:forEach var="calEvent" items="${calEventList}">
	<script type="text/javascript">
		calEventList.push({
			id: <c:out value="${calEvent.id}"/>,
			text: "Event",
			start_date: new Date(<c:out value="${calEvent.startTime}"/>),
			end_date: new Date(<c:out value="${calEvent.endTime}"/>)
		});
	</script>
</c:forEach>

<script type="text/javascript">
	scheduler.config.details_on_create = true;
	scheduler.config.event_duration = 30;
	scheduler.config.lightbox_recurring = 'ask';
	scheduler.config.lightbox.sections = [
		{ name: "recurring", type: "recurring", map_to: "rec_type", button: "recurring"},
		{ name: "time", height: 72, type: "calendar_time", map_to: "auto" },
		{ name: "time", height: 72, type: "time", map_to: "auto" },
	]
	scheduler.init('scheduler_here', new Date(), "week");
	
	scheduler.parse(calEventList, "json");
	
	scheduler.attachEvent("onEventAdded", function(id,ev){
		var calEvent = {};
		
		//TODO: Retrieve the room's ID from a combo box
		calEvent.room = 1;
		
		calEvent.startTime = ev.start_date.getTime();
		calEvent.endTime = ev.end_date.getTime();
	    
		/*
	    $.post({
	    	url: "http://localhost:9880/FRM/calendar/save",
	    	cache: false,
	        contentType: "application/json; charset=UTF-8",
	        data: JSON.stringify(calEvent),
	        datatype: "json"
	    });
		*/
	});
</script>
</body>
</html>