package com.webshop.spring.daoImpl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.webshop.spring.dao.AbstractDao;
import com.webshop.spring.dao.ReviewDao;
import com.webshop.spring.model.Review;

@Repository("reviewDao")
public class ReviewDaoImpl extends AbstractDao<Integer, Review>implements ReviewDao{

	@Override
	public void persistReview(Review review) {
		super.persist(review);
	}

	@Override
	public List<Review> getReviews(Integer id, String criteria) {
		return super.getListById(id, criteria);
	}

}
