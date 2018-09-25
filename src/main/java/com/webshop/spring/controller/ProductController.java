package com.webshop.spring.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.webshop.spring.model.Product;
import com.webshop.spring.model.Review;
import com.webshop.spring.service.ProductManager;
import com.webshop.spring.service.ReviewManager;

@Controller
public class ProductController {
	
	@Autowired
	ReviewManager reviewManager;
	
	@Autowired
	ProductManager productManager;
	
    @RequestMapping(value = "/product/{id}")
    public String getProducts(ModelMap model,@PathVariable Integer id) {
    	Product product = productManager.findById(id);
    	List<Review> reviews = reviewManager.getReviews(id);
        model.addAttribute("product", product);
        model.addAttribute("reviews",reviews);
        return "product";
    }
}
