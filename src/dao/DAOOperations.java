package dao;

public interface DAOOperations<T> {
	boolean performOperation(T dao);
}
