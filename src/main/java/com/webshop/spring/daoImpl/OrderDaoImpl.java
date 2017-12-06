package com.webshop.spring.daoImpl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.webshop.spring.dao.AbstractDao;
import com.webshop.spring.dao.OrderDao;
import com.webshop.spring.model.Order;


@Repository("orderDao")
public class OrderDaoImpl extends AbstractDao<Integer, Order> implements OrderDao {
	@Override
	public List<Order> getNewOrder() {
		System.out.println("a");
		return (List<Order>)getQuery("FROM Order WHERE order_date=NULL");
	}

	@Override
	public void makeNewOrder(Order o) {
		persist(o);
	}
}
