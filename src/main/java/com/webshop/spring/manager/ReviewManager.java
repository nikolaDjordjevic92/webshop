package com.webshop.spring.manager;

import java.util.List;

import com.webshop.spring.model.Review;

public interface ReviewManager {
	void persistReview(Review review);
	List<Review> getReviews(Integer id, String criteria);
}
