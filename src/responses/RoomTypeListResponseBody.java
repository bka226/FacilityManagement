package responses;

import java.util.List;

import view.View;

import com.fasterxml.jackson.annotation.JsonView;

import model.RoomType;

public class RoomTypeListResponseBody implements ResponseBody {
	@JsonView(View.Public.class)
	private List<RoomType> roomTypes;

	public List<RoomType> getRoomTypes() {
		return roomTypes;
	}

	public void setRoomTypes(List<RoomType> roomTypes) {
		this.roomTypes = roomTypes;
	}
}
