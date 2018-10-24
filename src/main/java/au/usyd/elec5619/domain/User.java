package au.usyd.elec5619.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Id;

@Entity
@Table(name = "Student")
public class User {
	@Id
	@Column(name = "student_id")
	private String student_id;
	@Column(name = "fullname")
	private String fullname;
	@Column(name = "password")
	private String password;
	@Column(name = "email")
	private String email;
	@Column(name = "birthdate")
	private String birthdate;
	
	public String getStudentId() {
		return student_id;
	}
	public void setStudentId(String name) {
		this.student_id = name;
	}
	public String getFullName() {
		return fullname;
	}
	public void setFullName(String fullname) {
		this.fullname = fullname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getBiirthdate() {
		return birthdate;
	}
	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
	}
}


