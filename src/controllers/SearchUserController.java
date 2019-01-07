package controllers;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import dao.EmployeeDAO;
import model.Booking;
import model.Employee;
import model.SearchUser;
import responses.BookingResponseBody;
import responses.SearchUserBody;

@RestController
public class SearchUserController {
	
	EmployeeDAO dao = new EmployeeDAO();
	
	@RequestMapping("/searchuser")
	public ModelAndView search(){
		return new ModelAndView("searchuser", "command", new Employee());
	}
	
	@RequestMapping(value = "/search/user", method = RequestMethod.POST)
	public ResponseEntity<SearchUserBody> save(@RequestBody SearchUser searchuser){
		SearchUserBody responseBody = new SearchUserBody();
		

		//List<Employee> matches = dao.searchByName(null);
		
		List<Employee> matches = dao.searchByName(responseBody.getSearchuser().getName());

		
		return new ResponseEntity<SearchUserBody>(HttpStatus.FORBIDDEN);
	}
}
