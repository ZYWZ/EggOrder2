package au.usyd.elec5619.service;

import java.util.ArrayList;
import java.util.List;

import au.usyd.elec5619.domain.Comment;
import junit.framework.TestCase;

public class SimpleCommentManagerTest extends TestCase {
private SimpleCommentManager commentManager;
private List<Comment> comments;
private static int comment_count = 2;
private static String student_id1 =  "001";
private static String classroom_id1 ="111";
private static String comment1 = "asd";
private static String score1 = "3";
private static String post_time1 = "2018-10-10 12:00:00";

private static String student_id2 = "002";
private static String classroom_id2 = "222";
private static String comment2 = "qwe";
private static String score2 = "4";
private static String post_time2 = "2018-09-10 22:00:00";
protected void setUp() throws Exception {
	commentManager =new SimpleCommentManager();
	comments =new ArrayList<Comment>();
	
	Comment comment = new Comment();
	comment.setStudentId("001");
	comment.setClassroomId("111");
	comment.setComment("asd");
	comment.setScore("3");
	comment.setPostTime("2018-10-10 12:00:00");
	comments.add(comment);
	
	comment = new Comment();
	comment.setStudentId("002");
	comment.setClassroomId("222");
	comment.setComment("qwe");
	comment.setScore("4");
	comment.setPostTime("2018-09-10 22:00:00");
	comments.add(comment);
	
	commentManager.setComments(comments);
}
//public void testGetCommentsWithNoComments() {
//	commentManager = new SimpleCommentManager();
//	assertNull(commentManager.getComments());
//}
public void testGetComments() {
	List<Comment> comments = commentManager.getComments();
	assertNotNull(comments);
	assertEquals(comment_count, commentManager.getComments().size());
	
	Comment comment = comments.get(0);
	assertEquals(student_id1,comment.getStudentId());
	assertEquals(classroom_id1,comment.getClassroomId());
	assertEquals(comment1,comment.getComment());
	assertEquals(score1,comment.getScore());
	assertEquals(post_time1,comment.getPostTime());
	
	
	comment = comments.get(1);
	assertEquals(student_id2,comment.getStudentId());
	assertEquals(classroom_id2,comment.getClassroomId());
	assertEquals(comment2,comment.getComment());
	assertEquals(score2,comment.getScore());
	assertEquals(post_time2,comment.getPostTime());
}
public void testAddComments() {
	commentManager.AddComment("003","333","zxc","5","2018-9-11 13:00:00");
	commentManager.setComments(comments);
	String student_id3="003";
	String classroom_id3="333";
	String comment3="zxc";
	String score3="5";
	String post_time3="2018-9-11 13:00:00";
	Comment comment = comments.get(2);
	assertEquals(student_id3,comment.getStudentId());
	assertEquals(classroom_id3,comment.getClassroomId());
	assertEquals(comment3,comment.getComment());
	assertEquals(score3,comment.getScore());
	assertEquals(post_time3,comment.getPostTime());
}
public void testDeleteComment(){
	commentManager.DeleteComment("001", "111");
	List<Comment> comments = commentManager.getComments();
	assertNotNull(comments);
	assertEquals(comment_count-1, commentManager.getComments().size());
}

}
