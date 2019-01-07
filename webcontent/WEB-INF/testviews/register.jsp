<%@page import="model.Destination"%>
<%@page import="dao.DestinationDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=yes">
      
    <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="<c:url value = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" /> " integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href=" <c:url value = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" /> " integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

      <link rel="stylesheet" href=" <c:url value ="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/> " >
      <link rel="stylesheet" href=" <c:url value = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/> ">
      <script src=" <c:url value = "https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"/> " ></script>
      <script src=" <c:url value = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"/> "></script>
		<link rel="stylesheet" href=" <c:url value = "/resources/styles/index.css"/> ">
      <link rel="stylesheet" href=" <c:url value = "/resources/styles/register.css"/> ">
    <title>SynBook</title>
	
	<style>
	
	</style>

<script type="text/javascript">

  function checkForm(form)
  {
      if(form.password.value == form.id.value) {
        alert("Error: Password must be different from Username!");
        form.password.focus();
        return false;
  	  }
 }
</script>
  </head>
  <body style="background-color:#fffef2;">

  <div class="container-fluid">
              <nav class="navbar navbar-default">
            <div class="container-fluid">
              <!-- Brand and toggle get grouped for better mobile display -->
              <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                  <span class="sr-only">Toggle navigation</span>
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
				  <span class="icon-bar"></span>
                </button>
				<img src="<c:url value = "/resources/photo/logo2.PNG"/>" class="img-responsive"  width="190" height="140">
              </div>



              <!-- Collect the nav links, forms, and other content for toggling -->
              <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
               
                
                <ul class="nav navbar-nav navbar-right">
                      
					<img src="<c:url value = "/resources/photo/syntel.png"/>"  class="img-responsive hidden-xs"  width="160" height="170">
                <!--  <a class="navbar-brand" href="#">SYNTEL</a> -->
                </ul>
                 


              </div><!-- /.navbar-collapse -->
                <div>


                <ul class="nav navbar-nav navbar-right">
                     <div><a href="register.html"> <strong> </strong></a></div>
                </ul></div>
            </div><!-- /.container-fluid -->
          </nav>
		  
      <div class="container" >
        <div class= "row" >
          <div class="col-sm-offset-3 col-sm-6">
<div id="userform">
         

          <!-- Tab panes -->
       <!-- Nav tabs -->
          <ul class="nav nav-pills nav-justified " role="tablist">
         	 <li role="presentation"> <a href= "login" aria-controls="home" role="tab" ><strong> Sign In</strong></a></li>
             <li role="presentation" class="active"> <a aria-controls="home" role = "tab" ><strong>Sign Up</strong></a></li>
          </ul>
                <form:form method="post" action="registerProcess" onsubmit= "return checkForm(this);">
                    <div class="form-group">
                        <div class="input-group">
                            <span class="input-group-addon"> <i class="glyphicon glyphicon-user "> </i> </span>
                            <form:input path="name" cssClass="form-control" placeholder="Name" required="true"/>
                        </div>

                   </div>                      
                      <div class="form-group">
                          <div class="input-group">
                              <span class="input-group-addon"> <i class="glyphicon glyphicon-envelope "> </i> </span>
                              <form:input cssClass="form-control" path="email"  placeholder="E-mail" required="true"/>
                          </div>

                      </div>
                      <div class="form-group">
                          <div class="input-group">
                              <span class="input-group-addon"> <i class="glyphicon glyphicon-phone "> </i> </span>
                              <form:input cssClass="form-control" path="phone"  placeholder="Phone Number"/>
                          </div>

                      </div>
                      <div class="form-group">
                          <div class="input-group">
                              <span class="input-group-addon"> <i class="glyphicon glyphicon-lock "> </i> </span>
                              <form:input type="password" name = "password" cssClass="form-control" path="password" 
                              placeholder="Password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" 
                              title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" 
                              required="true"/>
                          </div>

                      </div> 
                         <div class="form-group">
                          <div class="input-group" >
                              <span class="input-group-addon"> <i class="fa fa-map-marker "> </i> </span>
                              <form:select class=" btn btn-lg selectpicker" data-style="btn-success" 
                              path = "homeDestinationId" name = "homeDestinationId" cssClass="form-control"  placeholder="Base Location">
                          	  		<form:option value="0" label="--- Select Base Location ---" />
                          	  		<%
                          	  		DestinationDAO dao = new DestinationDAO();
                          	  		for (Destination destination : dao.showDestination()) { %>
                          	  			<form:option value="<%=destination.getId()%>"><%=destination.getStreet() + ", " + destination.getCity()%></form:option>
                          	  		<%}
                          	  		%>
                          	  </form:select>
                          
                          </div>

                     </div>
                    <div  class="form-group" >

                        <button type="submit" class="btn btn-primary btn-lg  btn-block " >Register</button>
                        </div>

                </form:form></div></div>
                       <div id="message">
  							<h3>Password must contain the following:</h3>
  						<p id="letter" class="invalid"><font size="4">A <b>lowercase</b> letter</font></p>
  						<p id="capital" class="invalid"><font size="4">A <b>capital (uppercase)</b> letter</font></p>
  						<p id="number" class="invalid"><font size="4">A <b>number</b></font></p>
 						<p id="length" class="invalid"><font size="4">Minimum <b>8 characters</b></font></p>
</div>
          </div>
          </div></div>
</div></div>


	<script type="text/javascript">

	var myInput = document.getElementById("password");
	var letter = document.getElementById("letter");
	var capital = document.getElementById("capital");
	var number = document.getElementById("number");
	var length = document.getElementById("length");

	// When the user clicks on the password field, show the message box
	myInput.onfocus = function() {
	    document.getElementById("message").style.display = "block";
	}

	// When the user clicks outside of the password field, hide the message box
	myInput.onblur = function() {
	    document.getElementById("message").style.display = "none";
	}

	// When the user starts to type something inside the password field
	myInput.onkeyup = function() {
	  // Validate lowercase letters
	  var lowerCaseLetters = /[a-z]/g;
	  if(myInput.value.match(lowerCaseLetters)) {  
	    letter.classList.remove("invalid");
	    letter.classList.add("valid");
	  } else {
	    letter.classList.remove("valid");
	    letter.classList.add("invalid");
	  }
	  
	  // Validate capital letters
	  var upperCaseLetters = /[A-Z]/g;
	  if(myInput.value.match(upperCaseLetters)) {  
	    capital.classList.remove("invalid");
	    capital.classList.add("valid");
	  } else {
	    capital.classList.remove("valid");
	    capital.classList.add("invalid");
	  }

	  // Validate numbers
	  var numbers = /[0-9]/g;
	  if(myInput.value.match(numbers)) {  
	    number.classList.remove("invalid");
	    number.classList.add("valid");
	  } else {
	    number.classList.remove("valid");
	    number.classList.add("invalid");
	  }
	  
	  // Validate length
	  if(myInput.value.length >= 8) {
	    length.classList.remove("invalid");
	    length.classList.add("valid");
	  } else {
	    length.classList.remove("valid");
	    length.classList.add("invalid");
	  }
	}


</script>


<div id="footer"> </div>

   <!-- include modal file path to pop up -->
  </body>

  <footer class="footer-basic-centered">
  
  <p class="footer-company-name">@Copyright Synbook inc.</p>
  </footer>

  
  
</html>
