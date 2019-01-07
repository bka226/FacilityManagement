package mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import dao.FeatureDAO;
import model.RoomFeature;

public class RoomFeatureMapper implements RowMapper<RoomFeature> {

	@Override
	public RoomFeature mapRow(ResultSet rs, int i) throws SQLException {
		RoomFeature rf = new RoomFeature();
		rf.setId(rs.getInt(1));
		rf.setFeature(new FeatureDAO().select(rs.getInt(3)));
		rf.setQuantity(rs.getInt(4));
		return rf;
	}

}
