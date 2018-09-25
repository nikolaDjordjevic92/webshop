package com.webshop.spring.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webshop.spring.dao.OrderLineDao;
import com.webshop.spring.service.OrderLineManager;
import com.webshop.spring.model.OrderLine;

@Service
public class OrderLineManagerImpl implements OrderLineManager{

	@Autowired
	private OrderLineDao orderLineDao;
	
	@Override
	public void saveOrderLine(OrderLine orderLine) {
		orderLineDao.save(orderLine);
	}

	@Override
	public List<OrderLine> getOrdersByUser(int id) {
		return orderLineDao.findByOrderId(id);
	}

}
