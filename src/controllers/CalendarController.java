package controllers;

import java.sql.Date;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

import model.Booking;
import model.CalendarEvent;
import model.Employee;
import model.Room;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import dao.BookingDAO;
import dao.EmployeeDAO;
import dao.RoomDAO;

@Controller
@RequestMapping("/calendar")
public class CalendarController {
	private BookingDAO bookingDao = new BookingDAO();
	
	private int getMilitaryTimeHourAndMinuteNum(LocalTime time) {
		return time.getHour() * 100 + time.getMinute();
	}
	
	private long getMillisecondsFromCombinedHoursAndMinutes(int hourMinute) {
		final int MINUTES_HOURS = 60;
		final int MILLISECONDS_IN_MINUTE = 60000;
		
		int minutes = hourMinute % 100;
		int hours = hourMinute / 100;
		
		int totalMinutes = minutes;
		totalMinutes += hours * MINUTES_HOURS;
		
		return (long)(totalMinutes * MILLISECONDS_IN_MINUTE);
	}
	
	private int getSecondsOfDayFromEpoch(long epoch) {
		final int MILLISECONDS_IN_SECONDS = 1000;
		final int SECONDS_IN_DAYS = 86400;
		
		return (int)((epoch / MILLISECONDS_IN_SECONDS) % SECONDS_IN_DAYS);
	}
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView displayCalendar() {
		List<CalendarEvent> calEvents = new ArrayList<CalendarEvent>();
		
		List<Booking> bookings = bookingDao.showBooking();
		
		for (Booking booking : bookings) {
			CalendarEvent calEvent = new CalendarEvent();
			calEvent.setId(booking.getId());
			calEvent.setRoom(booking.getRoom().getId());
			calEvent.setStartTime(booking.getStartDate().getTime() + 
					getMillisecondsFromCombinedHoursAndMinutes(booking.getStartTime()));
			calEvent.setEndTime(booking.getEndDate().getTime() + 
					getMillisecondsFromCombinedHoursAndMinutes(booking.getEndTime()));
			
			calEvents.add(calEvent);
		}
		
		return new ModelAndView("calendar", "calEventList", calEvents);
	}
	
	@RequestMapping(value = "/save", consumes="application/json", method = RequestMethod.POST)
	@ResponseBody
	public String saveCalendar(@RequestBody String json) {
		CalendarEvent calEvent = new CalendarEvent();
		Gson gson = new Gson();
		
		calEvent = gson.fromJson(json, CalendarEvent.class);
		
		Date startDate = new Date(calEvent.getStartTime());
		LocalTime startTime = LocalTime.ofSecondOfDay(getSecondsOfDayFromEpoch(calEvent.getStartTime()));
		
		Date endDate = new Date(calEvent.getEndTime());
		LocalTime endTime = LocalTime.ofSecondOfDay(getSecondsOfDayFromEpoch(calEvent.getEndTime()));
		
		EmployeeDAO employeeDao = new EmployeeDAO();
		Employee employee = employeeDao.select(1);
		
		RoomDAO roomDao = new RoomDAO();
		Room room = roomDao.select(calEvent.getRoom());
		
		bookingDao = new BookingDAO();
		Booking booking = new Booking();
		booking.setEmployee(employee);
		booking.setRoom(room);
		booking.setStartDate(startDate);
		booking.setEndDate(endDate);
		booking.setStartTime(getMilitaryTimeHourAndMinuteNum(startTime));
		booking.setEndTime(getMilitaryTimeHourAndMinuteNum(endTime));
		
		if (bookingDao.insert(booking)) {
			return "success";
		}
		
		return "error";
	}
}
