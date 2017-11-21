package com.webshop.spring.managerImpl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webshop.spring.dao.CategoryDao;
import com.webshop.spring.manager.CategoryManager;
import com.webshop.spring.model.Category;

@Service("categoryManager")
@Transactional
public class CategoryManagerImpl implements CategoryManager{

	@Autowired
	CategoryDao categoryDao;
	
	@Override
	public Category findById(int id) {
		return null;
	}

	@Override
	public List<Category> getAllCategories() {
		return categoryDao.getAllCategories();
	}
}