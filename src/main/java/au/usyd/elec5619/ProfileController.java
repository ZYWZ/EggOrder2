package au.usyd.elec5619;

import java.io.Console;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.classic.Session;
import org.hibernate.criterion.Expression;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.Gson;
import au.usyd.elec5619.dao.ClassroomDao;
import au.usyd.elec5619.domain.Booking;
import au.usyd.elec5619.domain.Classroom;
import au.usyd.elec5619.domain.User;
import au.usyd.elec5619.service.ClassroomService;

/**
 * Handles requests for the application home page.
 */
@Controller
@Transactional
public class ProfileController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProfileController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	public User getUser(Session currentSession){
		
		return null;
	} 
	
	 @Autowired
	    private SessionFactory sessionFactory;
	    @RequestMapping(value = "/profile", method = RequestMethod.GET)
	    public String hibernateQuery(HttpServletRequest request, Model model, HttpSession session,Locale locale, User student) {
	        // HQL (Hibernate Query Language)
	    	String login_info= new Gson().toJson(request.getSession().getAttribute("USER_SESSION"));
	    	login_info = login_info.replace("{", "").replace("}", "").replace("\"", "").replace("student_id:", "");
	    	int profile_id = Integer.parseInt(login_info);
	        Query query1 = sessionFactory.getCurrentSession().createQuery("from User s where s.student_id = :student_id");
	        query1.setInteger("student_id", profile_id);
	        List<User> profile_user = (List<User>)query1.list();
	    	
	    	Session currentSession = this.sessionFactory.getCurrentSession();
			Query query2 = currentSession.createQuery("from Booking");
			List<Booking> result = (List<Booking>) query2.list();
	        String json = new Gson().toJson(result);
//	        User user = getUser(currentSession);
	        
	        model.addAttribute("profile_name", profile_user.get(0).getFullName());
	        model.addAttribute("profile_birthday", profile_user.get(0).getBiirthdate());
	        model.addAttribute("profile_email", profile_user.get(0).getEmail());
	        model.addAttribute("result", json);
	        
	        return "profile";
	    }
}
	
