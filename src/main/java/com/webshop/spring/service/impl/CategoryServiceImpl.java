package com.webshop.spring.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webshop.spring.dao.CategoryDao;
import com.webshop.spring.service.CategoryService;
import com.webshop.spring.model.Category;

@Service
public class CategoryServiceImpl implements CategoryService{

	@Autowired
	private CategoryDao categoryDao;
	
//	@Override
//	public Category findById(int id) {
//		return categoryDao.findById(id).get();
//	}

	@Override
	public List<Category> getAllCategories() {
		return categoryDao.findAll();
	}
}