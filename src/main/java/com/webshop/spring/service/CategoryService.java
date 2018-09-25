package com.webshop.spring.service;

import java.util.List;

import com.webshop.spring.model.Category;

public interface CategoryService {

//	Category findById(int id);
	List<Category> getAllCategories();

}
