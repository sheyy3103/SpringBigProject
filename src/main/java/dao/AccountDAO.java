package dao;

import entities.Account;

public interface AccountDAO {
	public Account get(String username);
}
