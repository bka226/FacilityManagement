package dao;

import model.Booking;

public class BookingDAOInsertOperation implements DAOOperations<BookingDAO> {
	private Booking booking;
	
	public BookingDAOInsertOperation(Booking booking) {
		this.booking = booking;
	}
	
	@Override
	public boolean performOperation(BookingDAO dao) {
		return dao.insert(booking);
	}

}
