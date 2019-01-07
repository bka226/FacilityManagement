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
		var first = ${list[0]};
		var second = ${list[1]};
		var third = ${list[2]};

		var data = google.visualization.arrayToDataTable([
				[ 'Rooms', 'Scrum', 'Training', 'Conference' ],
				[ 'Monthly', first, second, third ] ]);

		var options = {
			chart : {
				title : 'Report',

			},
			bars : 'Vertical' // Required for Material Bar Charts.
		};

		var chart = new google.charts.Bar(document
				.getElementById('barchart_material'));

		chart.draw(data, google.charts.Bar.convertOptions(options));

	}
</script>
</head>

<!--------------------------------------------------------End of Script for Bar Chart --------------------------------------------------------------------------------->


<body>


			<div id="barchart_material" style="width: 900px; height: 500px;"></div>
		   	
		   	<form:form method="post" action="PieChart">
		   		<input type="submit" value="Get All Resource Reports"/>
		   	</form:form>
		 	  
		    		
		    
</body>
</html>

