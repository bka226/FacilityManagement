package controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import dao.DestinationDAO;
import dao.EmployeeDAO;
import model.Employee;
import model.ForgetPassword;
import model.Login;

@RestController
public class LoginController {
	EmployeeDAO dao = new EmployeeDAO();
	@RequestMapping("/login")
	public ModelAndView login(HttpServletRequest request)	{
		HttpSession session = request.getSession();
		session.invalidate();
		return new ModelAndView("login", "command", new Login());
	}
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView loginpage(HttpServletRequest request, HttpServletResponse response ){
		ModelAndView log = new ModelAndView("login");
		log.addObject("login", new Login());
		return log;
	}
	
	@RequestMapping(value = "/loginProcess", method = RequestMethod.POST)
	public ModelAndView loginProcess(@RequestParam String email, @RequestParam String password, HttpServletRequest request) {
		Login login = new Login();
		login.setEmail(email);
		login.setPassword(password);
		ModelAndView log = null;
		
		Employee employee = dao.validateLogin(login);
		
		HttpSession session = request.getSession();
				
		if( employee != null){
			session.setAttribute("employee", employee);
			session.setAttribute("Location", employee.getHome());
			session.setAttribute("LocationList", new DestinationDAO().showDestination());
			
				if(employee.getEtype().endsWith("Admin"))
				{
					log = new ModelAndView("redirect:resource/management");
				}
				else
				{
					log = new ModelAndView("redirect:booking");
				}
				return log;
				
		}else{
			log = new ModelAndView("login");
			log.addObject("command",  new Login());
			session.setAttribute("errLoginMessage", "Invalid credentials");
		}
	
		return log;
	}
	
	@RequestMapping(value="/resetpass", method = RequestMethod.POST)
	public ResponseEntity<String> forgotPassword(@RequestBody ForgetPassword forgetPassword){
		Employee employee = new EmployeeDAO().getEmployeeByEmail(forgetPassword.getEmail());
		
		System.out.println(employee.getPassword());
		
		return new ResponseEntity<String>(HttpStatus.OK);
	}
}
