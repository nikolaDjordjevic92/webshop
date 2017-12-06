package com.webshop.spring.dao;

import java.util.List;

import com.webshop.spring.model.Order;
import com.webshop.spring.model.OrderLine;

public interface OrderLineDao {
	void saveOrderLine(OrderLine orderLine);
	List<OrderLine> getOrdersForUser(int id,String criteria);
}
