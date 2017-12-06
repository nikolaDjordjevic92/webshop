package com.webshop.spring.manager;


import com.webshop.spring.model.Order;

public interface OrderManager {
	Order getNewOrder();
	void makeNewOrder(Order o);
}
