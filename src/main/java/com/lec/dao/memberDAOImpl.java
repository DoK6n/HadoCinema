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

	//userid double check
	@Override
	public String getMemUserid(String userid){
		String getId = sqlSession.selectOne("getMemUserid", userid);
		if(getId == null) getId = "";
		
		return getId;
	}

	//email double check
	@Override
	public String chkMemEmail(String email) {
		String chkMemEmail = sqlSession.selectOne("chkMemEmail", email);
		if(chkMemEmail == null) chkMemEmail = "";
		
		return chkMemEmail;
	}	
	
	//register
	@Override
	public boolean register(memberDTO dto){
		int cnt = sqlSession.insert("register", dto);
		
		return cnt > 0 ? true : false;
	}
	
	//login
	@Override
	public memberDTO login(memberDTO dto){
		memberDTO loginInfo = new memberDTO();
		loginInfo = sqlSession.selectOne("login", dto);
		
		return loginInfo;
	}
	
	//update member info
	@Override
    public void updateMemInfo(memberDTO dto) {
		sqlSession.update("updateMemInfo", dto); 
    }
}
