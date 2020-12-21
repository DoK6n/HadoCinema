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
	@Override
	public String getMemUserid(String userid){
		logger.debug("dao -> mapper 데이터 요청 :: getMemUserid");
		String getId = sqlSession.selectOne("getMemUserid", userid);
		if(getId == null) {
			getId = "";
			logger.debug("getMemUserid mapper -> " + getId + " :: success");
		}else {
			logger.debug("getMemUserid mapper : " + getId + " :: fail");
		}
		return getId;
	}

	//메일 중복 체크
	@Override
	public String chkMemEmail(String email) {
		logger.debug("dao -> mapper 데이터 요청  [" + email + "] :: chkMemEmail");
		String chkMemEmail = sqlSession.selectOne("chkMemEmail", email);
		if(chkMemEmail == null) {
			chkMemEmail = "";
			logger.info("chkMemEmail mapper -> [" + chkMemEmail + "] :: success");
		}else {
			logger.info("chkMemEmail mapper -> [" + chkMemEmail + "] :: fail");
		}
		return chkMemEmail;
	}	
	
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
	@Override
	public memberDTO login(memberDTO dto){
		logger.debug("dao -> mapper 데이터 요청 :: login");
		memberDTO loginInfo = new memberDTO();
		loginInfo = sqlSession.selectOne("login", dto);
		logger.info("login mapper -> [" + loginInfo.getName()+"]");
		
		return loginInfo;
	}
	
	//회원정보 수정
	@Override
    public void updateMemInfo(memberDTO dto) {
		logger.debug("dao -> mapper 데이터 수정 :: updateMemInfo");
		sqlSession.update("updateMemInfo", dto); 
		logger.debug("updateMemInfo mapper -> ");
		
		logger.info(">> 받은 파라미터 dto 값 [" + dto.getName() + "]");
    }
	
	//회원정보 수정
	
	
	//아이디찾기
	//비밀번호찾기
	//탈퇴하기
}
