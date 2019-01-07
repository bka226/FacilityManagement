package dao;

import java.util.List;

import mapper.EmployeeMapper;
import model.Employee;
import model.Login;

public class EmployeeDAO implements DAO<Employee> {

	
	@Override
	public boolean insert(Employee newItem) {
		int id = JTEMP.queryForObject("SELECT EmployeeIdSeq.nextVal FROM DUAL", Integer.class);
		newItem.setId(id);
		return (JTEMP.update("INSERT INTO employee VALUES(?, ?, ?, ?, ?, ?, ?)", newItem.getId(),
				newItem.getHome().getId(), newItem.getPassword(), newItem.getName(),
				newItem.getPhone(), newItem.getEmail(), newItem.getEtype()) > 0);
	}
	public boolean liteInsert(Employee newItem) {
		return (JTEMP.update("INSERT INTO employee VALUES(?, ?, ?, ?, ?, ?, ?)", newItem.getId(),
				0, newItem.getPassword(), newItem.getName(),
				newItem.getPhone(), newItem.getEmail(), "User") > 0);
	}
	
	public Employee searchEmail(String email){
		List<Employee> Employee = JTEMP.query("SELECT * FROM employee where email = ?",new Object[]{ email}, new EmployeeMapper());
				return Employee.size() > 0 ? Employee.get(0) : null;
	}

	public Employee validateLogin(Login login){
		List<Employee> Employee = JTEMP.query("SELECT * FROM employee where email = ? AND password = ?",new Object[]{ login.getEmail(), login.getPassword()}, new EmployeeMapper());
				return Employee.size() > 0 ? Employee.get(0) : null;
	}
	
	@Override
	public boolean update(Employee changedItem) {
		return (JTEMP.update("UPDATE employee SET home = ?, password = ?, name = ?, phone = ?, email = ?, eType = ? WHERE id = ?",
				changedItem.getHome().getId(), changedItem.getPassword(), changedItem.getName(),
				changedItem.getPhone(), changedItem.getEmail(), changedItem.getEtype(), changedItem.getId()) > 0);
	}
	public boolean update(Employee changedItem, String col, int val) {
		return (JTEMP.update("UPDATE employee SET " + col + " = ? WHERE id = ?", val, changedItem.getId()) > 0);
	}
	
	public boolean liteUpdate(Employee changedItem) {
		return (JTEMP.update("UPDATE employee SET password = ?, name = ?, phone = ?, email = ?, eType = ? WHERE id = ?",
				changedItem.getPassword(), changedItem.getName(), changedItem.getPhone(),
				changedItem.getEmail(), changedItem.getEtype(), changedItem.getId()) > 0);
	}
	
	@Override
	public boolean delete(int delTarget) {
		return (JTEMP.update("DELETE FROM employee WHERE id = ?", delTarget) > 0);
	}
	
	@Override
	public Employee select(int selectTarget) {
		return JTEMP.queryForObject("SELECT * FROM employee WHERE id = ?", new Object[] {selectTarget}, new EmployeeMapper());
	}

	public List<Employee> showEmployee(){
		return JTEMP.query("select * from employee", new EmployeeMapper());
	}

	public List<Employee> employeesAtLocation(int did){
		return JTEMP.query("SELECT * FROM employee WHERE home = ?", new Object[] {did}, new EmployeeMapper());
	}
	
	public List<Employee> searchByName(String name){
		return JTEMP.query("SELECT * FROM employee WHERE name = ?", new Object[] {name}, new EmployeeMapper());
	}
	
	public Employee getEmployeeByEmail(String email) {
		return JTEMP.queryForObject("SELECT * FROM employee WHERE email = ?", new EmployeeMapper(), email);
	}
}
