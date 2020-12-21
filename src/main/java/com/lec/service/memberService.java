package com.lec.service;

import com.lec.dto.memberDTO;

public interface memberService {

	//아이디 중복체크

	//메일 중복 체크

	//회원가입
	public boolean register(memberDTO dto);

	//로그인
	public memberDTO login(memberDTO dto);

	public void updateMemInfo(memberDTO dto);

	public boolean getMemUserid(String userid);

	public String chkMemEmail(String email);

	//회원정보수정
	
//	//아이디찾기
//	//비밀번호찾기
//	//탈퇴하기

}
