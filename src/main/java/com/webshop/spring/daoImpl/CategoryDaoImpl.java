package com.webshop.spring.daoImpl;

import java.util.List;

import org.hibernate.Criteria;
import org.springframework.stereotype.Repository;

import com.webshop.spring.dao.AbstractDao;
import com.webshop.spring.dao.CategoryDao;
import com.webshop.spring.model.Category;

@Repository("categoryDao")
public class CategoryDaoImpl extends AbstractDao<Integer, Category> implements CategoryDao {

	@SuppressWarnings("unchecked")
	@Override
	public List<Category> getAllCategories() {

		Criteria criteria=createEntityCriteria();
		return (List<Category>)criteria.list();
	}
	

}
