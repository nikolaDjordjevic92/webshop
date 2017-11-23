package com.webshop.spring.managerImpl;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webshop.spring.dao.UserDao;
import com.webshop.spring.manager.UserManager;
import com.webshop.spring.model.User;

@Service("userManager")
@Transactional
public class UserManagerImpl implements UserManager{
	
	@Autowired
	UserDao userDao;
	
	@Override
	public User findByUsername(String username) {
		return userDao.findByUsername(username);
	}

}
