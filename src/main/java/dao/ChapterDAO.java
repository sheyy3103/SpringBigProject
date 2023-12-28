package dao;

import java.util.List;

import entities.Chapter;

public interface ChapterDAO {
	public List<Chapter> getAll();

	public void insert(Chapter obj);

	public List<Chapter> getByStory(String storyId);

	public Chapter getById(String id);
	
	public Chapter getByChapterNo(String storyId, float chapterNo);

	public float max(String storyId);

	public float min(String storyId);

	public void delete(String id);

}
