package controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import responses.RoomTypeListResponseBody;
import dao.RoomTypeDAO;
import model.RoomType;

@RestController
public class RoomTypeController {
	RoomTypeDAO dao = new RoomTypeDAO();


	@RequestMapping("/roomtypeform")
	public ModelAndView showform(){
		return new ModelAndView("roomtypeform", "command", new RoomType());
	}

	@RequestMapping(value = "/saveroomtype", method = RequestMethod.POST)
	public ModelAndView save(@ModelAttribute("RoomType") RoomType roomtype){
		dao.insert(roomtype);
		return new ModelAndView("redirect:/viewroomtype");
	}

	@RequestMapping(value = "/editroomtype/saveroomtypeedit", method = RequestMethod.POST)
	public ModelAndView saveroomtypeedit(@ModelAttribute("RoomType") RoomType roomtype){
		dao.update(roomtype);
		return new ModelAndView("redirect:/viewroomtype");
	}

	@RequestMapping("/viewroomtype")
	public ResponseEntity<RoomTypeListResponseBody> viewRoomType(){
		List<RoomType> list = dao.showRoomType();
		
		RoomTypeListResponseBody responseBody = new RoomTypeListResponseBody();
		responseBody.setRoomTypes(list);
		return new ResponseEntity<RoomTypeListResponseBody>(responseBody, HttpStatus.OK);
	}

	@RequestMapping(value="/editroomtype/{id}")
	public ModelAndView editRoomType(@PathVariable int id){
		try {
			RoomType roomtype = dao.select(id);
			return new ModelAndView("editroomtype", "command", roomtype);
		}
		catch(EmptyResultDataAccessException e)	{
			ArrayList<String> errorMessages = new ArrayList<>();
			errorMessages.add("Select Failed");
			errorMessages.add("Item not in Database");
			errorMessages.add("viewroomtype");
			return new ModelAndView("error", "errorList", errorMessages);
		}
	}

	@RequestMapping(value="/deleteroomtype/{id}")
	public ModelAndView deleteroomtype(@PathVariable int id){
		try	{
			dao.delete(id);
			return new ModelAndView("redirect:/viewroomtype");
		}
		catch(DataIntegrityViolationException e) { 
			ArrayList<String> errorMessages = new ArrayList<>();
			errorMessages.add("Delete Failed");
			errorMessages.add("Other Records Depend on This Item");
			errorMessages.add("viewroomtype");
			return new ModelAndView("error", "errorList", errorMessages);
		}
	}
}

