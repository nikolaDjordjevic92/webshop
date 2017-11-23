package com.webshop.spring.dao;

import com.webshop.spring.model.User;

public interface UserDao {
	User findByUsername(String name);
}
