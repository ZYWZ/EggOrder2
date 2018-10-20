package au.usyd.elec5619.service;
//
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import au.usyd.elec5619.dao.UserDao;
import au.usyd.elec5619.domain.User;
 
@Service//标注为服务层的bean
public class UserService {
    @Autowired
    private UserDao userDao;

    public boolean registerCheck(String student_id){
       return userDao.registerCheck(student_id)==0;
    }

    public boolean registerUser(String student_id, String password, String fullname, String email, String birthdate){
       if(registerCheck(student_id)){
           return userDao.registerUser(student_id, password, fullname, email, birthdate)>0;
       }
       return false;
    }

    public boolean getMatchCount(String student_id,String password){
       return userDao.getMatchCount(student_id,password)>0;
    }
   
}
