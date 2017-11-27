package com.webshop.spring.dao;

import java.util.List;

import com.webshop.spring.model.Review;

public interface ReviewDao {
	void persistReview(Review review);
	List<Review> getReviews(Integer id, String criteria);
}
