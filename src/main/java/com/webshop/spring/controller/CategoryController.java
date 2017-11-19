package com.webshop.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.webshop.spring.manager.CategoryManager;
import com.webshop.spring.manager.ProductManager;
import com.webshop.spring.model.Category;
import com.webshop.spring.model.Product;

@Controller

public class CategoryController {

	@Autowired
	CategoryManager categoryManager;
	
	@Autowired
	ProductManager productManager;
	
	@RequestMapping(value="/categories", method = RequestMethod.GET)
	public String getCategories(ModelMap map) {
		
		List<Category> categories=categoryManager.getAllCategories();
		map.addAttribute("categories",categories);
		return "categories";
		
	}
	
	@RequestMapping(value="/categories/{id}")
	public String getCategory(ModelMap map, @PathVariable Integer id) {
		List<Product> products=productManager.getProductByCategoryId(id);
		map.addAttribute("products",products);
//		List<Category> categories=categoryManager.getAllCategories();
//		map.addAttribute("categories",categories);
		return "category";
	}
}
