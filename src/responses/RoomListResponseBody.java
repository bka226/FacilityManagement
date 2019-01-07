package responses;

import java.util.List;
import model.Room;
import view.View;

import com.fasterxml.jackson.annotation.JsonView;

public class RoomListResponseBody implements ResponseBody {
	@JsonView(View.Public.class)
	private List<Room> rooms;
	
	public List<Room> getRooms() {
		return rooms;
	}
	
	public void setRooms(List<Room> rooms) {
		this.rooms = rooms;
	}
}
