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
      <link rel="stylesheet" href=" <c:url value = "/resources/styles/index.css"/> ">
      
    <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="<c:url value = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" /> " integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href=" <c:url value = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" /> " integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

      <link rel="stylesheet" href=" <c:url value ="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/> " >
      <link rel="stylesheet" href=" <c:url value = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/> ">
      <script src=" <c:url value = "https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"/> " ></script>
      <script src=" <c:url value = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"/> "></script>

    <title>SynBook</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript">	
	$("search").click(function(){
		var search = document.getElementById("searchtext").value;
			
			
		});
	
	
	
	</script>
 </head>
 <body style="background-color:#fffef2;">
            <!-- header -->
             <div class="container-fluid navbar-fixed " >
                <nav class="navbar navbar-default "  >
                    <div class="container-fluid">

                        <!-- Brand and toggle get grouped for better mobile display -->
                        <div class="navbar-header">

                                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar_menu" aria-expanded="false">

                                        <span class="sr-only">Toggle navigation</span>
                                        <span class="icon-bar"></span>
                                        <span class="icon-bar"></span>
                                        <span class="icon-bar"></span>
                                    </button>
                            <img src="<c:url value = "/resources/photo/logo2.PNG"/>" class="img-responsive"  width="190" height="140">

                                <div class="collapse navbar-collapse " id="navbar_menu">
                                    <ul class="nav navbar-nav hidden-lg hidden-md hidden-sm" >
                                        <li><a class="hidden-lg  hidden-md hidden-sm"><span><strong>Binod Katwal Memphis,TN</strong></span></a></li>
                                        <li><a href="ManageResources.html" ><strong>Home </strong></a></li>
                                        <li><a href="#"  ><strong> Manage Booking</strong></a></li>
                                        <li><a href="ManageResources.html" ><strong> Manage Resourse</strong></a></li>
                                        <li><a href="#" ><strong>Reports </strong></a></li>
                                        <li><a href="Users.html"> <strong> Users </strong></a></li>
                                        <li><a class="hidden-lg  hidden-md hidden-sm" href="#s"> <strong> Sign Out </strong></a></li>
                                    </ul>

                                </div><!-- /.navbar-collapse -->


                            <div class="dropdown">
                                <button class="btn  dropdown-toggle btn-danger hidden-xs" type="button" id="headerName" data-toggle="dropdown">  Binod Katwal   <span class="  glyphicon glyphicon-user "></span>
                                </button>
                                <ul class="dropdown-menu">
                                    <li><a href="login.html">Sign Out</a></li>

                                </ul>
                            </div>
                        </div>

                        <div>
                            <ul class="nav navbar-nav navbar-right ">
                                <img src="<c:url value = "/resources/photo/syntel.png"/>"  class="img-responsive hidden-xs"  width="160" height="170">


                                <div class="dropdown">
                                    <button class="btn  dropdown-toggle hidden-xs" type="button" id="headerlocation" data-toggle="dropdown"> Memphis,TN
                                        <span class=" fa fa-map-marker"></span></button>
                                    <ul class="dropdown-menu">
                                        <li><a href="">Change Location</a></li>

                                    </ul>
                                </div>
                            </ul>
                        </div>
                    </div>
                </nav>

