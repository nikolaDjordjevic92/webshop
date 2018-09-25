package com.webshop.spring.service.impl;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webshop.spring.dao.OrderDao;
import com.webshop.spring.service.OrderManager;
import com.webshop.spring.model.Order;

@Service
public class OrderManagerImpl implements OrderManager{

	@Autowired
	private OrderDao orderDao;

	@Override
	public Order getNewOrder() {
		return orderDao.findByOrderDate(null);
	}

	@Override
	public void makeNewOrder(Order o) {
		orderDao.save(o);
	}
}
