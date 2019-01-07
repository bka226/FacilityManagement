package controllers;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RestController;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dao.DestinationDAO;
import dao.RoomDAO;
import dao.RoomFeatureDAO;
import dao.RoomTypeDAO;

import responses.RoomListResponseBody;
import responses.RoomResponseBody;
import model.Destination;
import model.Room;
import model.RoomFeature;

@RestController
public class RoomController {
	RoomDAO dao = new RoomDAO();
	@RequestMapping("/roomform")
	public ModelAndView showform(){
		return new ModelAndView("roomform", "command", new Room());
	}
	@RequestMapping(value = "/saveroom", method = RequestMethod.POST)
	public ResponseEntity<RoomResponseBody> save(@RequestBody Room room, HttpServletRequest request){
		RoomResponseBody responseBody = new RoomResponseBody();
		
		HttpSession session = request.getSession();
		Destination destination = (Destination) session.getAttribute("Location");

		room.setLocation(destination);

		
		if (dao.insert(room)) {
			responseBody.setRoom(room);
			return new ResponseEntity<RoomResponseBody>(responseBody, HttpStatus.CREATED);
		}
		
		return new ResponseEntity<RoomResponseBody>(HttpStatus.FORBIDDEN);
	}

	@RequestMapping(value = "/saveroomedit", method = RequestMethod.POST)
	public ResponseEntity<RoomResponseBody> saveroomedit(@RequestBody Room room){
		RoomResponseBody responseBody = new RoomResponseBody();
		RoomFeatureDAO rfdao = new RoomFeatureDAO();
		if (dao.update(room)) {
			for(RoomFeature roomFeature : room.getFeatures()) {
				if(!rfdao.update(roomFeature)) {
					rfdao.insert(roomFeature, room.getId());
				}
			}
			responseBody.setRoom(room);
			return new ResponseEntity<RoomResponseBody>(responseBody, HttpStatus.OK);
		}
		
		return new ResponseEntity<RoomResponseBody>(HttpStatus.FORBIDDEN);
	}

	@RequestMapping("/viewroom")
	public ResponseEntity<RoomListResponseBody> viewRoom(HttpServletRequest request){
		RoomListResponseBody responseBody = new RoomListResponseBody();
		HttpSession session = request.getSession();
		Destination destination = (Destination) session.getAttribute("Location");
		responseBody.setRooms(dao.roomsAtDestination(destination.getId()));
		
		return new ResponseEntity<RoomListResponseBody>(responseBody, HttpStatus.OK);
	}
	
	@RequestMapping("/viewroom/roomtype/{id}")
	public ResponseEntity<RoomListResponseBody> viewRoomOfRoomType(@PathVariable int id, HttpServletRequest request) {
		RoomListResponseBody responseBody = new RoomListResponseBody();
		HttpSession session = request.getSession();
		Destination destination = (Destination)session.getAttribute("Location");
		
		responseBody.setRooms(dao.roomsWithRoomTypeAtDestination(id, destination.getId()));
		
		return new ResponseEntity<RoomListResponseBody>(responseBody, HttpStatus.OK);
	}

	@RequestMapping(value = "/changeroomlocation/savelocation/{id}")
	public ModelAndView savelocation(@PathVariable int id, @RequestParam int did) {
		dao.update(dao.select(id), "destination", did);
		return new ModelAndView("redirect:/viewroom");
	}

	@RequestMapping(value = "/changeroomlocation/{id}")
	public ModelAndView changelocation(@PathVariable int id) {
		try {
			dao.select(id);
			Object[] obj = new Object[3];
			obj[0] = id;
			obj[1] = new DestinationDAO().showDestination();
			obj[2] = "savelocation";
			return new ModelAndView("selectlocation", "obj", obj);
		}
		catch(EmptyResultDataAccessException e)	{
			ArrayList<String> errorMessages = new ArrayList<>();
			errorMessages.add("Select Failed");
			errorMessages.add("Item not in Database");
			errorMessages.add("viewroom");
			return new ModelAndView("error", "errorList", errorMessages);
		}
	}

	@RequestMapping(value = "/changeroomtype/saveroomtype/{id}")
	public ModelAndView savetype(@PathVariable int id, @RequestParam int did) {
		dao.update(dao.select(id), "roomtype", did);
		return new ModelAndView("redirect:/viewroom");
	}

	@RequestMapping(value = "/changeroomtype/{id}")
	public ModelAndView changetype(@PathVariable int id) {
		try {
			dao.select(id);
			Object[] obj = new Object[3];
			obj[0] = id;
			obj[1] = new RoomTypeDAO().showRoomType();
			obj[2] = "saveroomtype";
			return new ModelAndView("selectroomtype", "obj", obj);
		}
		catch(EmptyResultDataAccessException e)	{
			ArrayList<String> errorMessages = new ArrayList<>();
			errorMessages.add("Select Failed");
			errorMessages.add("Item not in Database");
			errorMessages.add("viewroom");
			return new ModelAndView("error", "errorList", errorMessages);
		}
	}

	@RequestMapping(value="/editroom/{id}")
	public ModelAndView editdestination(@PathVariable int id){
		try {
			Room room = dao.select(id);
			return new ModelAndView("editroom", "command", room);
		}
		catch(EmptyResultDataAccessException e) {
			ArrayList<String> errorMessages = new ArrayList<>();
			errorMessages.add("Select Failed");
			errorMessages.add("Item not in Database");
			errorMessages.add("viewroom");
			return new ModelAndView("error", "errorList", errorMessages);
		}
	}

	@RequestMapping(value="/deleteroom/{id}", method=RequestMethod.GET)
	public ResponseEntity<String> deleteroom(@PathVariable int id){
		if (dao.delete(id)) {
			return new ResponseEntity<String>(HttpStatus.OK);
		}
		
		return new ResponseEntity<String>(HttpStatus.FORBIDDEN);
	}
	@RequestMapping("/featuresinroom/{id}")
	public ModelAndView featuresinroom(@PathVariable int id) {
		return new ModelAndView("viewroomfeature", "rflist", new RoomFeatureDAO().featuresInRoom(id));
	}
}
