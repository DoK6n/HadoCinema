package com.lec.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.dto.ReviewDTO;
import com.lec.service.ReviewService;

@Controller
public class ReviewController {

	
	@Inject
	ReviewService service;
	
	// 게시판 글 작성 화면 , review - writeReview.jsp
	
	@RequestMapping(value = "/review/writeReview", method = RequestMethod.GET)
	public void writeReview() throws Exception{
		
	}
	
	
	// 게시판 글 작성	
	@RequestMapping(value = "/review/writeReviewOk", method = RequestMethod.POST)
	public String writeReviewOk(ReviewDTO reviewDTO) throws Exception{
		
		service.writeReview(reviewDTO);
		
		return "redirect:/review/writeReview";
	}

}	

