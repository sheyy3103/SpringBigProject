package dao.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.AccountDAO;
import entities.Account;

@Repository
public class AccountDAOImpl implements AccountDAO {
	@Autowired
	private SessionFactory sessionFactory;
	//lấy tài khoản người dùng trong db theo username
	@Override
	public Account get(String username) {
		Session session = sessionFactory.openSession();
		try {
			Account account = (Account) session.createQuery("from Account where username = :username").setParameter("username", username).uniqueResult();
			return account;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return null;
	}
}
