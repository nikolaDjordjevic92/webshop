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

import com.webshop.spring.manager.OrderManager;
import com.webshop.spring.manager.ProductManager;
import com.webshop.spring.model.Order;
import com.webshop.spring.model.Product;
import com.webshop.spring.model.User;

@RestController
public class RestOrderController {
	
	 @Autowired
	 private OrderManager orderManager;
	 
	 @Autowired
	 private ProductManager productManager;
	 
	 
	 @RequestMapping(value= {"/order"}, method = RequestMethod.POST, consumes = "application/json", produces = "application/json")
	 public ResponseEntity<Order> saveOrder(@RequestBody Product product) {
		 Order order = new Order();
		 
		 Product productFromBase = productManager.findById(product.getId());
		 
		 if(productFromBase.getQuantity() >= product.getQuantity() && product.getQuantity() > 0) {
			 order.setProduct(product);
			 
			 productFromBase.setQuantity(productFromBase.getQuantity()-product.getQuantity());
			 productManager.update(productFromBase);
			 
			 User user = new User();
			 user.setId(1);
			 
			 order.setUser(user);
			 
			 Date date = new Date();
			 order.setOrderDate(date);
			 
			 order.setOrderQuantity(product.getQuantity());
			 
			 orderManager.saveOrder(order);
			 
			 return new ResponseEntity<>(HttpStatus.OK);
		 }
		 else
			 return new ResponseEntity<>(HttpStatus.NOT_ACCEPTABLE);
	 }
	 
	 @RequestMapping(value="/order/{id}",method= RequestMethod.GET)
	 public ResponseEntity<List<Order>> getOrdersForUser(){
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
		 return new ResponseEntity<>(listOfOrders, HttpStatus.OK);
	 }
}
