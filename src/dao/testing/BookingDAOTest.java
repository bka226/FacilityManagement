package dao.testing;

import static org.testng.Assert.assertNotNull;
import static org.testng.Assert.assertTrue;

import java.sql.Date;
import java.text.ParseException;
import java.util.GregorianCalendar;

import org.testng.Assert;
import org.testng.annotations.AfterTest;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.DataProvider;
import org.testng.annotations.Test;

import dao.BookingDAO;
import dao.EmployeeDAO;
import dao.RoomDAO;
import model.Booking;
import model.Employee;
import model.Room;

public class BookingDAOTest {
  static BookingDAO bd;
  Booking b;
  Booking conflictBooking;
  static Date bookingDateForConflicts = new Date(new GregorianCalendar(2040, 0, 1).getTimeInMillis());
  static Employee defaultEmployee = new EmployeeDAO().select(0);
  static Room defaultRoom = new RoomDAO().select(0);
  
  @BeforeClass
  public void init() {
	  bd = new BookingDAO();
	  
	  conflictBooking = new Booking();
	  conflictBooking.setEmployee(defaultEmployee);
	  conflictBooking.setRoom(defaultRoom);
	  conflictBooking.setStartDate(bookingDateForConflicts);
	  conflictBooking.setEndDate(bookingDateForConflicts);
	  conflictBooking.setStartTime(900);
	  conflictBooking.setEndTime(1100);
	  
	  bd.insert(conflictBooking);
  }

  @Test(dependsOnMethods = {"update"})
  public void delete() {
    assertTrue(bd.delete(b.getId()));
  }

  @Test(dependsOnMethods = {"select"})
  public void insert() {
    assertTrue(bd.insert(b));
  }

  @Test
  public void select() {
    assertNotNull(b = bd.select(1));
  }

  @Test(dependsOnMethods = {"insert"})
  public void update() throws ParseException {
    b.setStartDate("01/01/2000");
    assertTrue(bd.update(b));
  }
  
  @DataProvider(name="bookingsForConflictChecking")
  public static Object[][] bookingsForConflictChecking() {
	  Booking booking1 = new Booking();
	  booking1.setEmployee(defaultEmployee);
	  booking1.setRoom(defaultRoom);
	  booking1.setStartDate(bookingDateForConflicts);
	  booking1.setEndDate(bookingDateForConflicts);
	  booking1.setStartTime(700);
	  booking1.setEndTime(900);
	  
	  Booking booking2 = new Booking();
	  booking2.setEmployee(defaultEmployee);
	  booking2.setRoom(defaultRoom);
	  booking2.setStartDate(bookingDateForConflicts);
	  booking2.setEndDate(bookingDateForConflicts);
	  booking2.setStartTime(900);
	  booking2.setEndTime(1100);
	  
	  Booking booking3 = new Booking();
	  booking3.setEmployee(defaultEmployee);
	  booking3.setRoom(defaultRoom);
	  booking3.setStartDate(bookingDateForConflicts);
	  booking3.setEndDate(bookingDateForConflicts);
	  booking3.setStartTime(930);
	  booking3.setEndTime(1130);
	  
	  Booking booking4 = new Booking();
	  booking4.setEmployee(defaultEmployee);
	  booking4.setRoom(defaultRoom);
	  booking4.setStartDate(bookingDateForConflicts);
	  booking4.setEndDate(bookingDateForConflicts);
	  booking4.setStartTime(900);
	  booking4.setEndTime(1000);

	  Booking booking5 = new Booking();
	  booking5.setEmployee(defaultEmployee);
	  booking5.setRoom(defaultRoom);
	  booking5.setStartDate(bookingDateForConflicts);
	  booking5.setEndDate(bookingDateForConflicts);
	  booking5.setStartTime(1000);
	  booking5.setEndTime(1100);
	  
	  Booking booking6 = new Booking();
	  booking6.setEmployee(defaultEmployee);
	  booking6.setRoom(defaultRoom);
	  booking6.setStartDate(bookingDateForConflicts);
	  booking6.setEndDate(bookingDateForConflicts);
	  booking6.setStartTime(1100);
	  booking6.setEndTime(1300);
	  
	  Booking booking7 = new Booking();
	  booking7.setEmployee(defaultEmployee);
	  booking7.setRoom(defaultRoom);
	  booking7.setStartDate(bookingDateForConflicts);
	  booking7.setEndDate(bookingDateForConflicts);
	  booking7.setStartTime(1500);
	  booking7.setEndTime(1600);
	  
	  Booking booking8 = new Booking();
	  booking8.setEmployee(defaultEmployee);
	  booking8.setRoom(new RoomDAO().select(2));
	  booking8.setStartDate(bookingDateForConflicts);
	  booking8.setEndDate(bookingDateForConflicts);
	  booking8.setStartTime(900);
	  booking8.setEndTime(1100);

	  return new Object[][] {
			  { booking1, false },
			  { booking2, true },
			  { booking3, true },
			  { booking4, true },
			  { booking5, true },
			  { booking6, false },
			  { booking7, false },
			  { booking8, false }
	  };
  }
  
  @Test(dataProvider="bookingsForConflictChecking")
  public void checkConflicts(Booking booking, Boolean expectedResult) {
	  Assert.assertEquals(bd.hasScheduleConflict(booking), expectedResult.booleanValue());
	  bd.delete(booking.getId());
  }
  
  @Test
  public void getEmployeeBookingsForAParticularRoom() {
	  Date startDate = new Date(new GregorianCalendar(2018, 4, 13).getTimeInMillis());
	  Date endDate = new Date(new GregorianCalendar(2018, 4, 19).getTimeInMillis());
	  
	  Assert.assertNotNull(bd.getEmployeeBookingsForRoomAtSpecificDateRange(0, 0, startDate, endDate));
  }
  
  @AfterTest()
  public void cleanup() {
	  bd.delete(conflictBooking.getId());
  }
}
