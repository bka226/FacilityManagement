package controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dao.DestinationDAO;
import dao.EmployeeDAO;
import model.Employee;
import model.EmployeeInfoWithDestination;
import responses.DestinationListResponseBody;

@Controller
public class RegisterController {
	EmployeeDAO dao = new EmployeeDAO();
	

	@RequestMapping("/register")
	public ModelAndView register(){
		return new ModelAndView("register", "command", new EmployeeInfoWithDestination());
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public ModelAndView registerpage(HttpServletRequest request, HttpServletResponse response){
		ModelAndView log = new ModelAndView("register");
		log.addObject("employee", new Employee());
		return log;
	}

	@RequestMapping(value = "/registerProcess", method = RequestMethod.POST)
	public ModelAndView registerProcess(@ModelAttribute("employeeInfo") EmployeeInfoWithDestination employeeInfo) {
		Employee employee = new Employee();
		employee.setName(employeeInfo.getName());
		employee.setEmail(employeeInfo.getEmail());
		employee.setPhone(employeeInfo.getPhone());
		employee.setPassword(employeeInfo.getPassword());
		employee.setHome(new DestinationDAO().select(employeeInfo.getHomeDestinationId()));
		employee.setEtype("User");

		dao.insert(employee);
		return new ModelAndView("login", "command", new Employee());
	}
}
