package com.lec.dto;


import java.util.Date;

import lombok.Data;
@Data
public class memberDTO{
	
	private int uid;      
	private String userid;
	private String userpw;
	private String name;
	private String email;
	private String phone;
	private String zipcode;
	private String address1;
	private String address2;
	private Date   signupdate;
	private String status;
	private String booking;
	private String cancle;
	private int point;
}