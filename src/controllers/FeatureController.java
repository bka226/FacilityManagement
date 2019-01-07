package controllers;

import java.util.ArrayList;
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

import responses.FeatureListResponseBody;
import dao.FeatureDAO;
import model.Feature;

@RestController
public class FeatureController {
	FeatureDAO dao = new FeatureDAO();


	@RequestMapping("/featureform")
	public ModelAndView showform(){
		return new ModelAndView("featureform", "command", new Feature());
	}

	@RequestMapping(value = "/savefeature", method = RequestMethod.POST)
	public ModelAndView save(@ModelAttribute("Feature") Feature feature){
		dao.insert(feature);
		return new ModelAndView("redirect:/viewfeature");
	}

	@RequestMapping(value = "/editfeature/savefeatureedit", method = RequestMethod.POST)
	public ModelAndView savefeatureedit(@ModelAttribute("Feature") Feature feature){
		dao.update(feature);
		return new ModelAndView("redirect:/viewfeature");
	}

	@RequestMapping("/viewfeature")
	public ResponseEntity<FeatureListResponseBody> viewFeature(){
		FeatureListResponseBody responseBody = new FeatureListResponseBody();
		
		responseBody.setFeatures(dao.showFeature());
		
		return new ResponseEntity<FeatureListResponseBody>(responseBody, HttpStatus.OK);
	}

	@RequestMapping(value="/editfeature/{id}")
	public ModelAndView editfeature(@PathVariable int id){
		try {
			Feature feature = dao.select(id);
			return new ModelAndView("editfeature", "command", feature);
		}
		catch(EmptyResultDataAccessException e)	{
			ArrayList<String> errorMessages = new ArrayList<>();
			errorMessages.add("Select Failed");
			errorMessages.add("Item not in Database");
			errorMessages.add("viewfeature");
			return new ModelAndView("error", "errorList", errorMessages);
		}
	}
	@RequestMapping(value="/deletefeature/{id}", method=RequestMethod.GET)
	public ModelAndView deletefeature(@PathVariable int id){
		try{
			dao.delete(id);
			return new ModelAndView("redirect:/viewfeature");
		}
		catch(DataIntegrityViolationException e) { 
			ArrayList<String> errorMessages = new ArrayList<>();
			errorMessages.add("Delete Failed");
			errorMessages.add("Other Records Depend on This Item");
			errorMessages.add("viewfeature");
			return new ModelAndView("error", "errorList", errorMessages);
		}
	}
}