<!-- admin navbar     -->
    <nav class="navbar navbar-inverse  hidden-xs" >


              <div class="collapse navbar-collapse" id="navbar_menu">
                <ul class="nav navbar-nav" >
                    <li><a class="hidden-lg  hidden-md hidden-sm"><span><strong>Binod Katwal Memphis,TN</strong></span></a></li>
                    <li><a href="ManageResources.html" ><strong>Home </strong></a></li>
                    <li><a href="#"  ><strong> Manage Booking</strong></a></li>
                    <li><a href="ManageResources.html" ><strong> Manage Resourse</strong></a></li>
                    <li><a href="#" ><strong>Reports </strong></a></li>
                    <li><a href="Users.html"> <strong> Users </strong></a></li>
                    <li><a class="hidden-lg  hidden-md hidden-sm" href="#s"> <strong> Sign Out </strong></a></li>
                 </ul>

	        </div><!-- /.navbar-collapse -->

    </nav>

  </div>
  <div class="container">




    <div class="col-xs-5  input-group dropdown_room" >

        <div class="active-cyan-4 mb-5">
            <input class="form-control input-lg" type="text" id = "searchtext" placeholder="Search" aria-label="Search">        
        </div>
        <div class="input-group-btn ">
            <button class="btn btn-default btn-lg " id = "search">
                <i class="glyphicon glyphicon-search"></i>
            </button>
        </div>
        <a href="#" class=" col-xs-3 btn-success btn-lg "  id="adduser" data-toggle="modal" data-target="#add">
            <span class="glyphicon glyphicon-plus-sign" ></span></a>

    </div>




    <div class="table-responsive-lg table table-hover">
        <table class="table table-striped table-bordered" id="editable">
                <thead >
                <tr>
                    <th>  <span class=" glyphicon glyphicon-user "><strong>Name</strong> </span></th>

                    <th >  <span class="glyphicon glyphicon-envelope"> <strong>Email</strong></span> </th>

                    <th class="hidden-xs" > <span class="glyphicon glyphicon-phone">  <strong>Phone</strong></span> </th>
                    <th> </th>
                </tr>
                </thead>
                <tbody>
                <tr class="primary">
                    <td>Binod</td>
                    <td>b@synbook.com</td>
                    <td class="hidden-xs"> 123222222</td>
                    <td>   <a href="#" class="confirm-delete  btn-lg btn-default " href="#" data-toggle="modal" data-target="#edit"> <span class="glyphicon glyphicon-edit"></span> </a>
                        <a href="#" class="confirm-delete  btn-lg btn-danger " href="#" data-toggle="modal" data-target="#delete"><span class="glyphicon glyphicon-trash" ></span></a>

                    </td>

                </tr>
                <tr class="success">
                    <td>Kelly</td>
                    <td>k@synbook.com</td>
                    <td class="hidden-xs"> 212232232</td>
                    <td>   <a href="#" class="confirm-delete  btn-lg btn-default " href="#" data-toggle="modal" data-target="#edit"> <span class="glyphicon glyphicon-edit"></span> </a>
                        <a href="#" class="confirm-delete  btn-lg btn-danger " href="#" data-toggle="modal" data-target="#delete"><span class="glyphicon glyphicon-trash" ></span></a>

                    </td>
                </tr>

                <tr class="primary">
                    <td>Krystal</td>
                    <td>K@synbook.com</td>
                    <td class="hidden-xs"> 542433243</td>
                    <td>   <a href="#" class="confirm-delete  btn-lg btn-default " href="#" data-toggle="modal" data-target="#edit"> <span class="glyphicon glyphicon-edit"></span> </a>
                        <a href="#" class="confirm-delete  btn-lg btn-danger " href="#" data-toggle="modal" data-target="#delete"><span class="glyphicon glyphicon-trash" ></span></a>

                    </td>
                </tr >

                </tbody>
            </table>
    </div>

        </div>
    <div class=" ">
        <ul class="pager pager-hover  hidden-xs">
            <li><button class="btn btn-Secondary btn-lg" hef="#">&laquo;</button></li>
            <li> <button class=" btn btn-Secondary btn-lg active" href="#">1</button></li>
            <li><button class="btn btn-Secondary btn-lg" href="#">2</button></li>
            <li><button class="btn btn-Secondary btn-lg" href="#">3</button></li>
            <li> <button class="btn btn-Secondary btn-lg" href="#">&raquo;</button>
        </ul>
    </div>

</div>
<footer class="footer-basic-centered">

    <p class="footer-company-name">@Copyright Synbook inc.</p>
</footer>
</body>
</html>


