package com.lec.service;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.lec.controller.MemRestController;
import com.lec.dao.memberDAO;
import com.lec.dto.memberDTO;

@Service
public class memberServiceImpl implements memberService{

	@Inject
	private memberDAO dao;
	
	private static final Logger logger = LoggerFactory.getLogger(MemRestController.class);

	//update member info
	@Override
	public boolean getMemUserid(String userid) {
		String getId = dao.getMemUserid(userid);
		if(!getId.equals("") && getId != null) return true;
		
		return false;
	}
	
	//email double check
	@Override
	public String chkMemEmail(String email){
		String getMail = dao.chkMemEmail(email);
		
		return getMail;
	}
	
	//register
	@Override
	public boolean register(memberDTO dto){
		return dao.register(dto);
	}
	
	//login
	@Override
	public memberDTO login(memberDTO dto){
		return dao.login(dto);
	}
	
	//update member info
	@Override
	public void updateMemInfo(memberDTO dto){
		dao.updateMemInfo(dto);
	}
}
