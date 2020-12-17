package com.lec.service;
import com.lec.dto.ReviewDTO;

public interface ReviewService {

	// 게시글 작성
	public void writeReview(ReviewDTO reviewDTO) throws Exception;


}
