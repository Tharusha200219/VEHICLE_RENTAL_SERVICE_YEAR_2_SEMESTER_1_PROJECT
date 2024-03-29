package com.letslearn.Modal;

public class Admin {
	private String name;
	private String email;
	private String tel;
	
	
	
	public Admin() {
		super();
	}

	public Admin(String name, String email, String tel) {
		super();
		this.name = name;
		this.email = email;
		this.tel = tel;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	
	
}
