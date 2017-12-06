package com.webshop.spring.managerImpl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webshop.spring.dao.OrderLineDao;
import com.webshop.spring.manager.OrderLineManager;
import com.webshop.spring.model.OrderLine;

@Service("orderLineManager")
@Transactional
public class OrderLineManagerImpl implements OrderLineManager{

	@Autowired
	private OrderLineDao orderDao;
	
	@Override
	public void saveOrderLine(OrderLine orderLine) {
		orderDao.saveOrderLine(orderLine);
	}

	@Override
	public List<OrderLine> getOrdersByUser(int id, String criteria) {
		return orderDao.getOrdersForUser(id, criteria);
	}

}
