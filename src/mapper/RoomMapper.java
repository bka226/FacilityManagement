package mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import dao.DestinationDAO;
import dao.RoomFeatureDAO;
import dao.RoomTypeDAO;
import model.Room;

public class RoomMapper implements RowMapper<Room> {

	@Override
	public Room mapRow(ResultSet rs, int i) throws SQLException {
		Room r = new Room();
		r.setId(rs.getInt(1));
		r.setRoomType(new RoomTypeDAO().select(rs.getInt(2)));
		r.setLocation(new DestinationDAO().select(rs.getInt(3)));
		r.setSuperRoom(rs.getInt(4) != 0);
		r.setCapacity(rs.getInt(5));
		r.setName(rs.getString(6));
		r.setFeatures(new RoomFeatureDAO().featuresInRoom(r.getId()));
		return r;
	}

}
