package dao.impl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.StoryDAO;
import entities.Category;
import entities.Story;

@Repository
public class StoryDAOImpl implements StoryDAO {

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public List<Story> getAll() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		List result = new ArrayList<>();
		result = session.createQuery("from Story order by storyId asc").getResultList();
		return result;
	}

	@Override
	public void insert(Story obj) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		session.save(obj);
		session.getTransaction().commit();
	}

	@Override
	public Story getByID(String id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		Story obj = session.get(Story.class, id);
		session.getTransaction().commit();
		return obj;
	}

	@Override
	public void update(Story obj) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		session.update(obj);
		session.getTransaction().commit();
	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		Story obj = session.get(Story.class, id);
		session.remove(obj);
		session.getTransaction().commit();
	}

	@Override
	public List<Story> searchByName(String name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Story> paging(int page, int size) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		Query query = session.createQuery("from Story order by storyName asc");
		query.setFirstResult(page);
		query.setMaxResults(size);
		List result = query.getResultList();
		session.getTransaction().commit();
		return result;
	}

	@Override
	public List<Story> pagingSearch(String name, int page, int size) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		Query query = session.createQuery("from Story where storyName like :name order by storyName asc");
		query.setParameter("name", "%" + name + "%");
		query.setFirstResult(page);
		query.setMaxResults(size);
		List result = query.getResultList();
		session.getTransaction().commit();
		return result;
	}

	@Override
	public int count() {
		// TODO Auto-generated method stub
		int count = 0;
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		count = session.createQuery("from Story").list().size();
		session.getTransaction().commit();
		return count;
	}

	public int countSearch(String name) {
		// TODO Auto-generated method stub
		int count = 0;
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		count = session.createQuery("from Story where storyName like :name").setParameter("name", "%" + name + "%").list().size();
		session.getTransaction().commit();
		return count;
	}

	@Override
	public List<Story> getByCategory(String id) {
		// TODO Auto-generated method stub
		List result;
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		result = session.createQuery("from Story where categoryId = :id").setParameter("id", id).getResultList();
		session.getTransaction().commit();
		return result;
	}

	@Override
	public List<Story> getByStatus(int stt) {
		// TODO Auto-generated method stub
		List result;
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		result = session.createQuery("from Story where status = :stt").setParameter("stt", stt).getResultList();
		session.getTransaction().commit();
		return result;
	}

}
