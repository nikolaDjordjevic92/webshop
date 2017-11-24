package com.webshop.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.webshop.spring.manager.OrderManager;
import com.webshop.spring.model.Order;

@Controller
public class OrderControll {
	
	@Autowired
	private OrderManager orderManager;
	
	@RequestMapping(value="/myorders")
	public String getAllOrders(ModelMap map) {
		List<Order> myOrders = orderManager.getOrdersByUser(1, "user.id");
		
		map.addAttribute("myorders",myOrders);
		
		return "myorders";
	}
}
