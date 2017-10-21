package com.webshop.spring.manager;

import java.util.List;

import com.webshop.spring.model.Product;

public interface ProductManager {
	Product findById(int id);
	List<Product> getAllProducts();
	
	List<Product>getProductByCategoryId(int id);
}
