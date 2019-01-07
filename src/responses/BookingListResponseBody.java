package responses;

import java.util.List;

import view.View;
import model.Booking;

import com.fasterxml.jackson.annotation.JsonView;

public class BookingListResponseBody implements ResponseBody {
	@JsonView(View.Public.class)
	private List<Booking> bookings;

	public List<Booking> getBookings() {
		return bookings;
	}

	public void setBookings(List<Booking> bookings) {
		this.bookings = bookings;
	}
}
