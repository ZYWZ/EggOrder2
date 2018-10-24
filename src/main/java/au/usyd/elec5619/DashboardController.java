package au.usyd.elec5619;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.Gson;
import au.usyd.elec5619.dao.ClassroomDao;
import au.usyd.elec5619.domain.Booking;
import au.usyd.elec5619.domain.Classroom;
import au.usyd.elec5619.service.ClassroomService;

/**
 * Handles requests for the application home page.
 */
@Controller
@Transactional
public class DashboardController {
	
	@Resource(name="classroomManager")
	private DatabaseClassroomManager classroomManager;
	
	private static final Logger logger = LoggerFactory.getLogger(DashboardController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/dashboard0", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		
		model.addAttribute("serverTime", formattedDate );
		
		return "dashboard";
	}
	
	
	
	@Autowired
    private ClassroomService classroomService;
    @RequestMapping(value = "/classroomhibernateDaoServiceAdd", method = RequestMethod.GET)
    public String hibernateDaoServiceAdd(Locale locale, Model model) {
    	
        Classroom c1 = new Classroom();
        c1.setClassroomId(2222);
        c1.setClassroomName("Room123");
        c1.setClassroomSize("16");
        c1.setAddress("Fisher Library");
        
        Classroom c2 = new Classroom();
        c2.setClassroomId(3333);
        c2.setClassroomName("Room223");
        c2.setClassroomSize("16");
        c2.setAddress("Fisher Library2");
        
        Classroom c3 = new Classroom();
        c3.setClassroomId(4444);
        c3.setClassroomName("Room323");
        c3.setClassroomSize("16");
        c3.setAddress("Fisher Library3");
        
        classroomService.registerClassroom(c1);
        classroomService.registerClassroom(c2);
        classroomService.registerClassroom(c3);
        
        return "dashboard";
    }
    
    @Autowired
    private SessionFactory sessionFactory;
    @RequestMapping(value = "/dashboard", method = RequestMethod.GET)
    public String hibernateQuery(Locale locale, Model model) {
        
        // HQL (Hibernate Query Language)
    	Session currentSession = this.sessionFactory.getCurrentSession();
//		Query query = currentSession.createQuery("from Classroom");
//		List<Classroom> result = (List<Classroom>) query.list();
//        String json = new Gson().toJson(result);
//        model.addAttribute("result", json);
        
        List<Classroom> result = classroomManager.getAllClassrooms();
//        Query query = sessionFactory.getCurrentSession().createQuery("from Rating");
//        List<Rating> rating = (List<Rating>)query.list();
//        String rate = new Gson().toJson(rating);
//        model.addAttribute("rate",rate);
		String json = new Gson().toJson(result);
        
		model.addAttribute("result",json);
        return "dashboard";
    }
}
