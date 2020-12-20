package com.lec.dto;

import java.util.Date;

public class CsDTO {
	
	private String cs_memid;
	private int cs_uid;
	private Date cs_regdate;
	private String cs_status;
	private String cs_subject;
	private String cs_content;
	private String cs_answer;
	
	
	public String getCs_answer() {
		return cs_answer;
	}
	public void setCs_answer(String cs_answer) {
		this.cs_answer = cs_answer;
	}
	public String getCs_memid() {
		return cs_memid;
	}
	public void setCs_memid(String cs_memid) {
		this.cs_memid = cs_memid;
	}
	public int getCs_uid() {
		return cs_uid;
	}
	public void setCs_uid(int cs_uid) {
		this.cs_uid = cs_uid;
	}
	public Date getCs_regdate() {
		return cs_regdate;
	}
	public void setCs_regdate(Date cs_regdate) {
		this.cs_regdate = cs_regdate;
	}
	public String getCs_status() {
		return cs_status;
	}
	public void setCs_status(String cs_status) {
		this.cs_status = cs_status;
	}
	public String getCs_subject() {
		return cs_subject;
	}
	public void setCs_subject(String cs_subject) {
		this.cs_subject = cs_subject;
	}
	public String getCs_content() {
		return cs_content;
	}
	public void setCs_content(String cs_content) {
		this.cs_content = cs_content;
	}
	
	@Override
	public String toString() {
		return "CsDTO [cs_memid=" + cs_memid + ", cs_uid=" + cs_uid + ", cs_regdate=" + cs_regdate + ", cs_status="
				+ cs_status + ", cs_subject=" + cs_subject + ", cs_content=" + cs_content + "]";
	}


}
