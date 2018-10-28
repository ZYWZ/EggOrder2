package au.usyd.elec5619.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
//

public class CommentDao {
@Autowired
private JdbcTemplate jdbcTemplate;
//
//	public int PostComment(String student_id, String classroom_id, String comment, int score){
//		String sql = "insert into Rating values(?,?,?,?);";
//		int result = jdbcTemplate.update(sql, new Object[] {student_id, classroom_id,comment,score
//				});
//		return result;
//	}
	public int DeleteComment(String student_id, String classroom_id, String comment, int score){
		String sql = "delete from Rating WHERE student_id=? and classroom_id=?);";
		int result = jdbcTemplate.update(sql, new Object[] {student_id, classroom_id});
		return result;
	}
}
