<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="HeaderAndFooter.jsp"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<script src="<c:url value="/resources/scripts/synbook-general.js"/>"
	type="text/javascript"></script>
<script
	src="<c:url value="/resources/scripts/synbook-destination-table.js"/>"
	type="text/javascript"></script>

<title>SynBook</title>

<script type="text/javascript">
	var destinationToDelete;
	var destinationToEdit;

	function addTableButtonsOnClickEvents() {
		$("#editDestinationButtonRow1").click(function(event) {
			event.preventDefault();
			showEditDialogAndDestination(destinationsCurrentlyInTable[0]);
		});

		$("#editDestinationButtonRow2").click(function(event) {
			event.preventDefault();
			showEditDialogAndDestination(destinationsCurrentlyInTable[1]);
		});

		$("#editDestinationButtonRow3").click(function(event) {
			event.preventDefault();
			showEditDialogAndDestination(destinationsCurrentlyInTable[2]);
		});
		
		$("#editDestinationButtonRow4").click(function(event) {
			event.preventDefault();
			showEditDialogAndDestination(destinationsCurrentlyInTable[3]);
		});

		$("#editDestinationButtonRow5").click(function(event) {
			event.preventDefault();
			showEditDialogAndDestination(destinationsCurrentlyInTable[4]);
		});

		$("#deleteDestinationButtonRow1").click(function(event) {
			event.preventDefault();
			showDeleteDialogAndDestination(destinationsCurrentlyInTable[0]);
		});

		$("#deleteDestinationButtonRow2").click(function(event) {
			event.preventDefault();
			showDeleteDialogAndDestination(destinationsCurrentlyInTable[1]);
		});

		$("#deleteDestinationButtonRow3").click(function(event) {
			event.preventDefault();
			showDeleteDialogAndDestination(destinationsCurrentlyInTable[2]);
		});
		
		$("#deleteDestinationButtonRow4").click(function(event) {
			event.preventDefault();
			showDeleteDialogAndDestination(destinationsCurrentlyInTable[3]);
		});

		$("#deleteDestinationButtonRow5").click(function(event) {
			event.preventDefault();
			showDeleteDialogAndDestination(destinationsCurrentlyInTable[4]);
		});
	}

	function showDeleteDialogAndDestination(destination) {
		destinationToDelete = destination;

		$("#deleteFacilityName").text(
				destinationToDelete.street + " " + destinationToDelete.city	+ " " +
				destinationToDelete.state + " " + destinationToDelete.country);

		$("#delete").modal('show');
	}

	function showEditDialogAndDestination(destination) {
		destinationToEdit = destination;

		$("#editFacilityStreet").val(destinationToEdit.street);
		$("#editFacilityCity").val(destinationToEdit.city);
		$("#editFacilityState").val(destinationToEdit.state);
		$("#editFacilityCountry").val(destinationToEdit.country);

		$("#edit").modal('show');
	}

	function updateDestinationTableWithRefreshedEventHandlerForEditDeleteBtn() {
		var refreshEventHandlerFunc = function() {
			addTableButtonsOnClickEvents();
		}

		updateDestinationTable(refreshEventHandlerFunc, refreshEventHandlerFunc);
	}

	$(document)
			.ready(
					function() {
						tableRows = [ $("#destinationRecordTableRow1"),
								$("#destinationRecordTableRow2"),
								$("#destinationRecordTableRow3"),
								$("#destinationRecordTableRow4"),
								$("#destinationRecordTableRow5")];
						numOfDestinationsPerTable = tableRows.length;

						updateDestinationTableWithRefreshedEventHandlerForEditDeleteBtn();

						$("#addFacilityForm")
								.submit(
										function(event) {
											event.preventDefault();

											var destination = {};

											destination["street"] = $(
													"#addFacilityStreet").val();
											destination["city"] = $(
													"#addFacilityCity").val();
											destination["state"] = $(
													"#addFacilityState").val();
											destination["country"] = $(
													"#addFacilityCountry")
													.val();

											postJsonDataToServer(
													getFRMUrl("savedestination"),
													destination,
													function(data) {
														console.log("SUCCESS: "
																+ data);
														updateDestinationTableWithRefreshedEventHandlerForEditDeleteBtn();
													});
										});

						$("#addFacilitySubmit").click(function(event) {
							$("#addFacilityForm").submit();
						});

						$("#deleteFacilitySubmit")
								.click(
										function(event) {
											getRequestToServer(
													getFRMUrl("deletedestination/"
															+ destinationToDelete.id),
													function(data) {
														updateDestinationTableWithRefreshedEventHandlerForEditDeleteBtn();
													});
										});

						$("#editFacilitySubmit")
								.click(
										function(event) {
											console.log("Editing Destination "
													+ destinationToEdit.id)
											destinationToEdit.street = $(
													"#editFacilityStreet")
													.val();
											destinationToEdit.city = $(
													"#editFacilityCity").val();
											destinationToEdit.state = $(
													"#editFacilityState").val();
											destinationToEdit.country = $(
													"#editFacilityCountry")
													.val();

											postJsonDataToServer(
													getFRMUrl("savedestinationedit"),
													destinationToEdit,
													function(data) {
														updateDestinationTableWithRefreshedEventHandlerForEditDeleteBtn();
													});
										});
					});
