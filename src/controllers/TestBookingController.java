package controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller

public class TestBookingController {
	
	@RequestMapping("/booking")
	public  ModelAndView testBookig ()
	{
		
		return new ModelAndView ("booking");
		
		
	}
		@RequestMapping("/BookingHistory")
		public  ModelAndView testBookigHistory ()
		{
			
			return new ModelAndView ("BookingHistory");
		}
		
		@RequestMapping("/bookingCopy")
		
		public  ModelAndView testBooking2 ()
		{
			
			return new ModelAndView ("bookingCopy");
		}
		
		@RequestMapping("/bookingSchedule")
		
		public  ModelAndView testScheduleBooking ()
		{
			
			return new ModelAndView ("bookingSchedule");
		}

		@RequestMapping("/BookingHeader")
		
		public  ModelAndView testbookingheader ()
		{
			
			return new ModelAndView ("BookingHeader");
		}
		
		@RequestMapping("/AllUserBookingSchedule")
		
		public  ModelAndView testAllScheduleBooking ()
		{
			
			return new ModelAndView ("AllUserBookingSchedule");
		}
}