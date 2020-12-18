package com.lec.controller;

import java.text.SimpleDateFormat;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.lec.dto.memberDTO;
import com.lec.service.memberService;

@RestController
public class MemRestController {

	private static final String LOGIN = "login";
	
	@Autowired
	memberService memservice;
	
	private static final Logger logger = LoggerFactory.getLogger(MemRestController.class);
	
	@PostMapping("/register")
    public boolean register(memberDTO dto) {
    	logger.debug("register controller ¡¯¿‘");
    	boolean registerOk = memservice.register(dto);
    	
        return registerOk;
    } 
	
	 @PostMapping("login")
	    public void login(Model model, memberDTO dto, HttpServletRequest request) {
	    	memberDTO memberdto = memservice.login(dto);
	    	HttpSession session = request.getSession();
	        
	        if(memberdto.getUserid().equals("admin")) {
	        	session.setAttribute(LOGIN, memberdto.getUserid());
	        }else {
	        	String strDate = null;
	        	SimpleDateFormat tranSimpleFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm", Locale.ENGLISH);
	        	strDate = tranSimpleFormat.format(memberdto.getSignupdate());
	        	
	        	session.setAttribute(LOGIN, memberdto.getUserid());
	        	session.setAttribute("name", memberdto.getName());
	        	session.setAttribute("email", memberdto.getEmail());
	        	session.setAttribute("phone", memberdto.getPhone());
	        	session.setAttribute("zipcode", memberdto.getZipcode());
	        	session.setAttribute("add1", memberdto.getAddress1());
	        	session.setAttribute("add2", memberdto.getAddress2());
	        	session.setAttribute("signupdate", strDate);
	        	session.setAttribute("status", memberdto.getStatus());
	        	
	        }
			
	    }
	
	
}
