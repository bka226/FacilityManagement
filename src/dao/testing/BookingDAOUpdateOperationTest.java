package dao.testing;

import java.text.ParseException;

import model.Booking;

import org.testng.Assert;
import org.testng.annotations.Test;

import dao.BookingDAO;
import dao.BookingDAOUpdateOperation;

public class BookingDAOUpdateOperationTest {
  @Test
  public void testPerformingOperationLiteUpdate() throws ParseException {
	  Booking booking = new Booking();
	  booking.setId(1);
	  booking.setStartDate("05/18/2018");
	  booking.setEndDate("05/18/2018");
	  booking.setStartTime(1100);
	  booking.setEndTime(1300);
	  
	  BookingDAOUpdateOperation daoUpdateOperation = new BookingDAOUpdateOperation(booking);
	  Assert.assertTrue(daoUpdateOperation.performOperation(new BookingDAO()));
  }
}
