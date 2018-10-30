package au.usyd.elec5619.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
//
@Repository
public class CommentDao {
@Autowired
private JdbcTemplate jdbcTemplate;

public void PostComment(String student_id, int classroom_id, String comment, String score, String post_time){
	String sql = "INSERT INTO Rating values(?,?,?,?,?);";
	jdbcTemplate.update(sql, new Object[] {student_id, classroom_id, comment, score, post_time});
}
public void DeleteComment(String student_id, int classroom_id){
	String sql = "DELETE FROM `Rating` WHERE (`student_id` = ?) and (`classroom_id` = ?);";
	jdbcTemplate.update(sql, new Object[] {student_id, classroom_id});
}
}
