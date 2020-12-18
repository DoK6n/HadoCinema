package com.lec.service;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.lec.controller.MemRestController;
import com.lec.dao.memberDAO;
import com.lec.dto.memberDTO;

@Repository
public class memberServiceImpl implements memberService{

	@Inject
	private memberDAO dao;
	
	private static final Logger logger = LoggerFactory.getLogger(MemRestController.class);
	//중복체크
	
	//메일 중복 체크

	//회원가입
	@Override
	public boolean register(memberDTO dto){
		logger.debug("register :: service -> dao 요청");		
		return dao.register(dto);
	}
	
	//로그인
	@Override
	public memberDTO login(memberDTO dto){
		logger.debug("login :: service -> dao 요청");
		return dao.login(dto);
	}
	
	//회원정보수정
	
//	//아이디찾기
//	//비밀번호찾기
//	//탈퇴하기
}
