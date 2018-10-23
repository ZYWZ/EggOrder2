package au.usyd.elec5619.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import au.usyd.elec5619.domain.User;
 

@Repository//springע�ⶨ��һ��dao
public class UserDao {
	@Autowired//�Զ�ע��JdbcTemplate ��bean
    private JdbcTemplate jdbcTemplate;

    public int registerUser(String student_id, String password, String fullname, String email, String birthdate){
       String sql = "INSERT INTO Student values(?,?,?,?,?);";
       int result = jdbcTemplate.update(sql, new Object[] { student_id, password, fullname,
    		   email, birthdate });
//       int result = jdbcTemplate.update(sql, new Object[]{student_id,password});
       return result;
    }

    public int registerCheck(String student_id){
       String sql="select count(student_id) from Student where student_id=?";
       int result = jdbcTemplate.queryForInt(sql,student_id);
       return result;
    }

    public int getMatchCount(String student_id,String password){
       String sql = "SELECT count(student_id) from Student where student_id = ? and password=?";
       int result = jdbcTemplate.queryForInt(sql, new Object[]{student_id,password});
       return result;
    }
    
    public int getAdminMatchCount(String admin_id,String password){
        String sql = "SELECT count(admin_id) from AdminMember where admin_id = ? and password=?";
        int result = jdbcTemplate.queryForInt(sql, new Object[]{admin_id,password});
        return result;
     }
}



//public interface UserDao {
//		public boolean check(String name,String passwod);
//		public void addUser(String name,String password);
//		public boolean unit(String name);
//}