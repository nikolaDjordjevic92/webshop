package com.webshop.spring.dao;

import java.util.Date;

import org.springframework.data.jpa.repository.JpaRepository;

import com.webshop.spring.model.Order;

public interface OrderDao extends JpaRepository<Order, Integer>{
	public Order findByOrderDate(Date orderDate);
}
