package au.usyd.elec5619;

import java.lang.reflect.Array;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Expression;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import au.usyd.elec5619.dao.BookingDao;
import au.usyd.elec5619.dao.AnalyzeDao;
import au.usyd.elec5619.domain.Booking;
import au.usyd.elec5619.domain.Classroom;
import au.usyd.elec5619.domain.User;
import au.usyd.elec5619.service.BookingService;

/**
 * Handles requests for the application home page.
 */
@Controller
@Transactional
public class AnalyzeController {
	
	private static final Logger logger = LoggerFactory.getLogger(AnalyzeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
    @Autowired
    private SessionFactory sessionFactory;
	@Autowired
    private JdbcTemplate jdbcTemplate;
	@Autowired
    private AnalyzeDao analyzeDao;
	@RequestMapping(value = "/analyze", method = RequestMethod.GET)
	public String analyze(Locale locale, Model model, User user) {
		logger.info("Welcome home! The client locale is {}.", locale);
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		

//		String sql = "SELECT count(*) FROM booking WHERE substring(startTime,1,2)=2;";
//        Query query = sessionFactory.getCurrentSession().createQuery("SELECT count(*) from Booking where substr(startTime,1,2) = :classroomid");
//        query.setInteger("classroomid", 2);
//        List<Classroom> result = (List<Classroom>)query.list();
//        String json = new Gson().toJson(result);
//		String[] BBT_List = new String[13];
//		BBT_List = AnalyzeDao.getAnalyzeBBT();
//		model.addAttribute("BBT", BBT_List);
		int[][] CC_List = new int[20][2];
		CC_List = analyzeDao.getAnalyzeCC();
		model.addAttribute("CC", CC_List);
//		String result[][] = {{"Year", "Sales"},{"2004",  "1000"},
//				{"2005",  "1170"},{"2006",  "660"},{"2007",  "1030"}};
//		String json = new Gson().toJson(result);
//	    System.out.println(result.get(0));
//		model.addAttribute("Result", json);
		return "analyze";
	}
}
