package src.main.java.com.webshop.spring.service.copy;


import com.webshop.spring.model.Order;

public interface OrderManager {
	Order getNewOrder();
	void makeNewOrder(Order o);
}
