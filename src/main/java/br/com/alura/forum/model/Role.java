package br.com.alura.forum.model;

import java.util.Objects;

import javax.persistence.Entity;
import javax.persistence.Id;

import org.springframework.security.core.GrantedAuthority;

@Entity
public class Role implements GrantedAuthority {

	private static final long serialVersionUID = 1L;
	
	public static final Role ROLE_ADMIN = new Role("ROLE_ADMIN");
	public static final Role ROLE_ALUNO = new Role("ROLE_ADMIN");
	
	@Id
	private String authority;
	
	/**
	 * @deprecated
	 */
	public Role() {}
	
	public Role(String authority) {
		this.authority = authority;
	}
	
	@Override
	public String getAuthority() {
		return this.authority;
	}
	
	@Override
	public boolean equals(Object o) {
		if(this == o) return true;
		if(o == null || getClass() != o.getClass()) return false;
		Role role = (Role) o;
		return Objects.equals(authority, role.authority);
	}

}
