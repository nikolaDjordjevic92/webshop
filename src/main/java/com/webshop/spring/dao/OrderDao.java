package com.webshop.spring.dao;

import com.webshop.spring.model.Order;

public interface OrderDao {
	void saveOrder(Order order);
}
