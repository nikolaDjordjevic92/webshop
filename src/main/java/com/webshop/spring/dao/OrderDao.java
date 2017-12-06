package com.webshop.spring.dao;

import java.util.List;

import com.webshop.spring.model.Order;

public interface OrderDao {
	List<Order> getNewOrder();
	void makeNewOrder(Order o);
}
