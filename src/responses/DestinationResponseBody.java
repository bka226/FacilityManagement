package responses;

import com.fasterxml.jackson.annotation.JsonView;

import model.Destination;
import view.View;

public class DestinationResponseBody {
	@JsonView(View.Public.class)
	private Destination destination;

	public Destination getDestination() {
		return destination;
	}

	public void setDestination(Destination destination) {
		this.destination = destination;
	}
}