</script>

</head>
<body style="background-color: #fffef2;">

	<!-------------------------- Image Hover ----------------------------------------------->
	<div class="container">
		<!-------------------------- Room Type Dropdown ----------------------------------------------->



		<div class=" dropdown hidden-xs " id="dropdown_button">
			<a href="#" class=" btn btn-success btn-responsive-lg btn-lg "
				id="plussign" data-toggle="modal" data-target="#add"> Add  <span
				class="glyphicon glyphicon-plus-sign"></span></a>
		</div>


		<div class=" dropdown hidden-lg hidden-sm hidden-md " id="">
			<a href="#" class=" btn btn-success btn-responsive-lg btn-lg "
				id="plussign" data-toggle="modal" data-target="#add">Add <span
				class="glyphicon glyphicon-plus-sign"></span></a>
		</div>
<br>
		<!-------------------------- Room Record table ----------------------------------------------->
		<table id="destinationRecordTable"
			class="table table-responsive table-hover table-striped table-bordered">
			<thead>
				<tr>

				</tr>
			</thead>
			<tbody>

				<tr id="destinationRecordTableRow1" class="">
					<td class="destinationRecordTableStreet">LOCATION STREET</td>
					<td class="destinationRecordTableCity">LOCATION CITY</td>
					<td class="destinationRecordTableState">LOCATION STATE</td>
					<td class="destinationRecordTableCountry">LOCATION COUNTRY</td>
					<td>
						<!-- data-toggle="modal" data-target="#edit" --> <a href="#"
						id="editDestinationButtonRow1"
						class="confirm-delete btn-lg btn-default"><span
							class="glyphicon glyphicon-edit"></span></a> <a href="#"
						id="deleteDestinationButtonRow1"
						class="confirm-delete  btn-lg btn-danger "><span
							class="glyphicon glyphicon-trash"></span></a>
					</td>
				</tr>

				<tr id="destinationRecordTableRow2" class="">
					<td class="destinationRecordTableStreet">LOCATION STREET</td>
					<td class="destinationRecordTableCity">LOCATION CITY</td>
					<td class="destinationRecordTableState">LOCATION STATE</td>
					<td class="destinationRecordTableCountry">LOCATION COUNTRY</td>
					<td><a href="#" id="editDestinationButtonRow2"
						class="confirm-delete btn-lg btn-default "><span
							class="glyphicon glyphicon-edit"></span> </a> <a href="#"
						id="deleteDestinationButtonRow2"
						class="confirm-delete  btn-lg btn-danger"><span
							class="glyphicon glyphicon-trash"></span></a></td>
				</tr>

				<tr id="destinationRecordTableRow3" class="">
					<td class="destinationRecordTableStreet">LOCATION STREET</td>
					<td class="destinationRecordTableCity">LOCATION CITY</td>
					<td class="destinationRecordTableState">LOCATION STATE</td>
					<td class="destinationRecordTableCountry">LOCATION COUNTRY</td>

					<td><a href="#" id="editDestinationButtonRow3"
						class="confirm-delete btn-lg btn-default"><span
							class="glyphicon glyphicon-edit"></span></a> <a href="#"
						id="deleteDestinationButtonRow3"
						class="confirm-delete  btn-lg btn-danger "><span
							class="glyphicon glyphicon-trash"></span></a></td>
				</tr>
				
				<tr id="destinationRecordTableRow4" class="">
					<td class="destinationRecordTableStreet">LOCATION STREET</td>
					<td class="destinationRecordTableCity">LOCATION CITY</td>
					<td class="destinationRecordTableState">LOCATION STATE</td>
					<td class="destinationRecordTableCountry">LOCATION COUNTRY</td>

					<td><a href="#" id="editDestinationButtonRow4"
						class="confirm-delete btn-lg btn-default"><span
							class="glyphicon glyphicon-edit"></span></a> <a href="#"
						id="deleteDestinationButtonRow4"
						class="confirm-delete  btn-lg btn-danger "><span
							class="glyphicon glyphicon-trash"></span></a></td>
				</tr>
				
				<tr id="destinationRecordTableRow5" class="">
					<td class="destinationRecordTableStreet">LOCATION STREET</td>
					<td class="destinationRecordTableCity">LOCATION CITY</td>
					<td class="destinationRecordTableState">LOCATION STATE</td>
					<td class="destinationRecordTableCountry">LOCATION COUNTRY</td>

					<td><a href="#" id="editDestinationButtonRow5"
						class="confirm-delete btn-lg btn-default"><span
							class="glyphicon glyphicon-edit"></span></a> <a href="#"
						id="deleteDestinationButtonRow5"
						class="confirm-delete  btn-lg btn-danger "><span
							class="glyphicon glyphicon-trash"></span></a></td>
				</tr>

			</tbody>
		</table>
		<!-------------------------- Next Buttons----------------------------------------------->

		<div class="">
			<ul id="nextButtons" class="pager pager-hover  hidden-xs">
			</ul>
		</div>
	</div>

	<!-------------------------- Footer ----------------------------------------------->
	<%@include file="footer.jsp"%>

	<!-------------------------- Modals-ADD ----------------------------------------------->
	<div id="add" class="modal fade" tabindex="-1" role="dialog"
		aria-hidden="true">
		<form id="addFacilityForm">
			<div class="vertical-alignment-helper">
				<div class="modal-dialog model-lg vertical-align-center">
					<div class="modal-content">
						<div class="modal-header" style="background-color:black; color:white;">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">X</button>
							<h1 class="text-center">
								<strong> Add Facility </strong>
							</h1>
						</div>
						<div class="modal-body">
							<div class="col-md-12">
								<div class="panel panel-default">
									<div class="panel-body">
										<div class="text-center ">
											<div class="panel-body">

												<div class="form-group">

													<div class="input-group">
														<span class="input-group-addon"> <i class=" ">
														</i>
														</span> <input id="addFacilityStreet" class="form-control"
															placeholder="Street Address" required />
													</div>
												</div>

												<div class="form-group">
													<div class="input-group">
														<span class="input-group-addon"> <i class=" ">
														</i>
														</span> <input id="addFacilityCity" class="form-control"
															placeholder="City" required />
													</div>
												</div>

												<div class="form-group">
													<div class="input-group">
														<span class="input-group-addon"> <i class=" ">
														</i>
														</span> <input id="addFacilityState" class="form-control"
															placeholder="State" required />
													</div>
												</div>

												<div class="form-group">

													<div class="input-group">
														<span class="input-group-addon"> <i class=" ">
														</i>
														</span> <input id="addFacilityCountry" class="form-control"
															placeholder="Country" required />
													</div>
												</div>

											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="modal-footer">

							<div class="col-md-9">
								<button class="btn btn-lg" data-dismiss="modal"
									aria-hidden="true">Cancel</button>
							</div>
							<div class="col-md-2">
								<input type="submit" id="addFacilitySubmit"
									class="btn btn-primary btn-lg" data-dismiss="modal"
									aria-hidden="true" value="Add">
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>

	<!-------------------------- ----------------------------------------------------------------------->
	<!-------------------------- ----------------- ----------------------------------------------->
		<!--modal-->
	<div id="edit" class="modal fade" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="vertical-alignment-helper">
			<div class="modal-dialog model-lg vertical-align-center">


				<div class="modal-content">
