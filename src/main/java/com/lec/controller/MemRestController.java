package com.lec.controller;

import java.text.SimpleDateFormat;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

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
    	logger.debug("register controller 진입");
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
	 
	// 로그아웃
    @GetMapping("logout")
    public ModelAndView logout(HttpServletRequest request) {
        HttpSession session = request.getSession();
        
        if (session.getAttribute(LOGIN) != null) {
        	session.invalidate(); // 세션 초기화
        }
        ModelAndView mav = new ModelAndView("main/main"); //main/main.jsp를 뿌려준다.
        mav.setViewName("redirect:/main");	// url 경로 /main으로 변경 안하면 /logout
        return mav;
    }
	
    // 내 정보 수정
    @PostMapping("/update")
    public void update(memberDTO dto, HttpServletRequest request) {
    	logger.debug("update controller 진입");
    	HttpSession session = request.getSession();
    	memservice.updateMemInfo(dto);
    	
    	logger.debug("세션으로 전송대기["+dto.getName()+"]");
    	session.setAttribute(LOGIN, dto.getUserid());
    	session.setAttribute("name", dto.getName());
    	session.setAttribute("email", dto.getEmail());
    	session.setAttribute("phone", dto.getPhone());
    	session.setAttribute("zipcode", dto.getZipcode());
    	session.setAttribute("add1", dto.getAddress1());
    	session.setAttribute("add2", dto.getAddress2());
    	session.setAttribute("status", dto.getStatus());
    	
    }
	
	
}
