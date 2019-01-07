<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href=" <c:url value = "/resources/styles/index.css"/> ">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="<c:url value = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" /> "
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href=" <c:url value = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" /> "
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">

<link rel="stylesheet"
	href=" <c:url value ="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/> ">
<link rel="stylesheet"
	href=" <c:url value = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/> ">
<script
	src=" <c:url value = "https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"/> "></script>
<script
	src=" <c:url value = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"/> "></script>




</head>


<!------------------------------------------------------------ Header -------------------------------------------------------------------------------------------->


<body style="background-color: #fffef2;">
	<!-- header -->
	<div class="container-fluid navbar-fixed ">
		<nav class="navbar navbar-default ">
			<div class="container-fluid">

				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">

					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#navbar_menu"
						aria-expanded="false">

						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<img src="<c:url value = "/resources/photo/logo2.PNG"/>"
						class="img-responsive" width="190" height="140">

					<div class="collapse navbar-collapse " id="navbar_menu">
						<ul class="nav navbar-nav hidden-lg hidden-md hidden-sm">
							<li><a class="hidden-lg  hidden-md hidden-sm"><span><strong>Binod
											Katwal Memphis,TN</strong></span></a></li>
							<li><a href="ManageResources.html"><strong>Home
								</strong></a></li>
							<li><a href="#"><strong> Manage Booking</strong></a></li>
							<li><a href="ManageResources.html"><strong>
										Manage Resourse</strong></a></li>
							<li><a href="#"><strong>Reports </strong></a></li>
							<li><a href="Users.html"> <strong> Users </strong></a></li>
							<li><a class="hidden-lg  hidden-md hidden-sm" href="#s">
									<strong> Sign Out </strong>
							</a></li>
						</ul>


					</div>
<!------------------------------------------------------------ Nav Bar ------------------------------------------------------------------------------------------->


					<div class="dropdown">
						<button class="btn  dropdown-toggle btn-danger hidden-xs"
							type="button" id="headerName" data-toggle="dropdown">
							Binod Katwal <span class="  glyphicon glyphicon-user "></span>
						</button>
						<ul class="dropdown-menu">
							<li><a href="login.html">Sign Out</a></li>

						</ul>
					</div>
				</div>

				<div>
					<ul class="nav navbar-nav navbar-right ">
						<img src="<c:url value = "/resources/photo/syntel.png"/>"
							class="img-responsive hidden-xs" width="160" height="170">


						<div class="dropdown">
							<button class="btn  dropdown-toggle hidden-xs" type="button"
								id="headerlocation" data-toggle="dropdown">
								Memphis,TN <span class=" fa fa-map-marker"></span>
							</button>
							<ul class="dropdown-menu">
								<li><a href="">Change Location</a></li>

							</ul>
						</div>
					</ul>
				</div>
			</div>
		</nav>

		<!-- admin navbar     -->
		<nav class="navbar navbar-inverse  hidden-xs">


			<div class="collapse navbar-collapse" id="navbar_menu">
				<ul class="nav navbar-nav">
					<li><a class="hidden-lg  hidden-md hidden-sm"><span><strong>Binod
									Katwal Memphis,TN</strong></span></a></li>
					<li><a href="ManageResources.html"><strong>Home </strong></a></li>
					<li><a href="#"><strong> Manage Booking</strong></a></li>
					<li><a href="ManageResources.html"><strong>
								Manage Resourse</strong></a></li>
					<li><a href="#"><strong>Reports </strong></a></li>
					<li><a href="Users.html"> <strong> Users </strong></a></li>
					<li><a class="hidden-lg  hidden-md hidden-sm" href="#s"> <strong>
								Sign Out </strong></a></li>
				</ul>

			</div>

		</nav>

	</div>
</body>

<!------------------------------------------------------End of Nav Bar ------------------------------------------------------------------------------------------>

<!------------------------------------------------------------ End of Header ------------------------------------------------------------------------------------>



<!------------------------------------------------------------ Footer ------------------------------------------------------------------------------------------->

<div id="footer">

<!-- include modal file path to pop up -->


<footer class="footer-basic-centered">

	<p class="footer-company-name">@Copyright Synbook inc.</p>

</footer>

</div>



</html>

<!------------------------------------------------------------ End of Footer ------------------------------------------------------------------------------------>




