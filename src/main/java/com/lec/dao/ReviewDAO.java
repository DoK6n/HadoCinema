package com.lec.dao;

import com.lec.dto.ReviewDTO;


public interface ReviewDAO {

	// 게시글 작성
	public void writeReview(ReviewDTO reviewDTO) throws Exception;
}
