package controllers;

import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dao.DestinationDAO;
import dao.RoomDAO;
import model.Destination;
import responses.DestinationListResponseBody;
import responses.DestinationResponseBody;


@Controller
public class DestinationController {

	DestinationDAO dao = new DestinationDAO();

	@RequestMapping("/destinationform")
	public ModelAndView showform(){
		return new ModelAndView("AddFacilityForm", "command", new Destination());
	}

	@RequestMapping(value = "/savedestination", method = RequestMethod.POST)
	public ResponseEntity<DestinationResponseBody> save(@RequestBody Destination destination, HttpServletRequest request){
		DestinationResponseBody responseBody = new DestinationResponseBody();
		
		if (dao.insert(destination)) {
			HttpSession session = request.getSession();
			session.setAttribute("Location", destination);
			responseBody.setDestination(destination);
			session.setAttribute("LocationList", dao.showDestination());
			
			return new ResponseEntity<DestinationResponseBody>(responseBody, HttpStatus.CREATED);
		}
		return new ResponseEntity<DestinationResponseBody>(HttpStatus.FORBIDDEN);
	}

	@RequestMapping(value = "/savedestinationedit", method = RequestMethod.POST)
	public ResponseEntity<DestinationResponseBody> saveDestinationEdit(@RequestBody Destination destination){
		DestinationResponseBody responseBody = new DestinationResponseBody();
		if (dao.update(destination)) {
			responseBody.setDestination(destination);
			return new ResponseEntity<DestinationResponseBody>(responseBody, HttpStatus.OK);
		}
		
		return new ResponseEntity<DestinationResponseBody>(HttpStatus.FORBIDDEN);
	}

	@RequestMapping("/viewdestination")
	public ResponseEntity<DestinationListResponseBody> viewDestination(){
		DestinationListResponseBody responseBody = new DestinationListResponseBody();
		responseBody.setDestinations(dao.showDestination());
		
		return new ResponseEntity<DestinationListResponseBody>(responseBody, HttpStatus.OK);
	}

	@RequestMapping(value="/editdestination/{id}")
	public ModelAndView editdestination(@PathVariable int id){
		try{
			Destination destination = dao.select(id);
			return new ModelAndView("editdestination", "command", destination);
		}
		catch (EmptyResultDataAccessException e) {
			ArrayList<String> errorMessages = new ArrayList<>();
			errorMessages.add("Select Failed");
			errorMessages.add("Item not in Database");
			errorMessages.add("viewdestination");
			return new ModelAndView("error", "errorList", errorMessages);
		}
	}
	
	@RequestMapping("/changelocation")
	public ModelAndView changelocation() {
		return new ModelAndView("changelocation", "dlist", dao.showDestination());
	}
	
	@RequestMapping("/setlocation/{id}")
	public ResponseEntity<String> setlocation(@PathVariable int id, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Destination location = dao.select(id);
		session.setAttribute("Location", location);
		return new ResponseEntity<String>(HttpStatus.OK);
	}

	@RequestMapping(value="/deletedestination/{id}", method=RequestMethod.GET)
	public ResponseEntity<String> deletedestination(@PathVariable int id, HttpServletRequest request){
		if (dao.delete(id)) {
			HttpSession session = request.getSession();
			session.setAttribute("LocationList", dao.showDestination());
			return new ResponseEntity<String>(HttpStatus.OK);
		}
		
		return new ResponseEntity<String>(HttpStatus.FORBIDDEN);
	}
	
	@RequestMapping("/roomsatlocation/{id}")
	public ModelAndView locationrooms(@PathVariable int id) {
		return new ModelAndView("viewroom", "rlist", new RoomDAO().roomsAtDestination(id));
	}
}
