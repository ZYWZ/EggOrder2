package au.usyd.elec5619.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Id;



@Entity
@Table(name = "AdminMember")
public class Admin {
	@Id
	@Column(name = "admin_id")
	private String admin_id;
	@Column(name = "password")
	private String password;

	
	public String getAdmin() {
		return admin_id;
	}
	public void setAdmin(String admin_id) {
		this.admin_id = admin_id;
	}

	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

}



