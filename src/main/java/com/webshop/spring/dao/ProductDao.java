package com.webshop.spring.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.webshop.spring.model.Product;

public interface ProductDao extends JpaRepository<Product, Integer>{
	List<Product> findByCategoryId(int id);
}