<!--modal-->
<div id="edit" class="modal fade modal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="vertical-alignment-helper">
        <div class="modal-dialog model-lg vertical-align-center">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
                <h1 class="text-center"><strong> Edit </strong></h1>
            </div>
            <div class="modal-body">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="text-center ">
                                <div class="panel-body">
                                    <table class="table ">
                                        <thead>
                                        <tr>
                                            <th>Room Type</th>
                                            <th align="center">Features</th>
                                            <th>Status</th>
                                            <th> </th>
                                        </tr>
                                        </thead>
                                        <tbody>

                                        <tr class="Secondary">
                                            <td>T ROOM</td>
                                            <td>

                                                <a href="#" class="confirm-delete   " role="button" data-title="kitty" data-id="2"><span class="fa fa-television " >8</span></a>
                                                <a href="#" class="confirm-delete   "><span class="fa fa-phone" > 1</span></a>
                                                <a href="#" class="confirm-delete"><span class="fa fa-table " >8</span></a>

                                            </td>
                                            <td><span class="label label-primary">Open</span></td>


                                        </tr>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <div class="col-md-6">
                    <button class="btn btn-lg" data-dismiss="modal" aria-hidden="true">Cancel</button>
                </div>
                <div class="col-md-3">
                    <button class="btn btn-primary btn-lg" data-dismiss="modal" aria-hidden="true">Edit</button>
                </div>
            </div>
        </div>
        </div></div>
</div>
<!--modal-->
<!--delete modal-->
<div id="delete" class="modal fade modal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="vertical-alignment-helper">
        <div class="modal-dialog model-lg vertical-align-center">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
                <h1 class="text-center"><strong> Delete </strong></h1>
            </div>
            <div class="modal-body">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="text-center ">
                                <div class="panel-body">

                                    <table class="table table-responsive table-hover hidden-xs">
                                        <thead >
                                        <tr>
                                            <th>  <span class=" glyphicon glyphicon-user "><strong>Name</strong> </span></th>
                                            <th>  <span class="glyphicon glyphicon-envelope"> <strong>Email</strong></span> </th>
                                            <th> <span class="glyphicon glyphicon-phone">  <strong>Phone</strong></span> </th>
                                            <th> </th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr class="">
                                            <td>Binod</td>
                                            <td>b@synbook.com</td>
                                            <td> 123222222</td>
                                        </tr>


                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">

                <div class="col-md-6">
                    <button class="btn btn-lg" data-dismiss="modal" aria-hidden="true">Cancel</button>
                </div>
                <div class="col-md-3">
                    <button class="btn btn-primary btn-lg" data-dismiss="modal" aria-hidden="true">Delete</button>
                </div>
            </div>
        </div></div>
    </div>
</div>
<!--modal-->


<!--add modal-->
<div id="add" class="modal fade modal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="vertical-alignment-helper">
        <div class="modal-dialog model-sm vertical-align-center">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
                <h1 class="text-center"><strong> Add new user </strong></h1>
            </div>
            <div class="modal-body">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="text-center ">
                                <div class="panel-body">

                                    <div class="form-group">

                                                <div class="input-group">
                                                    <span class="input-group-addon"> <i class="glyphicon glyphicon-user "> </i> </span>
                                                    <input type="text" class="form-control"  placeholder="Name" required>
                                                </div>
                                    </div>

                                        <div class="form-group">
                                                <div class="input-group">
                                                    <span class="input-group-addon"> <i class="glyphicon glyphicon-envelope "> </i> </span>
                                                    <input type="email" class="form-control"  placeholder="E-mail" required>
                                                </div>
                                        </div>



                                    <div class="form-group">
                                        <div class="input-group">
                                            <span class="input-group-addon"> <i class="glyphicon glyphicon-phone "> </i> </span>
                                            <input type="text" class="form-control"  placeholder="Phone Number">
                                        </div>

                                    </div>


                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">

                <div class="col-md-6">
                    <button class="btn btn-lg" data-dismiss="modal" aria-hidden="true">Cancel</button>
                </div>
                <div class="col-md-3">
                    <button class="btn btn-primary btn-lg" data-dismiss="modal" aria-hidden="true">Add</button>
                </div>
            </div>
        </div>
        </div></div>
</div>
<!--modal-->