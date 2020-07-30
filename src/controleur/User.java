package controleur;

import java.util.Date;

import javax.management.relation.Relation;

public class User {
	
	private int id, actif;
    private String email, roles, password, api_token;
    
	public User(int id, String email, String roles, String password, String api_token, int actif) {
		this.id = id;
		this.email = email;
		this.roles = roles;
		this.password = password;
		this.api_token = api_token;
		this.actif = actif;
	}

	public int getActif() {
		return actif;
	}

	public void setActif(int actif) {
		this.actif = actif;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRoles() {
		return roles;
	}

	public void setRoles(String roles) {
		this.roles = roles;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getApi_token() {
		return api_token;
	}

	public void setApi_token(String api_token) {
		this.api_token = api_token;
	}
    
    

}
