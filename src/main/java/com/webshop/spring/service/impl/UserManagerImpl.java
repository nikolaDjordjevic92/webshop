package com.webshop.spring.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webshop.spring.dao.UserDao;
import com.webshop.spring.service.UserManager;
import com.webshop.spring.model.User;

@Service
public class UserManagerImpl implements UserManager{
	
	@Autowired
	UserDao userDao;
	
	@Override
	public User findByUsername(String username) {
		return userDao.findByUsername(username);
	}

}
