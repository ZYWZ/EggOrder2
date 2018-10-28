package au.usyd.elec5619;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMethod;

import au.usyd.elec5619.domain.Admin;
import au.usyd.elec5619.service.UserService;
 
@Controller//标注成为spring mvc 的Controller类
public class AdminLoginController {
    @Autowired
    private UserService userService;

    @RequestMapping(value={"/adminlogin"}, method = RequestMethod.GET)
    public String adminLogin(){
       return "adminlogin";
    }

    @Resource(name="classroomManager")
	private DatabaseClassroomManager classroomManager;
    
    @RequestMapping(value={"/adminloginProcess"})
    public String adminloginCheck(HttpServletRequest request,Model model, HttpSession session){
       String admin_id =request.getParameter("admin");
       String password = request.getParameter("password");
       boolean b = userService.getAdminMatchCount(admin_id, password);
       if(!b){
    	   model.addAttribute("msg","Wrong AdminId or Password");
    	   return "adminlogin";
       }
       Admin loginAdmin = new Admin();
       loginAdmin.setAdmin(admin_id);
       session.setAttribute("Admin_SESSION",loginAdmin);
//       request.getSession().setAttribute("user",loginAdmin);
       return "redirect:admin";
    }
    
    
    
}
