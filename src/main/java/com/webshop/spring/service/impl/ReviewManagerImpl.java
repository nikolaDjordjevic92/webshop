package com.webshop.spring.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webshop.spring.dao.ReviewDao;
import com.webshop.spring.service.ReviewManager;
import com.webshop.spring.model.Review;

@Service
public class ReviewManagerImpl implements ReviewManager {

	@Autowired
	private ReviewDao reviewDao;
	
	@Override
	public void persistReview(Review review) {
		reviewDao.save(review);
	}

	@Override
	public List<Review> getReviews(Integer id) {
		return reviewDao.findByProductId(id);
	}

}
