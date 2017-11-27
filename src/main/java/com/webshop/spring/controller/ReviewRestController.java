package com.webshop.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.webshop.spring.manager.ReviewManager;
import com.webshop.spring.model.Review;
import com.webshop.spring.model.User;

@RestController
public class ReviewRestController {
	
	@Autowired
	private ReviewManager reviewManager;
	
	@RequestMapping(value="/reviews",consumes = "application/json", method=RequestMethod.POST)
	public void persistReview(@RequestBody Review review) {
		User user = new User();
		user.setId(1);
		review.setUser(user);
		
		reviewManager.persistReview(review);
	}
}
