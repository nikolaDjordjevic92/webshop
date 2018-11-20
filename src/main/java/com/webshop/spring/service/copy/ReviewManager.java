package src.main.java.com.webshop.spring.service.copy;

import java.util.List;

import com.webshop.spring.model.Review;

public interface ReviewManager {
	void persistReview(Review review);
	List<Review> getReviews(Integer id);
}
