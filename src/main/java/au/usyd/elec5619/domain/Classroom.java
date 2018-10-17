package au.usyd.elec5619.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Classroom")
public class Classroom {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="classroom_id")
	private int classroomId;
	
	@Column(name="classroom_name")
	private String classroomName;
	
	@Column(name="classroom_size")
	private String classroomSize;

	@Column(name="location")
	private String location;

	@Column(name="address")
	private String address;

	public int getClassroomId() {
		return classroomId;
	}

	public void setClassroomId(int classroomId) {
		this.classroomId = classroomId;
	}

	public String getClassroomName() {
		return classroomName;
	}

	public void setClassroomName(String classroomName) {
		this.classroomName = classroomName;
	}

	public String getClassroomSize() {
		return classroomSize;
	}

	public void setClassroomSize(String classroomSize) {
		this.classroomSize = classroomSize;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	
}
