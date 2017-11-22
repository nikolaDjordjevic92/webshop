package com.webshop.spring.dao;

import java.util.List;

import com.webshop.spring.model.Order;

public interface OrderDao {
	void saveOrder(Order order);
	List<Order> getOrdersForUser(int id,String criteria);
}
