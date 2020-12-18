package com.lec.dto;

public class Criteria {
	
	private int page;
	private int perPageNum;
	private int rowStart;
	private int rowEnd;
	private int r_movie_uid;
	
	public Criteria() {
		this.page = 1;
		this.perPageNum = 12;
	}
	
	public void setPage(int page) {
		if (page <= 0) {
			this.page = 1;
			return;
		}
		this.page = page;
	}
	
	public int getR_movie_uid() {
		return r_movie_uid;
	}

	public void setR_movie_uid(int r_movie_uid) {
		this.r_movie_uid = r_movie_uid;
	}

	public void setPerPageNum(int perPageNum) {
		if (perPageNum <= 0 || perPageNum > 100) {
			this.perPageNum = 12;
			return;
		}
		this.perPageNum = perPageNum;
	}
	
	public int getPage() {
		return page;
	}
	
	public int getPageStart() {
		return (this.page - 1) * perPageNum;
	}
	
	public int getPerPageNum() {
		return this.perPageNum;
	}
	
	public int getRowStart() {
		rowStart = ((page - 1) * perPageNum) + 1;
		return rowStart;
	}
	
	public int getRowEnd() {
		rowEnd = rowStart + perPageNum - 1;
		return rowEnd;
	}

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + ", rowStart=" + rowStart + ", rowEnd=" + rowEnd
				+ "]";
	}
	
	
}