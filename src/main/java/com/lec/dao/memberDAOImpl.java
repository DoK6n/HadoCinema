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
	@Override
	public String getMemUserid(String userid){
		logger.debug("dao -> mapper ������ ��û :: getMemUserid");
		String getId = sqlSession.selectOne("getMemUserid", userid);
		if(getId == null) {
			getId = "";
			logger.debug("getMemUserid mapper -> " + getId + " :: success");
		}else {
			logger.debug("getMemUserid mapper : " + getId + " :: fail");
		}
		return getId;
	}

	//���� �ߺ� üũ
	@Override
	public String chkMemEmail(String email) {
		logger.debug("dao -> mapper ������ ��û  [" + email + "] :: chkMemEmail");
		String chkMemEmail = sqlSession.selectOne("chkMemEmail", email);
		if(chkMemEmail == null) {
			chkMemEmail = "";
			logger.info("chkMemEmail mapper -> [" + chkMemEmail + "] :: success");
		}else {
			logger.info("chkMemEmail mapper -> [" + chkMemEmail + "] :: fail");
		}
		return chkMemEmail;
	}	
	
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
	@Override
	public memberDTO login(memberDTO dto){
		logger.debug("dao -> mapper ������ ��û :: login");
		memberDTO loginInfo = new memberDTO();
		loginInfo = sqlSession.selectOne("login", dto);
		logger.info("login mapper -> [" + loginInfo.getName()+"]");
		
		return loginInfo;
	}
	
	//ȸ������ ����
	@Override
    public void updateMemInfo(memberDTO dto) {
		logger.debug("dao -> mapper ������ ���� :: updateMemInfo");
		sqlSession.update("updateMemInfo", dto); 
		logger.debug("updateMemInfo mapper -> ");
		
		logger.info(">> ���� �Ķ���� dto �� [" + dto.getName() + "]");
    }
	
	//ȸ������ ����
	
	
	//���̵�ã��
	//��й�ȣã��
	//Ż���ϱ�
}
