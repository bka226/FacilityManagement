package mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import model.RoomType;

public class RoomTypeMapper implements RowMapper<RoomType> {

	@Override
	public RoomType mapRow(ResultSet rs, int i) throws SQLException {
		RoomType rt = new RoomType();
		rt.setId(rs.getInt(1));
		rt.setRtype(rs.getString(2));
		rt.setImageFilePath(rs.getString(3));
		return rt;
	}

}
