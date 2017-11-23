package com.webshop.spring.manager;

import com.webshop.spring.model.User;

public interface UserManager {
	User findByUsername(String username);
}
