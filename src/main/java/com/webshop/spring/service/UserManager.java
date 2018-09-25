package com.webshop.spring.service;

import com.webshop.spring.model.User;

public interface UserManager {
	User findByUsername(String username);
}
