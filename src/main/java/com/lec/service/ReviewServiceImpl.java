package com.lec.service;
import javax.inject.Inject;

import org.springframework.stereotype.Service;
import com.lec.dao.ReviewDAO;
import com.lec.dto.ReviewDTO;


@Service
public class ReviewServiceImpl implements ReviewService {

	@Inject
	private ReviewDAO dao;
	
	// 게시글 작성
	@Override
	public void writeReview(ReviewDTO reviewDTO) throws Exception {
		dao.writeReview(reviewDTO);
	}

}

