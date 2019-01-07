package mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import dao.EmployeeDAO;
import dao.RoomDAO;
import model.Booking;

public class BookingMapper implements RowMapper<Booking> {
	
	@Override
	public Booking mapRow(ResultSet rs, int i) throws SQLException {
		Booking b = new Booking();
		b.setId(rs.getInt(1));
		b.setEmployee(new EmployeeDAO().select(rs.getInt(2)));
		b.setRoom(new RoomDAO().select(rs.getInt(3)));
		b.setStartDate(rs.getDate(4));
		b.setEndDate(rs.getDate(5));
		b.setStartTime(rs.getInt(6));
		b.setEndTime(rs.getInt(7));
		return b;
	}

}
