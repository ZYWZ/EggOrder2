package au.usyd.elec5619.domain;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Entity;
import javax.persistence.Table;


@Entity
@Table(name = "Student")
public class User {
	@Id
	@Column(name = "student_id")
	private String student_id;
	@Column(name = "full_name")
	private String full_name;
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
		return full_name;
	}
	public void setFullName(String fullname) {
		this.full_name = fullname;
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


