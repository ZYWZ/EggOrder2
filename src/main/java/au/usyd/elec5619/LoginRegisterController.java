package au.usyd.elec5619;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.ui.Model;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMethod;

import au.usyd.elec5619.domain.User;
//import au.usyd.elec5619.domain.Login;
import au.usyd.elec5619.service.UserService;
 
@Controller//标注成为spring mvc 的Controller类
public class LoginRegisterController {
    @Autowired
    private UserService userService;

    @RequestMapping(value={"/signin"},method = RequestMethod.GET)
    public String login(){
       return "signin";
    }

    @RequestMapping(value={"/signup"},method = RequestMethod.GET)
    public String register(){
       return "signup";
    }

    
    @RequestMapping(value={"/signinProcess"})
    public String loginCheck(HttpServletRequest request,Model model, HttpSession session){
       String student_id =request.getParameter("student_id");
       String password = request.getParameter("password");
       boolean b = userService.getMatchCount(student_id, password);
       if(!b){
    	   model.addAttribute("msg","Wrong StudentId or Password");
    	   return "signin";
       }
       User loginUser = new User();
       loginUser.setStudentId(student_id);
       session.setAttribute("USER_SESSION",loginUser);
//       request.getSession().setAttribute("user",loginUser);
       return "redirect:home";
    }
    
    
    @RequestMapping(value={"/signupProcess"})
    public String registerUser(HttpServletRequest request,User user, Model model, HttpSession session){
//    public ModelAndView addUser(HttpServletRequest request, HttpServletResponse response,
//    		  @ModelAttribute("user") User user) {
        String student_id =request.getParameter("student_id");
        String password = request.getParameter("password");
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String birthdate = request.getParameter("birthdate");
//       boolean b = userService.registerUser(user.getStudentId(), user.getPassword(), user.getFullName(), 
//    		   user.getEmail(), user.getBiirthdate());
       boolean b = userService.registerUser(student_id, password, fullname, email, birthdate);
       if(!b){
    	   model.addAttribute("msg","StudentId has been registered");
    	   return "login";
       }
       request.getSession().setAttribute("user",user);
       return "redirect:signin";
    }
    
    @RequestMapping(value = "/logout")
    public String logout(HttpSession session){
        //清除session
        session.invalidate();
        //重定向到登录页面的跳转方法
        return "redirect:login";
    }
}