package au.usyd.elec5619.domain;

import javax.persistence.Column;

public class Admin {
	@Column(name = "admin")
	private String admin;
	@Column(name = "password")
	private String password;

	
	public String getAdmin() {
		return admin;
	}
	public void setAdmin(String admin) {
		this.admin = admin;
	}

	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

}



