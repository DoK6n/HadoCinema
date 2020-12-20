package com.lec.service;


import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.lec.dao.CsDAO;
import com.lec.dto.Criteria;
import com.lec.dto.CsDTO;



@Service
public class CsServiceImpl implements CsService {

	@Inject
	private CsDAO dao;
	
	// 게시글 작성
	@Override
	public void write(CsDTO csDTO) throws Exception {
		dao.write(csDTO);
	}
	
	// 게시글 답변  update [ 관리자 ]
	@Override
	public void answer(CsDTO csDTO) throws Exception {
		dao.answer(csDTO);
	}



	// 게시물 목록 조회
	@Override
	public List<CsDTO> list(Criteria cri) throws Exception {

		return dao.list(cri);
	}

	
	// 게시물 총 갯수
	@Override
	public int listCount() throws Exception {
		return dao.listCount();
	}
	

	// 게시물 읽기
	@Override
	public CsDTO read(int cs_uid) throws Exception {

		return dao.read(cs_uid);
	}
}















