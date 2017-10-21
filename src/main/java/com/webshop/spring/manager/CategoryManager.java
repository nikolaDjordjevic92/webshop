package com.webshop.spring.manager;

import java.util.List;

import com.webshop.spring.model.Category;

public interface CategoryManager {

	Category findById(int id);
	List<Category> getAllCategories();

}
