package com.webshop.spring.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.webshop.spring.manager.OrderManager;
import com.webshop.spring.model.Order;

@Controller
public class OrderControll {
	
	@Autowired
	private OrderManager orderManager;
	
	@RequestMapping(value="/myorders",method = RequestMethod.GET)
	public ModelAndView getAllOrders(@RequestParam(required=false) Integer page) {
		List<Order> myOrders = orderManager.getOrdersByUser(1, "user.id");
		ModelAndView mav = new ModelAndView("myorders");
		PagedListHolder<Order> pageListHolder = new PagedListHolder<>(myOrders);
		pageListHolder.setPageSize(12);
		
		if(page==null || page < 1 || page>pageListHolder.getPageCount()) {
			pageListHolder.setPage(0);
			page=1;
		}
		else 
			pageListHolder.setPage(page-1);
		
		mav.addObject("page",page);
		mav.addObject("myorders", pageListHolder.getPageList());
		
		mav.addObject("maxPages", pageListHolder.getPageCount());
		
		return mav;
	}
	
	@RequestMapping(value="/ordersubmit",method = RequestMethod.GET)
	public String getOrdersForSubmit(ModelMap map) {
		 
		 List<Order> listOfOrders = new ArrayList<>();
		 List<Order> listOfOrdersFromBase = orderManager.getOrdersByUser(1, "user.id");
		 cc:for (int i = 0; i < listOfOrdersFromBase.size(); i++) {
			 if(listOfOrdersFromBase.get(i).getOrderStatus().toString().equals("IN_CART")) {
				 for(int j = 0; j < listOfOrders.size(); j++) {
					 if(!listOfOrders.isEmpty() && listOfOrders.get(j).getProduct().getId()==listOfOrdersFromBase.get(i).getProduct().getId()) {
						 listOfOrders.get(j).setOrderQuantity(listOfOrders.get(j).getOrderQuantity()+listOfOrdersFromBase.get(i).getOrderQuantity());
						 listOfOrders.get(j).getProduct().setPrice(listOfOrders.get(j).getProduct().getPrice().add(listOfOrdersFromBase.get(i).getProduct().getPrice()));
						 continue cc;
					 }
				 }
				 listOfOrders.add(listOfOrdersFromBase.get(i));
			 }
		 }
		 map.addAttribute("orders",listOfOrders);
		return "order-submit";
	}
	
}
