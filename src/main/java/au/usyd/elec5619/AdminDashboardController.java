package au.usyd.elec5619;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.SessionFactory;
import org.hibernate.classic.Session;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.Gson;

import au.usyd.elec5619.domain.Classroom;
import au.usyd.elec5619.domain.User;
import au.usyd.elec5619.service.BookingService;
import au.usyd.elec5619.service.ClassroomService;

@Controller
@Transactional
public class AdminDashboardController {
	
private static final Logger logger = LoggerFactory.getLogger(AdminDashboardController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	public User getUser(Session currentSession){
		
		return null;
	} 
	@Resource(name="classroomManager")
	private DatabaseClassroomManager classroomManager;
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		List<Classroom> result = classroomManager.getAllClassrooms();
		String json = new Gson().toJson(result);
	    model.addAttribute("result",json);
		return "admin";
	}
	
	 @Resource(name="classroomService")
	 private ClassroomService classroomService;
	   
	  @RequestMapping(value = "/admin/delete/{Id}", method = RequestMethod.POST)
	  public String hibernateDeleteRoom(HttpServletRequest request, Model model, HttpSession session,Locale locale,@PathVariable int Id) {
		  classroomService.deleteClassroomById(Id);
			return "redirect:/admin";
	    }
	
}
