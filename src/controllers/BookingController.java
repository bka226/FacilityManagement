package controllers;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import responses.BookingListResponseBody;
import responses.BookingResponseBody;
import responses.ResponseBody;
import services.email.SyntelEmail;
import dao.BookingDAO;
import dao.BookingDAOInsertOperation;
import dao.BookingDAOUpdateOperation;
import dao.DAOOperations;
import dao.EmployeeDAO;
import dao.RoomDAO;
import model.Booking;
import model.Employee;

@RestController
public class BookingController implements SyntelEmail {

	BookingDAO dao = new BookingDAO();

	@RequestMapping("/bookingform")
	public ModelAndView showform(){
		return new ModelAndView("bookingform", "command", new Booking());
	}
	
	@RequestMapping(value="/selectroom/weekly/viewbooking/{id}")
	public ResponseEntity<BookingListResponseBody> viewWeeklyBookingsForRoom(@PathVariable int id, HttpServletRequest request) {
		BookingListResponseBody responseBody = new BookingListResponseBody();
		
		Employee employee = (Employee)request.getSession().getAttribute("employee");
		
		GregorianCalendar gregorianCalendar = new GregorianCalendar();
		gregorianCalendar.set(Calendar.DAY_OF_WEEK, Calendar.SUNDAY);
		Date startDate = new Date(gregorianCalendar.getTimeInMillis());
		
		gregorianCalendar.set(Calendar.DAY_OF_WEEK, Calendar.SATURDAY);
		Date endDate = new Date(gregorianCalendar.getTimeInMillis());
		
		responseBody.setBookings(
				dao.getEmployeeBookingsForRoomAtSpecificDateRange(
						employee.getId(), id, startDate, endDate));
		
		return new ResponseEntity<BookingListResponseBody>(responseBody, HttpStatus.OK);
	}
	
	private ResponseEntity<ResponseBody> performBasicOperationOnBooking(
			DAOOperations<BookingDAO> daoOperations, Booking booking, HttpServletRequest request) {
		BookingResponseBody responseBody = new BookingResponseBody();
		
		booking.setEmployee((Employee) request.getSession().getAttribute("employee"));
		
		if (dao.hasScheduleConflict(booking)) {
			return new ResponseEntity<ResponseBody>(HttpStatus.FORBIDDEN);
		}
		
		if (daoOperations.performOperation(dao)) {
			responseBody.setBooking(booking);
			
			List<String> recipients = new ArrayList<String>();
			recipients.add(booking.getEmployee().getEmail());
			SYNBOOKEMAILSENDER.sendEmail(recipients, booking);
			
			return new ResponseEntity<ResponseBody>(responseBody, HttpStatus.CREATED);
		}
		
		return new ResponseEntity<ResponseBody>(HttpStatus.FORBIDDEN);
	}
	
	@RequestMapping(value = "/savebooking", method = RequestMethod.POST)
	public ResponseEntity<ResponseBody> save(@RequestBody Booking booking, HttpServletRequest request){
		return performBasicOperationOnBooking(new BookingDAOInsertOperation(booking), booking, request);
	}

	
	@RequestMapping(value = "/editbooking/savebookingedit", method = RequestMethod.POST)
	public ResponseEntity<ResponseBody> savebookingedit(@RequestBody Booking booking, HttpServletRequest request){
		return performBasicOperationOnBooking(new BookingDAOUpdateOperation(booking), booking, request);
	}

	@RequestMapping("/viewbooking")
	public ModelAndView viewbooking(){
		List<Booking> list;
		list = dao.showBooking();
		return new ModelAndView("viewbooking", "blist", list);

	}

	@RequestMapping(value="/editbooking/{id}")
	public ModelAndView editbooking(@PathVariable int id){
		try{
			Booking booking = dao.select(id);
			return new ModelAndView("editbooking", "command", booking);
		}
		catch(EmptyResultDataAccessException e) {
			ArrayList<String> errorMessages = new ArrayList<>();
			errorMessages.add("Select Failed");
			errorMessages.add("Item not in Database");
			errorMessages.add("viewbooking");
			return new ModelAndView("error", "errorList", errorMessages);
		}
	}
	@RequestMapping(value="/cancelbooking/{id}", method=RequestMethod.GET)
	public ResponseEntity<String> cancelbooking(@PathVariable int id){
		if (dao.delete(id)) {
			return new ResponseEntity<String>(HttpStatus.OK);
		}
		
		return new ResponseEntity<String>(HttpStatus.FORBIDDEN);
	}
	
	@RequestMapping(value = "/selectroom/saveroom/{id}")
	public ModelAndView savelocation(@PathVariable int id, @RequestParam int did) {
		dao.update(dao.select(id), "room", did);
		return new ModelAndView("redirect:/viewbooking");
	}
	
	@RequestMapping(value = "/selectroom/{id}")
	public ModelAndView changelocation(@PathVariable int id) {
		try {
			dao.select(id);
			Object[] obj = new Object[3];
			obj[0] = id;
			obj[1] = new RoomDAO().showRoom();
			obj[2] = "saveroom";
			return new ModelAndView("selectroom", "obj", obj);
		}
		catch(EmptyResultDataAccessException e)	{
			ArrayList<String> errorMessages = new ArrayList<>();
			errorMessages.add("Select Failed");
			errorMessages.add("Item not in Database");
			errorMessages.add("viewroom");
			return new ModelAndView("error", "errorList", errorMessages);
		}
	}
	
	@RequestMapping(value = "/selectemployee/saveemployee/{id}")
	public ModelAndView savetype(@PathVariable int id, @RequestParam int did) {
		dao.update(dao.select(id), "employee", did);
		return new ModelAndView("redirect:/viewbooking");
	}
	
	@RequestMapping(value = "/selectemployee/{id}")
	public ModelAndView changetype(@PathVariable int id) {
		try {
			dao.select(id);
			Object[] obj = new Object[3];
			obj[0] = id;
			obj[1] = new EmployeeDAO().showEmployee();
			obj[2] = "saveemployee";
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
	
}