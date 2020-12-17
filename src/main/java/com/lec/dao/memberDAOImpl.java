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
	
	//���̵� �ߺ�üũ
	
	//���� �ߺ�üũ
	
	//ȸ������
	@Override
	public boolean register(memberDTO dto){
		logger.debug("dao -> mapper ������ ���� :: register");
		int cnt = sqlSession.insert("register", dto);
		if(cnt > 0) logger.debug("register success");
		else logger.debug("register fail");
		
		return cnt > 0 ? true : false;
	}
	
	//�α���
	
	//ȸ������ ����
	
	
	//���̵�ã��
	//��й�ȣã��
	//Ż���ϱ�
}
