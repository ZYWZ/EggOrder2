package au.usyd.elec5619;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Expression;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;

import au.usyd.elec5619.dao.BookingDao;
import au.usyd.elec5619.domain.Booking;
import au.usyd.elec5619.service.BookingService;

/**
 * Handles requests for the application home page.
 */
@Controller
@Transactional
public class CalendarController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/calenda", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "calendar";
	}
	
	@Autowired
    private BookingService bookingService;
    @RequestMapping(value = "/calendarhibernateDaoServiceAdd", method = RequestMethod.GET)
    public String hibernateDaoServiceAdd(Locale locale, Model model) {
    	
        Booking b = new Booking();
        b.setStudentId(1111);
        b.setClassroomId(123456);
        b.setBookingDate("2018-10-11");
        b.setStartTime("2018-10-11 10:00:00");
        b.setFinishTime("2018-10-11 16:00:00");
        
        Booking c = new Booking();
        c.setStudentId(1112);
        c.setClassroomId(123456);
        c.setBookingDate("2018-10-12");
        c.setStartTime("2018-10-12 11:00:00");
        c.setFinishTime("2018-10-12 17:00:00");
        
        Booking d = new Booking();
        d.setStudentId(1113);
        d.setClassroomId(123456);
        d.setBookingDate("2018-10-13");
        d.setStartTime("2018-10-13 12:00:00");
        d.setFinishTime("2018-10-13 18:00:00");

        bookingService.registerBooking(b);
        bookingService.registerBooking(c);
        bookingService.registerBooking(d);
        
        return "calendar";
    }
    
    @Autowired
    private SessionFactory sessionFactory;
    @RequestMapping(value = "/calendar", method = RequestMethod.GET)
    public String hibernateQuery(Locale locale, Model model) {
        
        // HQL (Hibernate Query Language)
        Query query = sessionFactory.getCurrentSession().createQuery("from Booking b where b.classroomId = :classroomid");
        query.setInteger("classroomid", 123456);
        List<Booking> result = (List<Booking>)query.list();
        
        String json = new Gson().toJson(result);
        model.addAttribute("result", json);
        
        return "calendar";
    }
    
    @RequestMapping(value = "/calendar{Id}", method = RequestMethod.GET)
    public String hibernateQueryWithClassroomID(Locale locale, Model model, @PathVariable int Id) {
        
        // HQL (Hibernate Query Language)
        Query query = sessionFactory.getCurrentSession().createQuery("from Booking b where b.classroomId = :classroomid");
        query.setInteger("classroomid", Id);
        List<Booking> result = (List<Booking>)query.list();
        
        String json = new Gson().toJson(result);
        model.addAttribute("result", json);
        model.addAttribute("classroomID", Id);
        
        return "calendar";
    }
    
    @RequestMapping(value = "/calendarAdd", method = RequestMethod.POST)
    public String AddEvent(Locale locale, Model model, @RequestParam("studentID") int studentID,@RequestParam("startTime") String startTime, @RequestParam("finishTime") String finishTime) {
        String st = startTime.toString().replaceAll("T", " ")+":00";
        String ft = finishTime.toString().replaceAll("T", " ")+":00";
        
        Booking temp = new Booking();
        temp.setStudentId(studentID);
        temp.setClassroomId(123456);
        temp.setBookingDate("2018-10-12");
        temp.setStartTime(st);
        temp.setFinishTime(ft);
        
        bookingService.registerBooking(temp);
        
        return "calendar";
    }
}
