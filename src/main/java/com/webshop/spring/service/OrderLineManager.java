package com.webshop.spring.service;

import java.util.List;

import com.webshop.spring.model.OrderLine;

public interface OrderLineManager {
	void saveOrderLine(OrderLine orderLine);
	List<OrderLine> getOrdersByUser(int id);
}
