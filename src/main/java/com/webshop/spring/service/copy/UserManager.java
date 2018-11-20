package src.main.java.com.webshop.spring.service.copy;

import com.webshop.spring.model.User;

public interface UserManager {
	User findByUsername(String username);
}
