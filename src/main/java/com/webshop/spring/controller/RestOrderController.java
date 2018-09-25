package com.webshop.spring.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.webshop.spring.model.Order;
import com.webshop.spring.model.OrderLine;
import com.webshop.spring.model.Product;
import com.webshop.spring.model.User;
import com.webshop.spring.service.OrderLineManager;
import com.webshop.spring.service.OrderManager;
import com.webshop.spring.service.ProductManager;

@RestController
public class RestOrderController {
	
	 @Autowired
	 private OrderLineManager orderLineManager;
	 
	 @Autowired
	 private OrderManager orderManager;
	 
	 @Autowired
	 private ProductManager productManager;
	 
	 
	 @RequestMapping(value= {"/order"}, method = RequestMethod.POST, consumes = "application/json", produces = "application/json")
	 public ResponseEntity<Order> saveOrder(@RequestBody Product product) {
		 OrderLine orderLine = new OrderLine();
		 
		 Product productFromBase = productManager.findById(product.getId());
		 
		 if(productFromBase.getQuantity() >= product.getQuantity() && product.getQuantity() > 0) {
			 orderLine.setProduct(product);
			 
			 Order order = orderManager.getNewOrder();
			 if(order==null) {
				 order = new Order();
				 order.setOrderDate(null);
				 User user = new User();
				 user.setId(1);
				 
				 order.setUser(user);
				 orderManager.makeNewOrder(order);
				 order = orderManager.getNewOrder();
			 }
			 productFromBase.setQuantity(productFromBase.getQuantity()-product.getQuantity());
			 productManager.update(productFromBase);
			 
			 User user = new User();
			 user.setId(1);
			 
			 order.setUser(user);
			 
			 orderLine.setOrder(order);
			 
			 orderLine.setOrderQuantity(product.getQuantity());
			 
			 orderLineManager.saveOrderLine(orderLine);
			 
			 return new ResponseEntity<>(HttpStatus.OK);
		 }
		 else
			 return new ResponseEntity<>(HttpStatus.NOT_ACCEPTABLE);
	 }
	 
	 @RequestMapping(value= {"/order/{id}"},method= RequestMethod.GET)
	 public ResponseEntity<List<OrderLine>> getOrdersForUser(){
		 List<OrderLine> listOfOrders = new ArrayList<>();
		 Order order = orderManager.getNewOrder();
		 if(order==null)
			 return new ResponseEntity<>(null, HttpStatus.NOT_FOUND);
		 List<OrderLine> listOfOrdersFromBase = orderLineManager.getOrdersByUser(order.getId());
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
		 return new ResponseEntity<>(listOfOrders, HttpStatus.OK);
	 }
	 
	@RequestMapping(value="/ordersubmit",method=RequestMethod.POST,consumes = "application/json")
	public void submitOrder(Order order) {
		order.setOrderDate(new Date());
		orderManager.makeNewOrder(order);
		System.out.println("a");
 	}
}
