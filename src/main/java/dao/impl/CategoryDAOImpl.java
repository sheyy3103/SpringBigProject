package dao.impl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.CategoryDAO;
import entities.Category;

@Repository
public class CategoryDAOImpl implements CategoryDAO {
	@Autowired
	SessionFactory sessionFactory;

	@Override
	public List<Category> getAll() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		List result = new ArrayList<>();
		result = session.createQuery("from Category order by categoryId asc").getResultList();
		return result;
	}

	@Override
	public void insert(Category obj) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		session.save(obj);
		session.getTransaction().commit();
	}

	@Override
	public Category getByID(String id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		Category obj = session.get(Category.class, id);
		session.getTransaction().commit();
		return obj;
	}

	@Override
	public void update(Category obj) {
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
		Category obj = session.get(Category.class, id);
		session.remove(obj);
		session.getTransaction().commit();
	}

	@Override
	public List<Category> searchByName(String name) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		Query query = session.createQuery("from Category where categoryName like :name");
		query.setParameter("name", "%" + name + "%");
		List result = query.getResultList();
		session.getTransaction().commit();
		return result;
	}

}
