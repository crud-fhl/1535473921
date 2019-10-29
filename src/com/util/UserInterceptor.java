package com.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.entity.User;

/*拦截权限功能*/
public class UserInterceptor extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		String role = user.getRole();
		/*System.out.println(role);*/
		if(role.equals("1")){
			String path = request.getContextPath();
			response.sendRedirect(path+"/errRole");
			return false;
		}
		return true;
	}
}
