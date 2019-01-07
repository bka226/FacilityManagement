package services.email;

import java.util.List;

import model.Booking;

public class SynbookEmailSender extends SyntelEmailSender {
	public boolean sendEmail(List<String> recipients, Booking booking) {
		String roomName = booking.getRoom().getName();
		StringBuilder bodyMessage = new StringBuilder();
		
		bodyMessage.append("Your scheduled for " + booking.getRoom().getName());
		bodyMessage.append(" at " + booking.getStartDate() + " to " + booking.getEndDate());
		bodyMessage.append(" from " + booking.getStartTime() + " to " + booking.getEndTime());
		
		return super.sendEmail(recipients, roomName + " Confirmation", bodyMessage.toString());
	}
}
