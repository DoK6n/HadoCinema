package com.lec.dao;


import java.util.List;

import com.lec.dto.Criteria;
import com.lec.dto.CsDTO;



public interface CsDAO {

	// 게시글 작성
	public void write(CsDTO csDTO) throws Exception;
	
	// 게시글 답변 [ 관리자 ]
	public void answer(CsDTO csDTO) throws Exception;
	

	// 게시물 목록 조회
	public List<CsDTO> list(Criteria cri) throws Exception;

	// 게시물 총 갯수
	public int listCount() throws Exception;

	// 게시물 조회
	public CsDTO read(int cs_uid) throws Exception;
}
