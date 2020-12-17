package com.lec.dto;

import java.util.Date;

public class ReviewDTO {
	
	private String rMemId;
	private String rMovieName;
	private int reviewUid;
	private Date reviewRegdate;
	private String reviewContent;
	private int reviewGrade;
	private int reviewHeart;
	
	
	
	
	
	public String getrMemId() {
		return rMemId;
	}
	public void setrMemId(String rMemId) {
		this.rMemId = rMemId;
	}
	public String getrMovieName() {
		return rMovieName;
	}
	public void setrMovieName(String rMovieName) {
		this.rMovieName = rMovieName;
	}
	public int getReviewUid() {
		return reviewUid;
	}
	public void setReviewUid(int reviewUid) {
		this.reviewUid = reviewUid;
	}
	public Date getReviewRegdate() {
		return reviewRegdate;
	}
	public void setReviewRegdate(Date reviewRegdate) {
		this.reviewRegdate = reviewRegdate;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	public int getReviewGrade() {
		return reviewGrade;
	}
	public void setReviewGrade(int reviewGrade) {
		this.reviewGrade = reviewGrade;
	}
	public int getReviewHeart() {
		return reviewHeart;
	}
	public void setReviewHeart(int reviewHeart) {
		this.reviewHeart = reviewHeart;
	}
	


}