<div class="modal-header" style="background-color:black; color:white;">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">X</button>
					<h1 class="text-center">
						<strong> Edit</strong>
					</h1>
					</div>


					<div class="col-md-12">
						<div class="text-center ">
							<table class="table table-responsive table-hover hidden-xs">
								<thead>
								</thead>
								<tbody>
									<tr class="Secondary">
										<td>Street:</td>
										<td><input id="editFacilityStreet" type="text"
											class="confirm-delete"></td>
									</tr>
									<tr class="Secondary">
										<td>City:</td>
										<td><input id="editFacilityCity" type="text"
											class="confirm-delete"></td>
									</tr>
									<tr class="Secondary">
										<td>State:</td>
										<td><input id="editFacilityState" type="text"
											class="confirm-delete"></td>
									</tr>
									<tr class="Secondary">
										<td>Country:</td>
										<td><input id="editFacilityCountry" type="text"
											class="confirm-delete"></td>
									</tr>
								</tbody>

							</table>
						</div>
					</div>

					<div class="modal-footer">

						<div class="col-md-9">
							<button class="btn btn-lg" data-dismiss="modal"
								aria-hidden="true">Cancel</button>
						</div>
						<div class="col-md-2">
							<button id="editFacilitySubmit" class="btn btn-primary btn-lg"
								data-dismiss="modal" aria-hidden="true">Save</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!------------------------------------ Modals-EDIT ----------------------------------------------->

	<!--modal-->
	<div id="edit" class="modal fade" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="vertical-alignment-helper">
			<div class="modal-dialog model-lg vertical-align-center">


				<div class="modal-content">
