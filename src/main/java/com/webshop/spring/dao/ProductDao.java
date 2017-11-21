package com.webshop.spring.dao;

import java.util.List;

import com.webshop.spring.model.Product;

public interface ProductDao {
	Product findById(int id);
	List<Product> getAllProducts();
	void updateProduct(Product product);
	List<Product> getProductsByCategoryId(int id);
}
