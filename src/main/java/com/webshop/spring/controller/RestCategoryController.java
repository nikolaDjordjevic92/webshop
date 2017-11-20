package com.webshop.spring.controller;

import java.math.BigDecimal;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.webshop.spring.model.Product;

@RestController
public class RestCategoryController {
	
	 @RequestMapping("/home")
	 public Product stocic() {//REST Endpoint.
		 
		 Product msg = new Product(66,"stocic",new BigDecimal(55.33),5);
	        return msg;
	 }
}
