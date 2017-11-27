package com.webshop.spring.managerImpl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webshop.spring.dao.ReviewDao;
import com.webshop.spring.manager.ReviewManager;
import com.webshop.spring.model.Review;

@Service("reviewManager")
@Transactional
public class ReviewManagerImpl implements ReviewManager {

	@Autowired
	private ReviewDao reviewDao;
	
	@Override
	public void persistReview(Review review) {
		reviewDao.persistReview(review);
	}

	@Override
	public List<Review> getReviews(Integer id, String criteria) {
		return reviewDao.getReviews(id, criteria);
	}

}
