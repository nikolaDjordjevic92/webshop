package com.webshop.spring.controller;

import java.util.Date;

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
	 public ResponseEntity<Order> saveOrder(@RequestBody Product product) {//REST Endpoint.
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
}
