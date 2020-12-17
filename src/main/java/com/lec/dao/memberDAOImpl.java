package com.lec.dao;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lec.controller.MemRestController;
import com.lec.dto.memberDTO;

@Repository
public class memberDAOImpl implements memberDAO{

	@Autowired
	private SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(MemRestController.class);
	
	//아이디 중복체크
	
	//메일 중복체크
	
	//회원가입
	@Override
	public boolean register(memberDTO dto){
		logger.debug("dao -> mapper 데이터 생성 :: register");
		int cnt = sqlSession.insert("register", dto);
		if(cnt > 0) logger.debug("register success");
		else logger.debug("register fail");
		
		return cnt > 0 ? true : false;
	}
	
	//로그인
	
	//회원정보 수정
	
	
	//아이디찾기
	//비밀번호찾기
	//탈퇴하기
}
