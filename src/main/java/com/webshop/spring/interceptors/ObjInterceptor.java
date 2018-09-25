package com.webshop.spring.interceptors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.webshop.spring.service.CategoryService;

public class ObjInterceptor extends HandlerInterceptorAdapter {
	
	@Autowired
	private CategoryService categoryManager;
	
	@Override
    public void postHandle(HttpServletRequest request,
            HttpServletResponse response, Object handler,
            ModelAndView modelAndView) throws Exception {
		if(modelAndView!=null)
			modelAndView.addObject("categories",categoryManager.getAllCategories());
    }
}
