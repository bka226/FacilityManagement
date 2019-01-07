package mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import model.Feature;

public class FeatureMapper implements RowMapper<Feature> {

	@Override
	public Feature mapRow(ResultSet rs, int i) throws SQLException {
		Feature f = new Feature();
		f.setId(rs.getInt(1));
		f.setName(rs.getString(2));
		f.setImageFilePath(rs.getString(3));
		return f;
	}

}
