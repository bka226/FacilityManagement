package dao.testing;

import java.text.ParseException;

import model.Booking;
import model.Employee;
import model.Room;

import org.testng.Assert;
import org.testng.annotations.Test;

import dao.BookingDAO;
import dao.BookingDAOInsertOperation;

public class BookingDAOInsertOperationTest {
  @Test
  public void testPerformOperationInsert() throws ParseException {
	  Employee employee = new Employee();
	  employee.setId(0);
	  
	  Room room = new Room();
	  room.setId(0);
	  
	  Booking booking = new Booking();
	  booking.setEmployee(employee);
	  booking.setRoom(room);
	  booking.setStartDate("05/18/2018");
	  booking.setEndDate("05/18/2018");
	  booking.setStartTime(1100);
	  booking.setEndTime(1300);
	  
	  BookingDAOInsertOperation daoUpdateOperation = new BookingDAOInsertOperation(booking);
	  Assert.assertTrue(daoUpdateOperation.performOperation(new BookingDAO()));
  }
}
