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
	public Order getNewOrder() {
		List<Order> orders = orderDao.getNewOrder();
		if(orders.size()>0)
			return orderDao.getNewOrder().get(0);
		else
			return null;
	}

	@Override
	public void makeNewOrder(Order o) {
		orderDao.makeNewOrder(o);
	}
}
