<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);

	if (session.getAttribute("LocationList") == null)
		response.sendRedirect("/FRM/login");
%>
<script src="<c:url value="/resources/scripts/synbook-general.js"/>"
	type="text/javascript"></script>
<script type="text/javascript">
$(document).on("click",	"#selectLocation", function(event) {
	var id = parseInt($(this).attr("name"));
	event.preventDefault();
	postJsonDataToServer(getFRMUrl("setlocation/" + id), null);
	location.reload();
});
</script>

</head>

<!-- change location -->
<div id="changelocation" class="modal fade" tabindex="-1"
	role="dialog">
	<div class="vertical-alignment-helper">
		<div class="modal-dialog model-lg vertical-align-center">
			<div class="modal-content">
				<div class="modal-header " style="background-color: black; color: white;">

					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">X</button>
					<h1 class="text-center" id="roomTitle">
						<strong>Change Location</strong>
					</h1>
				</div>
				<div class="modal-body ">
					<div class="text-center">
						<h3>${sessionScope.Location.city}</h3>

						<table id="selectDestinationTable" style="margin: auto;"
							class=" table-hover table-responsive   table-bordered">
							<c:forEach var="destination"
								items="${sessionScope.LocationList}">
								<tr>
									<td>${destination.street}, ${destination.city},
										${destination.state}, ${destination.country}</td>
									<td><button id="selectLocation" class="btn btn-lg"
											data-dismiss="modal" aria-hidden="true"
											name="${destination.id}">Select</button></td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>		
</html>