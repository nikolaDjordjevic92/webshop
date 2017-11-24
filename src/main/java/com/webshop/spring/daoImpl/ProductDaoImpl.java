package com.webshop.spring.daoImpl;

import java.util.List;

import org.hibernate.Criteria;
import org.springframework.stereotype.Repository;

import com.webshop.spring.dao.AbstractDao;
import com.webshop.spring.dao.ProductDao;
import com.webshop.spring.model.Product;

@Repository("productDao")
public class ProductDaoImpl extends AbstractDao<Integer, Product> implements ProductDao{

	@Override
	public Product findById(int id) {
		return getByKey(id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Product> getAllProducts() {
		Criteria criteria = createEntityCriteria();
		return (List<Product>)criteria.list();
	}

	@Override
	public List<Product> getProductsById(int id,String crit) {
		return getListById(id, crit);
	}

	@Override
	public void updateProduct(Product product) {
		super.update(product);		
	}
}
