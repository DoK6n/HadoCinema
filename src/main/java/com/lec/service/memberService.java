package com.lec.service;

import com.lec.dto.memberDTO;

public interface memberService {

	//���̵� �ߺ�üũ

	//���� �ߺ� üũ

	//ȸ������
	public boolean register(memberDTO dto);

	//�α���
	public memberDTO login(memberDTO dto);

	public void updateMemInfo(memberDTO dto);

	public boolean getMemUserid(String userid);

	public String chkMemEmail(String email);

	//ȸ����������
	
//	//���̵�ã��
//	//��й�ȣã��
//	//Ż���ϱ�

}
