package com.lec.dao;

import java.util.List;

import com.lec.dto.memberDTO;

public interface memberDAO {
	
		//���̵� �ߺ�üũ

		//���� �ߺ� üũ
	
		//ȸ������
		public boolean register(memberDTO dto);
		
		//�α���

		//ȸ����������

//		//���̵�ã��
//		public String findMemUserid(memberDTO dto);
//		//��й�ȣã��
//		public String findMemUserpw(memberDTO dto);
//		//Ż���ϱ�
//		public void withdrawMem(memberDTO dto);
}