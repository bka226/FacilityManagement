package model;

public interface User {
	
	void register(Employee employee);
	
	Employee validateLogin(Login login);
}
