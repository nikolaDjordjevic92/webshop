package com.webshop.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/")
public class WelcomeController {
	
	
	@RequestMapping(value= {"/"}, method = RequestMethod.GET)
	public String getHome(ModelMap map) {
		return "home";
	}
	
	@RequestMapping(value= {"/home"}, method = RequestMethod.GET)
	public String getHomeHome(ModelMap map) {
		return "home";
	}
	
	@RequestMapping(value= {"/contactus"}, method = RequestMethod.GET)
	public String getContact(ModelMap map) {
		return "contactus";
	}
}
