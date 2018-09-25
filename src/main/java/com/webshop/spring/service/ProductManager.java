package com.webshop.spring.service;

import java.util.List;

import com.webshop.spring.model.Product;

public interface ProductManager {
	Product findById(int id);
	List<Product> getAllProducts();
	void update(Product product);
	List<Product>getProductByCategoryId(int id);
}
