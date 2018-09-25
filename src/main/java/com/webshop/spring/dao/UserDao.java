package com.webshop.spring.dao;


import org.springframework.data.jpa.repository.JpaRepository;

import com.webshop.spring.model.User;

public interface UserDao extends JpaRepository<User, Integer>{
	User findByUsername(String name);
}
