package com.webshop.spring.manager;

import java.util.List;

import com.webshop.spring.model.OrderLine;

public interface OrderLineManager {
	void saveOrderLine(OrderLine orderLine);
	List<OrderLine> getOrdersByUser(int id, String criteria);
}
