package responses;

import java.util.List;

import org.apache.catalina.mapper.Mapper;

import model.Destination;
import view.View;

import com.fasterxml.jackson.annotation.JsonView;


public class DestinationListResponseBody {
	@JsonView(View.Public.class)
	private List<Destination> destinations;

	public List<Destination> getDestinations() {
		return destinations;
	}

	public void setDestinations(List<Destination> destinations) {
		this.destinations = destinations;
	}
}
