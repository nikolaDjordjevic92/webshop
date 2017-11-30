package com.webshop.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
	
	@RequestMapping(value="/categories/{id}",method=RequestMethod.GET)
	public ModelAndView getCategory(@PathVariable Integer id,@RequestParam(required=false) Integer page) {
		ModelAndView mav = new ModelAndView("category");
		List<Product> products=productManager.getProductByCategoryId(id,"category.id");
		PagedListHolder<Product> pageListHolder = new PagedListHolder<>(products);
		pageListHolder.setPageSize(9);
		mav.addObject("maxPages", pageListHolder.getPageCount());
		
		if(page==null || page < 1 || page>pageListHolder.getPageCount()) {
			pageListHolder.setPage(0);
			page=1;
		}
		else 
			pageListHolder.setPage(page-1);
		
		mav.addObject("products", pageListHolder.getPageList());
		
			
		
		mav.addObject("page",page);
		
		
		return mav;
	}
}
