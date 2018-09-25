package com.webshop.spring.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webshop.spring.dao.ProductDao;
import com.webshop.spring.service.ProductManager;
import com.webshop.spring.model.Product;

@Service
public class ProductManagerImpl implements ProductManager{

	@Autowired
	ProductDao productDao;
	
	@Override
	public Product findById(int id) {
		return productDao.findById(id).get();
	}

	@Override
	public List<Product> getAllProducts() {
		return productDao.findAll();
	}

	@Override
	public List<Product> getProductByCategoryId(int id) {
		return productDao.findByCategoryId(id);
	}

	@Override
	public void update(Product product) {
		productDao.save(product);
	}
	
}
