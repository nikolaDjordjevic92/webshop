package com.webshop.spring.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.webshop.spring.manager.UserManager;
import com.webshop.spring.model.User;

public class CustomUserDetailsService implements UserDetailsService {

	@Autowired
	UserManager userManager;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		User user = userManager.findByUsername(username);
		
		if (user == null) {
			throw new UsernameNotFoundException("Username not found");
		}
		
		return new org.springframework.security.core.userdetails.User(user.getUsername(),user.getPassword(),true,true,true,true,null);
	}

}
