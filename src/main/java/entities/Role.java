package entities;

import java.util.Set;

import javax.persistence.Column;

import javax.persistence.Entity;

import javax.persistence.GeneratedValue;

import javax.persistence.GenerationType;

import javax.persistence.Id;

import javax.persistence.OneToMany;

import javax.persistence.Table;

@Entity

@Table(name = "roles")

public class Role {
	@Id
	@Column(name = "roleid")
	private String roleId;
	@Column(name = "rolename")
	private String roleName;
	@OneToMany(mappedBy = "role")
	private Set<AccountRole> accountRoles;

	public Role() {
		// TODO Auto-generated constructor stub
	}

	public String getId() {
		return roleId;
	}

	public void setId(String roleId) {
		this.roleId = roleId;
	}

	public String getRoleName() {
		return roleName;

	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public Set<AccountRole> getAccountroles() {
		return accountRoles;
	}

	public void setAccountroles(Set<AccountRole> accountRoles) {
		this.accountRoles = accountRoles;
	}

}
