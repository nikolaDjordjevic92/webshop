package com.webshop.spring.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.webshop.spring.model.Category;

public interface CategoryDao extends JpaRepository<Category, Integer>{
	
}
