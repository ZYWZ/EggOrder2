package au.usyd.elec5619.service;

import java.util.ArrayList;
import java.util.List;

import au.usyd.elec5619.domain.Comment;

public class SimpleCommentManager implements CommentManager{
	private List<Comment> comments=new ArrayList<Comment>();
	public List<Comment> getComments(){
		return comments;
	}
	public void AddComment(String student_id, String classroom_id,String comment, String score, String post_time) {
		
		Comment comment1 = new Comment();
		comment1.setStudentId(student_id);
		comment1.setClassroomId(classroom_id);
		comment1.setComment(comment);
		comment1.setScore(score);
		comment1.setPostTime(post_time);
		comments.add(comment1);
		
		
	}
	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}
	public void DeleteComment(String student_id, String classroom_id) {
//		Comment comment1 = new Comment();
		for(Comment comment1:comments) {
			if(comment1.getStudentId().equals(student_id)&&comment1.getClassroomId().equals(classroom_id)) {
				comments.remove(comment1);
			}
		}
	}

}
