package com.webshop.spring.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.webshop.spring.model.OrderLine;

public interface OrderLineDao extends JpaRepository<OrderLine, Integer>{
	List<OrderLine> findByOrderId(int id);
}
