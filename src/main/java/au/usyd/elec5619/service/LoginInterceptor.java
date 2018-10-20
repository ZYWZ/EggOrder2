package au.usyd.elec5619.service;


import au.usyd.elec5619.domain.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {
        //��ȡ�����RUi:ȥ��http:localhost:8080�ⲿ��ʣ�µ�
        String uri = request.getRequestURI();
        //UTL:����login.jsp�ǿ��Թ������ʵģ�������URL���������ؿ���
        if (uri.indexOf("/login") >= 0) {
            return true;
        }
        //��ȡsession
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("USER_SESSION");
        //�ж�session���Ƿ����û����ݣ�����У��򷵻�true����������ִ��
        if (user != null) {
            return true;
        }
        //�����������ĸ�����ʾ��Ϣ����ת������¼ҳ��
        request.setAttribute("msg", "You didn't login��");
        request.getRequestDispatcher("/WEB-INF/views/signin.jsp").forward(request, response);
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
