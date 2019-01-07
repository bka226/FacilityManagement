package services.email.testing;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import model.Booking;
import model.Employee;
import model.Room;

import org.testng.Assert;
import org.testng.annotations.Test;

import services.email.SynbookEmailSender;

public class SynbookEmailSenderTest {
	private String fromEmail = "nathan_kline@syntelinc.com";
	
	@Test
	public void testSendEmailWithBookingInfo() throws ParseException {
		SynbookEmailSender sender = new SynbookEmailSender();
		sender.setFrom(fromEmail);
		
		Employee employee = new Employee();
		employee.setEmail(fromEmail);

		Room room = new Room();
		room.setName("Scrum Room 1");

		Booking booking = new Booking();
		booking.setId(5000);
		booking.setEmployee(employee);
		booking.setRoom(room);
		booking.setStartDate("05/16/2018");
		booking.setEndDate("05/16/2018");
		booking.setStartTime(1300);
		booking.setEndTime(1500);

		List<String> recipients = new ArrayList<String>();
		recipients.add(employee.getEmail());

		Assert.assertTrue(sender.sendEmail(recipients, booking));
	}
}
