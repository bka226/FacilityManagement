package mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import model.Destination;

public class DestinationMapper implements RowMapper<Destination> {

	@Override
	public Destination mapRow(ResultSet rs, int i) throws SQLException {
		Destination d= new Destination();
		d.setId(rs.getInt(1));
		d.setStreet(rs.getString(2));
		d.setCity(rs.getString(3));
		d.setState(rs.getString(4));
		d.setCountry(rs.getString(5));
		return d;
	}

}
