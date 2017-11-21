package com.webshop.spring.managerImpl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webshop.spring.dao.ProductDao;
import com.webshop.spring.manager.ProductManager;
import com.webshop.spring.model.Product;

@Service("productManager")
@Transactional
public class ProductManagerImpl implements ProductManager{

	@Autowired
	ProductDao productDao;
	
	@Override
	public Product findById(int id) {
		return productDao.findById(id);
	}

	@Override
	public List<Product> getAllProducts() {
		return productDao.getAllProducts();
	}

	@Override
	public List<Product> getProductByCategoryId(int id) {
		
		
		return productDao.getProductsByCategoryId(id);
	}

	@Override
	public void update(Product product) {
		productDao.updateProduct(product);
	}
	
}
