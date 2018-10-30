package au.usyd.elec5619.service;

import java.io.Serializable;
import java.util.List;

import au.usyd.elec5619.domain.Comment;

public interface CommentManager extends Serializable{
	public void AddComment(String student_id, String classroom_id,String comment,String score,String post_time);
	public List<Comment> getComments();
	public void setComments(List<Comment> comments);
	public void DeleteComment(String student_id, String classroom_id);

}
