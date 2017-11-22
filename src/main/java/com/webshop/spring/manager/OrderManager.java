package com.webshop.spring.manager;

import java.util.List;

import com.webshop.spring.model.Order;

public interface OrderManager {
	void saveOrder(Order order);
	List<Order> getOrdersByUser(int id, String criteria);
}
