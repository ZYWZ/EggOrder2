package au.usyd.elec5619.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
@Repository
public class CommentService {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public void PostComment(String student_id, int classroom_id, String comment, String score, String post_time){
		String sql = "INSERT INTO Rating values(?,?,?,?,?);";
		jdbcTemplate.update(sql, new Object[] {student_id, classroom_id, comment, score, post_time});
	}
//	public int DeleteComment(String student_id, String classroom_id, String comment, String score){
//		String sql = "delete from Rating WHERE student_id=? and classroom_id=?);";
//		int result = jdbcTemplate.update(sql, new Object[] {student_id, classroom_id});
//		return result;
//	}
}