<div class="modal-header" style="background-color:black; color:white;">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">X</button>
					<h1 class="text-center">
						<strong> Edit</strong>
					</h1>
					</div>


					<div class="col-md-12">
						<div class="text-center ">
							<table class="table table-responsive table-hover hidden-xs">
								<thead>
								</thead>
								<tbody>
									<tr class="Secondary">
										<td>Street:</td>
										<td><input id="editFacilityStreet" type="text"
											class="confirm-delete"></td>
									</tr>
									<tr class="Secondary">
										<td>City:</td>
										<td><input id="editFacilityCity" type="text"
											class="confirm-delete"></td>
									</tr>
									<tr class="Secondary">
										<td>State:</td>
										<td><input id="editFacilityState" type="text"
											class="confirm-delete"></td>
									</tr>
									<tr class="Secondary">
										<td>Country:</td>
										<td><input id="editFacilityCountry" type="text"
											class="confirm-delete"></td>
									</tr>
								</tbody>

							</table>
						</div>
					</div>

					<div class="modal-footer">

						<div class="col-md-9">
							<button class="btn btn-lg" data-dismiss="modal"
								aria-hidden="true">Cancel</button>
						</div>
						<div class="col-md-2">
							<button id="editFacilitySubmit" class="btn btn-primary btn-lg"
								data-dismiss="modal" aria-hidden="true">Save</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-------------------------- Modals-DELETE ----------------------------------------------->
	<div id="delete" class="modal fade modal" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="vertical-alignment-helper">
			<div class="modal-dialog model-lg vertical-align-center">

				<div class="modal-content">
<div class="modal-header" style="background-color:black; color:white;">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">X</button>
					<h1 class="text-center">
						<strong> Delete </strong>
					</h1>
</div>

					<div class="col-md-12">
						<div class="text-center ">
							<table class="table table-responsive table-hover hidden-xs">
								<tr>
									<th id="deleteFacilityName"></th>
								</tr>
							</table>
						</div>


					</div>

					<div class="modal-footer">

						<div class="col-md-9">
							<button class="btn btn-lg" data-dismiss="modal"
								aria-hidden="true">No</button>
								</div>
						<div class="col-md-2">
							<button id="deleteFacilitySubmit" class="btn btn-primary btn-lg"
								data-dismiss="modal" aria-hidden="true">Yes</button>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>

</html>
