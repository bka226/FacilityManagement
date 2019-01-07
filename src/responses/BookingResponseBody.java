package responses;

import model.Booking;
import view.View;

import com.fasterxml.jackson.annotation.JsonView;

public class BookingResponseBody implements ResponseBody {
	@JsonView(View.Public.class)
	private Booking booking;

	public Booking getBooking() {
		return booking;
	}

	public void setBooking(Booking booking) {
		this.booking = booking;
	}
}
