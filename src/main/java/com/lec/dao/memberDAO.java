package com.lec.dao;

import com.lec.dto.memberDTO;

public interface memberDAO {
	
	//userid double check
	public String getMemUserid(String userid);

	//email double check
	public String chkMemEmail(String email);

	public boolean register(memberDTO dto);
		
	public memberDTO login(memberDTO dto);

	//update member info
	public void updateMemInfo(memberDTO dto);



}