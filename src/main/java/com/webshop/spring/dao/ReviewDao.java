package com.webshop.spring.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.webshop.spring.model.Review;

public interface ReviewDao extends JpaRepository<Review, Integer>{
	List<Review> findByProductId(Integer id);
}
