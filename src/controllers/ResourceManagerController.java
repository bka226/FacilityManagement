package controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import model.Room;

@Controller
public class ResourceManagerController {
	@RequestMapping("/resource/management")
	public ModelAndView displayResourceManagement() {
		return new ModelAndView("resourceManager", "command", new Room());
	}
}
