package dao;

import model.Booking;

public class BookingDAOUpdateOperation implements DAOOperations<BookingDAO> {
	private Booking booking;
	
	public BookingDAOUpdateOperation(Booking booking) {
		this.booking = booking;
	}

	@Override
	public boolean performOperation(BookingDAO dao) {
		return dao.liteUpdate(booking);
	}
}
