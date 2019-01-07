package controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dao.DestinationDAO;
import dao.EmployeeDAO;
import model.Employee;

@Controller
public class EmployeeController {

	//@Autowired
	EmployeeDAO dao = new EmployeeDAO();


	@RequestMapping("/employeeform")
	public ModelAndView showform(){
		return new ModelAndView("employeeform", "command", new Employee());
	}

	@RequestMapping(value = "/saveemployee", method = RequestMethod.POST)
	public ModelAndView save(@ModelAttribute("Employee") Employee employee){
		try {
			dao.liteInsert(employee);
			return new ModelAndView("redirect:/viewemployee");
		}
		catch(DataIntegrityViolationException e) { 
			String[] errorMessages = {
					"Insert Failed",
					"An Employee Record With This ID Already Exists",
					"viewemployee"
			};
			return new ModelAndView("error", "errorList", errorMessages);
		}
	}

	@RequestMapping(value = "/editemployee/saveemployeeedit", method = RequestMethod.POST)
	public ModelAndView saveemployeeedit(@ModelAttribute("Employee") Employee employee){
		dao.liteUpdate(employee);
		return new ModelAndView("redirect:/viewemployee");
	}

	@RequestMapping(value = "/changeemployeehome/saveemployeehome/{id}")
	public ModelAndView savelocation(@PathVariable int id, @RequestParam int did) {
		dao.update(dao.select(id), "home", did);
		return new ModelAndView("redirect:/viewemployee");
	}

	@RequestMapping(value = "/changeemployeehome/{id}")
	public ModelAndView changelocation(@PathVariable int id) {
		try {
			dao.select(id);
			Object[] obj = new Object[3];
			obj[0] = id;
			obj[1] = new DestinationDAO().showDestination();
			obj[2] = "saveemployeehome";
			return new ModelAndView("selectlocation", "obj", obj);
		}
		catch(EmptyResultDataAccessException e)	{
			String[] errorMessages = {
					"Select Failed",
					"Item not in Database",
					"viewemployee"
			};
			return new ModelAndView("error", "errorList", errorMessages);
		}
	}

	@RequestMapping("/viewemployee")
	public ModelAndView viewEmployee(){
		List<Employee> list;
		list = dao.showEmployee();
		return new ModelAndView("viewemployee", "elist", list);
	}

	@RequestMapping(value="/editemployee/{id}")
	public ModelAndView editemployee(@PathVariable int id){
		try {
			Employee employee = dao.select(id);
			return new ModelAndView("editemployee", "command", employee);
		}
		catch(EmptyResultDataAccessException e)	{
			ArrayList<String> errorMessages = new ArrayList<>();
			errorMessages.add("Select Failed");
			errorMessages.add("Item not in Database");
			errorMessages.add("viewemployee");
			return new ModelAndView("error", "errorList", errorMessages);
		}
	}

	@RequestMapping(value="/deleteemployee/{id}", method=RequestMethod.GET)
	public ModelAndView deleteemployee(@PathVariable int id){
		try {
			dao.delete(id);
			return new ModelAndView("redirect:/viewemployee");
		}
		catch(DataIntegrityViolationException e) { 
			String[] errorMessages = {
					"Select Failed",
					"Item not in Database",
					"viewemployee"
			};
			return new ModelAndView("error", "errorList", errorMessages);
		}
	}
}
