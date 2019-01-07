<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ include file = "HeaderAndFooter.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>

<title>Pie Chart</title>


<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>

	 
<script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      //google.charts.setOnLoadCallback(drawChart);
      google.charts.setOnLoadCallback(test1);
      
      var rn;
      var mb;
      var tm;
	  var target;
	  function test1()
      {
    	  var iDiv = document.createElement('div');
    	  iDiv.id = 'donut_single';
    	  iDiv.className = 'donut_single';
    	  document.getElementsByTagName('body')[0].appendChild(iDiv);
    	  
    	  var iMax = ${list.size()};
    	  var jMax = 3;
    	  var i;
    	  var j;
    	  var v = new Array();
    	  for (i=1;i<iMax+1;i++) {
    		  
    		  v[i]=new Array();
    		  v[i][0] = document.getElementById("myTable").rows[i].cells.item(0).innerHTML;
    		  v[i][1] = document.getElementById("myTable").rows[i].cells.item(1).innerHTML;
    		  v[i][2] = document.getElementById("myTable").rows[i].cells.item(2).innerHTML;
    		  rn = v[i][0];
    		  mb = v[i][1];
    		  tm = v[i][2];
    		  
    		  target = 'donut_single' + i;
    		  console.log(target);
    		  var innerDiv = document.createElement('div');
    		  innerDiv.className = target;
    		  iDiv.appendChild(innerDiv);
    		  drawChart(target);
      }
      }

      
      
      function drawChart(target) 
      {

    	  var data = google.visualization.arrayToDataTable([
          ['Effort', 'Amount Used'],
          ['Minutes Used', Number(mb)],
          ['Minutes Not Used',  Number(tm)]
          ]);
        var options = { 
        		 title: rn,
                 pieHole: 0.4,

        };
        var x = document.getElementsByClassName(target);
        var chart = new google.visualization.PieChart(x[0]);


        chart.draw(data, options);
      }

      
      </script>
 
</head>

<body>

		<table id="myTable"  style="display:none">
		<tr>
		<th>Room Name</th>
		<th>Total Booked</th>
		<th>Total Available</th>
		</tr>
		<c:forEach var="booking" items="${list}">
		<tr>
		<td>${booking.roomName}</td>
		<td>${booking.totalMinsBooked}</td>
		<td>${booking.monthlyMins}</td>
		</tr>
		</c:forEach>
		</table>
		
		<table class="columns">
      	<tr>
        <td><div id="Sarah_chart_div" style="border: 1px solid #ccc"></div></td>
        <td><div id="Anthony_chart_div" style="border: 1px solid #ccc"></div></td>
      	</tr>
    	</table>
		<div id="donut_single"></div>
		
</body>
</html>
