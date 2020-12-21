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
	//�ߺ�üũ
	@Override
	public boolean getMemUserid(String userid) {
		logger.debug("���̵� �ߺ�üũ :: service -> dao ��û");
		String getId = dao.getMemUserid(userid);
		if(!getId.equals("") && getId != null) return true;
		
		return false;
	}
	
	//���� �ߺ� üũ
	@Override
	public String chkMemEmail(String email){
		logger.debug("chkMemEmail :: service -> dao ��û ["+email+"]");
		String getMail = dao.chkMemEmail(email);
//		if(!getMail.equals("") && getMail != null) return getMail;
		
		return getMail;
	}
	
	//ȸ������
	@Override
	public boolean register(memberDTO dto){
		logger.debug("register :: service -> dao ��û");		
		return dao.register(dto);
	}
	
	//�α���
	@Override
	public memberDTO login(memberDTO dto){
		logger.debug("login :: service -> dao ��û");
		return dao.login(dto);
	}
	
	//ȸ����������
	@Override
	public void updateMemInfo(memberDTO dto){
		logger.debug("updateMemInfo :: service -> dao ��û");
		dao.updateMemInfo(dto);
	}
	
//	//���̵�ã��
//	//��й�ȣã��
//	//Ż���ϱ�
}
