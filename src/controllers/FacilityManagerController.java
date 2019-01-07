package controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import model.Destination;

@Controller
public class FacilityManagerController {
	@RequestMapping("/facility/management")
	public ModelAndView displayResourceManagement() {
		return new ModelAndView("facilityManager", "command", new Destination());
	}
}
