<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>


<%@ include file = "HeaderAndFooter.jsp" %>

<!doctype html>

<html lang="en">
<head>
   
 <!------------------------------------------------------------Javascript ---------------------------------------------------------------------------------->
<script>
	function getDateSelected()
	{				
		  var months = new Array();
		  months[0] = "JAN";
		  months[1] = "FEB";
		  months[2] = "MAR";
		  months[3] = "APR";
		  months[4] = "MAY";
		  months[5] = "JUN";
		  months[6] = "JUL";
		  months[7] = "AUG";
		  months[8] = "SEP";
		  months[9] = "OCT";
		  months[10] = "NOV";
		  months[11] = "DEC";
		  
			var v = document.getElementById("selectmonth").valueAsDate;
			var m = months[v.getMonth()];
			var l = ${sessionScope.Location.id}
				window.open('/FRM/Reports/'+m+'_'+l ,'_blank');

		
	}

</script>

</head>


 <!---------------------------------------------------------End of Javascript ---------------------------------------------------------------------------------->
  
<title>Report Dashboard</title>
 


<!------------------------------------------------------------ Select Pickers ---------------------------------------------------------------------------------->	
<body>

	<div class="container">
		<h2 style="text-align: center;">
			<strong>Reports</strong>
		</h2>
		<br> <br>

		<p  style="text-align: center;">
			<select class=" btn-lg selectpicker" data-style="btn-sucess">
				<option>Monthly</option>
				<option>Quarterly</option>
				<option>Yearly</option>
				
			</select> 
			
			
			<!--  
			<select class="selectpicker" data-style="btn-success" id="selectresource">
				<option>All</option>
				<option>Mem Scrum 1</option>
				<option>Mem Scrum 2</option>
				<option>Mem Conf 1</option>
				<option>Mem Conf 2</option>
				<option>Mem Train 1</option>
				<option>Mem Train 2</option>
				<option>Mem Rec 1</option>
			</select> 
			-->
			
			
			<input class= "input-lg" type="date" id="selectmonth" />

			<button class="btn btn-success btn-lg" onclick="getDateSelected();">View Report</button>
			</p>
		
		</div><br>

<!------------------------------------------------------End of Select Pickers ---------------------------------------------------------------------------------->	

</body>

<%@ include file = "footer.jsp" %>

</html>
