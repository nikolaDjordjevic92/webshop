package com.webshop.spring.daoImpl;

import org.springframework.stereotype.Repository;

import com.webshop.spring.dao.AbstractDao;
import com.webshop.spring.dao.OrderDao;
import com.webshop.spring.model.Order;

@Repository("orderDao")
public class OrderDaoImpl extends AbstractDao<Integer, Order> implements OrderDao{

	@Override
	public void saveOrder(Order order) {
		super.persist(order);
	}
}
