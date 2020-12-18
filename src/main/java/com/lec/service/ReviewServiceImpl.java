package com.lec.service;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import com.lec.dao.ReviewDAO;
import com.lec.dto.ReviewDTO;
import com.lec.dto.SearchCriteria;


@Service
public class ReviewServiceImpl implements ReviewService {

	@Inject
	private ReviewDAO dao;
	
	// 게시글 작성
	@Override
	public void writeReview(ReviewDTO reviewDTO) throws Exception {
		dao.writeReview(reviewDTO);
	}
	
	// 게시물 목록 조회
	@Override
	public List<ReviewDTO> list(SearchCriteria scri) throws Exception {

		return dao.list(scri);
	}
	
	// 게시물 총 갯수
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return dao.listCount(scri);
	}

}

