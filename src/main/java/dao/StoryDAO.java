package dao;

import java.util.List;

import entities.Story;

public interface StoryDAO extends GenericDAO<Story, String> {
	public List<Story> paging(int page, int size);
	public List<Story> pagingSearch(String name, int page, int size);
	public int count();
	public int countSearch(String name);
	public List<Story> getByCategory(String id);
	public List<Story> getByStatus(int stt);
}
