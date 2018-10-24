package au.usyd.elec5619.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Id;
@Entity
@Table(name = "Rating")
public class Comment {
	@Id
	@Column(name = "student_id")
	private String student_id;
	@Column(name = "classroom_id")
	private String classroom_id;
	@Column(name = "comment")
	private String comment;
	@Column(name = "score")
	private String score;
	@Column(name = "post_time")
	private String post_time;

	public String getStudentId() {
		return student_id;
	}

	public void setStudentId(String student_id) {
		this.student_id = student_id;
	}

	public String getClassroomId() {
		return classroom_id;
	}

	public void setClassroomId(String classroom_id) {
		this.classroom_id = classroom_id;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getScore() {
		return score;
	}

	public void setScore(String score) {
		this.score = score;
	}
	public String getPostTime() {
		return post_time;
	}

	public void setPostTime(String post_time) {
		this.post_time = post_time;
	}
}
