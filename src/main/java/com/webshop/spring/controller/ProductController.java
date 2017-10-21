package com.webshop.spring.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.webshop.spring.manager.ProductManager;
import com.webshop.spring.model.Product;

@Controller
public class ProductController {
	
	@Autowired
	ProductManager productManager;
	
    @RequestMapping(value = "/product/{id}", method = RequestMethod.GET)
    public String getProducts(ModelMap model,@PathVariable Integer id) {
    	Product product = productManager.findById(id);
        model.addAttribute("product", product);
        return "product";
    }
}
