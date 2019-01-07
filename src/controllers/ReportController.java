package controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dao.BookingDAO;
import dao.BookingDAO.TotalBookings;



@Controller
public class ReportController {
	
	BookingDAO bdao = new BookingDAO();
	
	@RequestMapping(value = "/Reports/{month}_{location}", method = RequestMethod.GET)
    public ModelAndView  getMonthlyReport(@PathVariable String month, @PathVariable int location, HttpServletRequest request) {

		Integer scrumBookings = bdao.getMonthlyReport(1, month, location);
		Integer conf1Bookings = bdao.getMonthlyReport(2, month,location);
		Integer conf2Bookings = bdao.getMonthlyReport(3, month,location);
		Integer trBookings = bdao.getMonthlyReport(4, month, location);
		Integer recBookings = bdao.getMonthlyReport(5, month, location);
		
		HttpSession session = request.getSession();
		session.setAttribute("Month", month);    
		List<Integer> list = new ArrayList<Integer>();
        list.add(scrumBookings);
        list.add(conf1Bookings);
        list.add(conf2Bookings);
        list.add(trBookings);
        list.add(recBookings);
        
        return new ModelAndView("Reports","list",list); 
    }
	
	@RequestMapping(value="Reports/PieChart",method = RequestMethod.POST)
	public ModelAndView getAllLocationReport(@RequestParam int location, @RequestParam String month){
		List<TotalBookings> list = bdao.getAllMonthlyLocationReports(location, month);
		
		return new ModelAndView("PieChart", "list", list);
	}

	
	@RequestMapping("/ReportDashboard")
	public String temp() {
		

		return"ReportDashboard";

	}	
	
	@RequestMapping("/HeaderAndFooter")
	public String temp1() {
		
		return"HeaderAndFooter";

	}	


}
