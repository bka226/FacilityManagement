package responses;

import model.Room;
import view.View;

import com.fasterxml.jackson.annotation.JsonView;

public class RoomResponseBody implements ResponseBody {
	@JsonView(View.Public.class)
	private Room room;

	public Room getRoom() {
		return room;
	}

	public void setRoom(Room room) {
		this.room = room;
	}
}
