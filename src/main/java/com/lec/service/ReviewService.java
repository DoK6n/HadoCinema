package com.lec.service;
import java.util.List;

import com.lec.dto.ReviewDTO;
import com.lec.dto.SearchCriteria;

public interface ReviewService {

	// 게시글 작성
	public void writeReview(ReviewDTO reviewDTO) throws Exception;

	// 게시물 목록 조회
	public List<ReviewDTO> list(SearchCriteria scri) throws Exception;
	
	// 게시물 총 갯수
	public int listCount(SearchCriteria scri) throws Exception;
	

}
