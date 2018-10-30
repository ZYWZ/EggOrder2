package au.usyd.elec5619.domain;

import junit.framework.TestCase;

public class CommentTest extends TestCase{
	private Comment comment;
	
	protected void setUp() throws Exception{
		comment = new Comment();
	}
	public void testSetAndGetStudentId() {
		String testId = "111111";
		assertNull(comment.getStudentId());
		comment.setStudentId(testId);
		assertEquals(testId, comment.getStudentId());
	}
	
	public void testSetAndGetClassroomId() {
		String testClassroomId = "000001";
		assertNull(comment.getClassroomId());
		comment.setClassroomId(testClassroomId);
		assertEquals(testClassroomId, comment.getClassroomId());
	}
	public void testSetAndGetComment() {
		String testComment = "nice";
		assertNull(comment.getComment());
		comment.setComment(testComment);
		assertEquals(testComment, comment.getComment());
	}
	public void testSetAndGetScore() {
		String testScore = "1";
		assertNull(comment.getScore());
		comment.setScore(testScore);
		assertEquals(testScore, comment.getScore());
	}
	public void testSetAndGetPostTime() {
		String testPostTime = "2018-10-10 12:00:00";
		assertNull(comment.getPostTime());
		comment.setPostTime(testPostTime);
		assertEquals(testPostTime, comment.getPostTime());
	}
}
