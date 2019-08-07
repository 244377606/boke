package com.chao.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.chao.pojo.Admin;

public class UserIsLoginInterceptor implements HandlerInterceptor{

	//路径拦截 判断是否登录
	@Override
	public boolean preHandle(HttpServletRequest request, 
			HttpServletResponse response, Object boj) throws Exception {
		
		Admin admin = (Admin) request.getSession().getAttribute("ADMIN_ACCOUNT");
		
		if(admin == null){
			response.sendRedirect(request.getContextPath()+"/admin/adminLogin");
			return false;
		}
		return true;
	}
	
	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
	}



}
