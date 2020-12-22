package com.lec.service;

import com.lec.dto.memberDTO;

public interface memberService {

	//userid double check
	public boolean getMemUserid(String userid);

	//email double check
	public String chkMemEmail(String email);

	public boolean register(memberDTO dto);

	public memberDTO login(memberDTO dto);

	//update member info
	public void updateMemInfo(memberDTO dto);


}
