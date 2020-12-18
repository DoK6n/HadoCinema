package com.lec.dao;

import com.lec.dto.memberDTO;

public interface memberDAO {
	
		//아이디 중복체크

		//메일 중복 체크
	
		//회원가입
		public boolean register(memberDTO dto);

		//로그인
		public memberDTO login(memberDTO dto);

		//회원정보수정

//		//아이디찾기
//		public String findMemUserid(memberDTO dto);
//		//비밀번호찾기
//		public String findMemUserpw(memberDTO dto);
//		//탈퇴하기
//		public void withdrawMem(memberDTO dto);
}