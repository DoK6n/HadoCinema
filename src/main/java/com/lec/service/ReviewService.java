package com.lec.service;
import java.util.List;

import com.lec.dto.ReviewDTO;
import com.lec.dto.ReviewDTO2;
import com.lec.dto.SearchCriteria;

public interface ReviewService {

	// 게시글 작성
	public void writeReview(ReviewDTO reviewDTO) throws Exception;

	// 게시물 목록 조회
	public List<ReviewDTO> list(SearchCriteria scri) throws Exception;
	
	// 게시물 총 갯수
	public int listCount(SearchCriteria scri) throws Exception;
	
	// 크롤링 게시물 목록 조회
	public List<ReviewDTO2> listC(SearchCriteria scri) throws Exception;
	
	// 크롤링 게시물 총 갯수
	public int listCountC(SearchCriteria scri) throws Exception;
	
	// 리뷰 크롤링 하기
	public void writeReviewC(ReviewDTO2 reviewDTO2) throws Exception;


}
