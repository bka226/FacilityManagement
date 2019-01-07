<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      
    <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="<c:url value = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" /> " integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href=" <c:url value = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" /> " integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

      <link rel="stylesheet" href=" <c:url value ="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/> " >
      <link rel="stylesheet" href=" <c:url value = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>">
      <link rel="stylesheet" href=" <c:url value = "/resources/styles/index.css"/> ">
      <script src=" <c:url value = "https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"/> " ></script>
      <script src=" <c:url value = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"/> "></script>
      <script src="<c:url value="/resources/scripts/synbook-general.js"/>" type="text/javascript"></script>

    <title>SynBook</title>
	
	
<style type="text/javascript"></style>
	<script type="text/javascript">
	
	function myfunction(){
		var x = document.getElementById("password");
		if(x.type == "password"){
			x.type = "text";
		} else {
			x.type = "password"
		}
	}
	
	
	$(document).ready(function() {
		$("#forgetPasswordLink").click(function(event) {
			event.preventDefault();
			$("#passwordset").modal("show");
		});
		
		$("#forgetPasswordSubmit").click(function(event) {
			var email = $("#forgetPasswordEmail").val();
			
			var data = {};
			
			data["email"] = email;
			
			postJsonDataToServer(getFRMUrl("resetpass"), data);
			
			$("#passwordset").modal("hide");
		});
	});

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
                     <a href="login.html"> <strong> </strong></a>
                </ul></div>
            </div><!-- /.container-fluid -->
          </nav>
		  
	</div>	  

      <div class="container" >
        <div class= "row" >
          <div class="col-sm-offset-3 col-sm-6">
<div id="userform">
          <!-- Nav tabs -->
          <ul class="nav nav-pills nav-justified " role="tablist">
              <li role="presentation" class="active" > <a aria-controls="home" role="tab" data-toggle="tab"><strong> Sign In</strong></a></li>
             <li role="presentation" > <a href = "register" aria-controls="register" role = "tab"><strong>Sign Up</strong></a></li>
          </ul>

          <!-- Tab panes -->
          <div class="tab-content">
            <div  role="tabpanel" class="tab-pane active" id="register" >
                <form method="post" action="loginProcess">

                     <div class="form-group" >
                          <div class="input-group">
                              <span class="input-group-addon"> <i class="glyphicon glyphicon-envelope "> </i> </span>
                              <input type = "text" class="form-control" name = "email" id="email" placeholder=" E-mail" required/>
                          </div> 

                      </div>
                      <div class="form-group">
                          <div class="input-group">
                             <span class="input-group-addon"> <i class="glyphicon glyphicon-lock "> </i> </span>
                             <input  type = "password" id = "password" name = "password" class="form-control"  placeholder="Password" required/>
                      </div>
                      	<input type="checkbox" onclick="myfunction()"> Show Password
                      </div>
					
					<% String errLoginMessage = (String)session.getAttribute("errLoginMessage");
					   if (errLoginMessage != null) { %>
					   		<p style="color: red; text-align: center;"><%=errLoginMessage%></p>   
					<% }
					%>
                    <div  class="form-group">
                      <div class="checkbox">
                        <label>
                          <input type="checkbox" class="check"> Remember me
                        </label>
                      </div>

                        <div class="form-group">
                            <button type="submit" class="btn btn-primary btn-lg btn-block"  >Sign In</button>
                        </div>


                      <div>
                          <a id="forgetPasswordLink" href="#"> Forgot your password?</a>

                      </div>
                     <div>
                     
                     
                     </div>
 					
                    

                    </div>
                </form>
            </div>

          </div></div>
</div></div>
</div>




<div id="footer"> 

   <!-- include modal file path to pop up -->
  </body>



  
  
  <footer class="footer-basic-centered">
  
  <p class="footer-company-name">@Copyright Synbook inc.</p>
  </footer>

  </div>
  
</html>


<body>
<!--modal-->
<div id="passwordset" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
   <div class="vertical-alignment-helper">
    <div class="modal-dialog model-lg vertical-align-center">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
                <h1 class="text-center">Forgot your password?</h1>
            </div>
            <div class="modal-body">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-body">

                            <div class="text-center ">
                                <div class="panel-body">
                                    <fieldset>
                                        <div class="form-group">

                                            <input id="forgetPasswordEmail" type="email" class="form-control input-lg"  placeholder="E-mail Address" required>
                                        </div>

                                        <div  class="form-group" >
                                            <button id="forgetPasswordSubmit" class="btn btn-primary btn-lg  btn-block " >Send my Password</button></div>

                                    </fieldset>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <div class="col-md-12">
                    <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
                </div>
            </div>
        </div>
    </div></div>
</div>

</body>