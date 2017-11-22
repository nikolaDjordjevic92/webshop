package com.webshop.spring.daoImpl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.webshop.spring.dao.AbstractDao;
import com.webshop.spring.dao.OrderDao;
import com.webshop.spring.model.Order;

@Repository("orderDao")
public class OrderDaoImpl extends AbstractDao<Integer, Order> implements OrderDao{

	public void saveOrder(Order order) {
		super.persist(order);
	}

	public List<Order> getOrdersForUser(int id, String criteria) {
		return getListById(id, criteria);
	}
}
