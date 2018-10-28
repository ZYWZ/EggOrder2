package au.usyd.elec5619;


import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

//import au.usyd.elec5619.dao.CommentDao;
import au.usyd.elec5619.domain.Comment;
import au.usyd.elec5619.domain.User;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Expression;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import au.usyd.elec5619.dao.BookingDao;
import au.usyd.elec5619.domain.Booking;
import au.usyd.elec5619.domain.Comment;
import au.usyd.elec5619.service.BookingService;
import au.usyd.elec5619.service.CommentService;

/**
 * Handles requests for the application home page.
 */
@Controller
@Transactional
public class CommentController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	private CommentService commentService;
    @Autowired
    private SessionFactory sessionFactory;
	@Autowired
    private JdbcTemplate jdbcTemplate;
//	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
    
	@RequestMapping(value = "/comment", method = RequestMethod.GET)
	public String comment(Locale locale, Model model) {
		return "comment";
	}
    
	@RequestMapping(value = "/comment/{Id}", method = RequestMethod.GET)
	public String comment(Locale locale, Model model, HttpServletRequest request,HttpSession session,
			@PathVariable int Id) {
//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		String formattedDate = dateFormat.format(date);
//		model.addAttribute("serverTime", formattedDate );
//		String sql = "SELECT * FROM Rating WHERE classroom_id=?";
        Query query = sessionFactory.getCurrentSession().createQuery("from Comment b where b.classroom_id = :classroomid");
        query.setInteger("classroomid", Id);
        List<Comment> result = (List<Comment>)query.list();
        String comment = new Gson().toJson(result);
        String login_info = new Gson().toJson(request.getSession().getAttribute("USER_SESSION"));
		login_info = login_info.replace("{","").replace("}","").replace("\"","").replace("student_id:","");
		String student_id =login_info;
        model.addAttribute("comment", comment);
        model.addAttribute("classroomID", Id);
        model.addAttribute("StudentID",student_id);
//        request.getSession().getAttribute("USER_SESSION");
//        System.out.print(student_id);
		return "comment";
	}
    
	@RequestMapping(value = "/comment/{Id}", method = RequestMethod.POST)
	public String PublicComment(Locale locale, HttpServletRequest request, Model model, HttpSession session,
			@PathVariable int Id,User user){
		Date date = new Date();
		SimpleDateFormat format= new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String formatDate = format.format(date);
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		String login_info = new Gson().toJson(request.getSession().getAttribute("USER_SESSION"));
		login_info = login_info.replace("{","").replace("}","").replace("\"","").replace("student_id:","");
		String student_id =login_info;
        int classroom_id = Id;
        String comment = request.getParameter("comment");
        String score = request.getParameter("score");
        String post_time = formatDate;
		commentService.PostComment(student_id,classroom_id,comment,score,post_time);
		return "redirect:/profile";
		
	}
	@RequestMapping(value = "/ViewComment/{Id}", method = RequestMethod.GET)
	public String ViewComment(Locale locale, HttpServletRequest request, Model model, HttpSession session,
			@PathVariable int Id,User user){
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		String login_info = new Gson().toJson(request.getSession().getAttribute("USER_SESSION"));
		login_info = login_info.replace("{","").replace("}","").replace("\"","").replace("student_id:","");
		String student_id =login_info;
//        int classroom_id = Id;
//        String comment = request.getParameter("comment");
//        String score = request.getParameter("score");
//        String post_time = formattedDate;
		//commentService.PostComment(student_id,classroom_id,comment,score,post_time);
        
        Query query = sessionFactory.getCurrentSession().createQuery("from Comment b where b.classroom_id = :classroomid");
        query.setInteger("classroomid", Id);
        List<Comment> result = (List<Comment>)query.list();
        String comment = new Gson().toJson(result);
        model.addAttribute("comment", comment);
        model.addAttribute("classroomID", Id);
        
		return "ViewComment";
		
	}
	@RequestMapping(value = "/AdminComment/{Id}", method = RequestMethod.GET)
	public String AdminComment(Locale locale, HttpServletRequest request, Model model, HttpSession session,
			@PathVariable int Id,User user){
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		String login_info = new Gson().toJson(request.getSession().getAttribute("USER_SESSION"));
		login_info = login_info.replace("{","").replace("}","").replace("\"","").replace("student_id:","");
		String student_id =login_info;
//        int classroom_id = Id;
//        String comment = request.getParameter("comment");
//        String score = request.getParameter("score");
//        String post_time = formattedDate;
		//commentService.PostComment(student_id,classroom_id,comment,score,post_time);
        
        Query query = sessionFactory.getCurrentSession().createQuery("from Comment b where b.classroom_id = :classroomid order by post_time desc");
        query.setInteger("classroomid", Id);
        List<Comment> result = (List<Comment>)query.list();
        String comment = new Gson().toJson(result);
        model.addAttribute("comment", comment);
        model.addAttribute("classroomID", Id);
        System.out.print(comment);
		return "AdminComment";
		
	}
	@RequestMapping(value = "/AdminComment/{Id}", method = RequestMethod.POST)
	public String DeleteComment(Locale locale, HttpServletRequest request, Model model, HttpSession session,
			@PathVariable int Id,User user){
		int classroom_id = Id;
		String student_id = request.getParameter("studentID");
		commentService.DeleteComment(student_id,classroom_id);
		return "redirect:/AdminComment/{Id}";
	}
}

