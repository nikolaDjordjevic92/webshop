package com.webshop.spring.managerImpl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webshop.spring.dao.OrderDao;
import com.webshop.spring.manager.OrderManager;
import com.webshop.spring.model.Order;

@Service("orderManager")
@Transactional
public class OrderManagerImpl implements OrderManager{

	@Autowired
	private OrderDao orderDao;
	
	@Override
	public void saveOrder(Order order) {
		orderDao.saveOrder(order);
	}

	@Override
	public List<Order> getOrdersByUser(int id, String criteria) {
		return orderDao.getOrdersForUser(id, criteria);
	}

}
