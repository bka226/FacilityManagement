package dao;

import org.springframework.jdbc.core.JdbcTemplate;

//all DAOs can use the same JdbcTemplate
public interface DAO<T> extends projectInterface.Context{
	JdbcTemplate JTEMP = (JdbcTemplate)CONTEXT.getBean("jtemp");
	public boolean insert(T newItem);
	public boolean update(T changedItem);
	public boolean delete(int delTarget);
	public T select(int selectTarget);
}
