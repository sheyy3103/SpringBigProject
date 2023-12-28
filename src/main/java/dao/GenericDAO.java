package dao;

import java.util.List;

public interface GenericDAO<T,K> {
	public List<T> getAll();
	public void insert(T obj);
	public T getByID(K id);
	public void update(T obj);
	public void delete(K id);
	public List<T> searchByName(String name);
}
