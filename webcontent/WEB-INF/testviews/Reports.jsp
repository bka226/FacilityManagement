<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file = "HeaderAndFooter.jsp" %>


<!doctype html>
<html lang="en">
 
<head>
 
<title>Reports</title>
<!-------------------------------------------------------- Script for Bar Chart --------------------------------------------------------------------------------->
 
<script type="text/javascript"
src="https://www.gstatic.com/charts/loader.js"></script>
 
<script type="text/javascript">
google.charts.load('current', {
'packages' : [ 'bar' ]
});
google.charts.setOnLoadCallback(drawChart);
function drawChart() {
console.log( ${sessionScope.Location.id});
var first = ${list[0]};
var second = ${list[1]};
var third = ${list[2]};
var fourth = ${list[3]};
var fifth = ${list[4]};
 
var data = google.visualization.arrayToDataTable([
[ 'Rooms', 'Scrum', 'Conference 1','Conference 2', 'Training', 'Rec Room' ],
[ 'Monthly-Usage', first, second, third, fourth, fifth] ]);
 
var options = {
chart : {
title : ' ',
 
},
bars : 'Vertical' // Required for Material Bar Charts.
};
 
var chart = new google.charts.Bar(document.getElementById('barchart_material'));
 
chart.draw(data, google.charts.Bar.convertOptions(options));
 
 
}
</script>
</head>
 
<!--------------------------------------------------------End of Script for Bar Chart --------------------------------------------------------------------------------->
 

<body>
<h2 style="text-align: center;">
<strong> Facility Utilization</strong>
</h2>
 
<br>
 
<div class="container" id="barchart_material" style="width: 1000px; height: 600px;"></div>
 
 
 
 
<form:form method="post" action="PieChart" align = "center">
<input type = "hidden" name = "location" value = "${sessionScope.Location.id}"/>
<input type = "hidden" name = "month" value = "${sessionScope.Month}"/>
<input class="btn btn-success btn-lg" type="submit" value="Get Individual Resource Reports"/>
 
</form:form>
 
 
 
 
</body>
</html>