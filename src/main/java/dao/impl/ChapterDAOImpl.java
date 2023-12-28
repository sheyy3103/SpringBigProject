package dao.impl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.ChapterDAO;
import entities.Chapter;
import entities.Story;

@Repository
public class ChapterDAOImpl implements ChapterDAO {
	@Autowired
	SessionFactory sessionFactory;

	@Override
	public List<Chapter> getAll() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		List result = new ArrayList<>();
		result = session.createQuery("from Chapter order by storyId asc").getResultList();
		return result;
	}

	@Override
	public void insert(Chapter obj) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		session.save(obj);
		session.getTransaction().commit();
	}

	@Override
	public List<Chapter> getByStory(String storyId) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		List result = new ArrayList<>();
		Query query = session.createQuery("from Chapter where storyId = :storyId order by chapterNo desc");
		query.setParameter("storyId", storyId);
		result = query.getResultList();
		session.getTransaction().commit();
		return result;
	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		Chapter obj = session.get(Chapter.class, id);
		session.remove(obj);
		session.getTransaction().commit();
	}

	@Override
	public Chapter getById(String id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		Chapter obj = session.get(Chapter.class, id);
		session.getTransaction().commit();
		return obj;
	}

	@Override
	public float max(String storyId) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		List result = new ArrayList<>();
		Query query = session.createQuery("from Chapter where storyId = :storyId order by chapterNo desc").setFirstResult(0).setMaxResults(1);
		query.setParameter("storyId", storyId);
		result = query.getResultList();
		session.getTransaction().commit();
		Chapter chapter = (Chapter) result.get(0);
		float max = chapter.getChapterNo();
		return max;
	}

	@Override
	public float min(String storyId) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		List result = new ArrayList<>();
		Query query = session.createQuery("from Chapter where storyId = :storyId order by chapterNo asc").setFirstResult(0).setMaxResults(1);
		query.setParameter("storyId", storyId);
		result = query.getResultList();
		session.getTransaction().commit();
		Chapter chapter = (Chapter) result.get(0);
		float min = chapter.getChapterNo();
		return min;
	}

	@Override
	public Chapter getByChapterNo(String storyId, float chapterNo) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		List result = new ArrayList<>();
		Query query = session.createQuery("from Chapter where storyId = :storyId and chapterNo = :chapterNo");
		query.setParameter("storyId", storyId);
		query.setParameter("chapterNo", chapterNo);
		result = query.getResultList();
		session.getTransaction().commit();
		Chapter chapter = (Chapter) result.get(0);
		return chapter;
	}
}
