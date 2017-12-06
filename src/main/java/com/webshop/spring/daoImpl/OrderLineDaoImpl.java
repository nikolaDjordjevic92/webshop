package com.webshop.spring.daoImpl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.webshop.spring.dao.AbstractDao;
import com.webshop.spring.dao.OrderLineDao;
import com.webshop.spring.model.OrderLine;

@Repository("orderLineDao")
public class OrderLineDaoImpl extends AbstractDao<Integer, OrderLine> implements OrderLineDao{

	public void saveOrderLine(OrderLine orderLine) {
		super.persist(orderLine);
	}

	public List<OrderLine> getOrdersForUser(int id, String criteria) {
		return getListById(id, criteria);
	}
}
