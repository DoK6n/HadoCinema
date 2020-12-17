package com.lec.dao;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.lec.dto.ReviewDTO;


@Repository
public class ReviewDAOImpl implements ReviewDAO {

	@Inject
	private SqlSession sqlSession;
	
	// 게시글 작성
	@Override
	public void writeReview(ReviewDTO reviewDTO) throws Exception {
		sqlSession.insert("reviewMapper.insert", reviewDTO);		
	}
}
