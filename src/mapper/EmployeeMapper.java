package mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import dao.DestinationDAO;
import model.Employee;

public class EmployeeMapper implements RowMapper<Employee> {

	@Override
	public Employee mapRow(ResultSet rs, int i) throws SQLException {
		Employee emp = new Employee();
		emp.setId(rs.getInt(1));
		emp.setHome(new DestinationDAO().select(rs.getInt(2)));
		emp.setPassword(rs.getString(3));
		emp.setName(rs.getString(4));
		emp.setPhone(rs.getString(5));
		emp.setEmail(rs.getString(6));
		emp.setEtype(rs.getString(7));
		return emp;
	}

}
