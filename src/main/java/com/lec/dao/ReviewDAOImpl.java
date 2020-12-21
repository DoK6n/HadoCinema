package com.lec.dao;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.lec.dto.ReviewDTO;
import com.lec.dto.ReviewDTO2;
import com.lec.dto.SearchCriteria;


@Repository
public class ReviewDAOImpl implements ReviewDAO {

	@Inject
	private SqlSession sqlSession;
	
	// 게시글 작성
	@Override
	public void writeReview(ReviewDTO reviewDTO) throws Exception {
		sqlSession.insert("reviewMapper.insert", reviewDTO);		
	}
	
	// 게시물 목록 조회
	@Override
	public List<ReviewDTO> list(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("reviewMapper.listPage", scri);
	}
	
	// 게시물 총 갯수
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("reviewMapper.listCount", scri);
	}

	// 크롤링 게시물 목록 조회
	@Override
	public List<ReviewDTO2> listC(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("review2Mapper.listPageC", scri);
	}
	
	// 크롤링 게시물 총 갯수
	@Override
	public int listCountC(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("review2Mapper.listCountC", scri);
	}
	
	// 리뷰 크롤링 하기
	@Override
	public void writeReviewC(ReviewDTO2 reviewDTO2) throws Exception {
		sqlSession.insert("review2Mapper.insertC", reviewDTO2);
		
	}

}
