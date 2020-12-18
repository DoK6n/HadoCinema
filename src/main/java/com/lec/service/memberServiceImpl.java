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
	
	//���� �ߺ� üũ

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
	
//	//���̵�ã��
//	//��й�ȣã��
//	//Ż���ϱ�
}
