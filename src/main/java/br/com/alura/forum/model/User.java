package br.com.alura.forum.model;

import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class User {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	private String name;

	private String password;
	
	@Column(nullable = false, unique = true)
	private String email;

	/**
	 * @deprecated
	 */
	public User() {	}
	
	public User(String name, String email, String password) {
		this.name = name;
		this.email = email;
		this.password = password;
	}
	
	public Long getId() {
		return this.id;
	}

	public String getName() {
		return name;
	}

	public String getEmail() {
		return this.email;
	}
	
	public String getPassword() {
		return this.password;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (o == null || getClass() != o.getClass()) return false;
		User user = (User) o;
		return Objects.equals(email, user.email);
	}

	@Override
	public int hashCode() {
		return Objects.hash(email);
	}
}
