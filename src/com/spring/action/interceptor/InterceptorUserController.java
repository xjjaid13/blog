package com.spring.action.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.spring.entity.User;
import com.util.Constant;

public class InterceptorUserController implements HandlerInterceptor{
	
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		
	}

	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
		
	}

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object obj) throws Exception {

		User user = (User)request.getSession().getAttribute(Constant.USER);
		if(user == null){
			response.sendRedirect(request.getContextPath()+"/login/index");
			return false;
		}else{
			request.setAttribute(Constant.USER, user);
		}
		return true;
	}
	
}
