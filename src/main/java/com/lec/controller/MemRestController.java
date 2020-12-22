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
import org.springframework.web.bind.annotation.PathVariable;
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
	
    @GetMapping("member/{userid}")
    public String getMemUserid(@PathVariable("userid") String id, Model model) {
    	logger.debug("> IN [getMemUserid]");
    	boolean getId = memservice.getMemUserid(id);
    	model.addAttribute("chkId", getId);
    	
    	return getId + "";
    }
    
    @GetMapping("register/{email:.+}")
    public String chkMemEmail(@PathVariable("email") String email) {
    	logger.debug("> IN [chkMemEmail]");
    	String getMail = memservice.chkMemEmail(email);
    	
    	return getMail;
    }
	
	@PostMapping("/register")
    public boolean register(memberDTO dto) {
    	logger.debug("> IN [register]");
    	boolean registerOk = memservice.register(dto);
    	
        return registerOk;
    } 
	
	@PostMapping("login")
    public void login(Model model, memberDTO dto, HttpServletRequest request) {
		logger.debug("> IN [login]");
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
	 
    @GetMapping("logout")
    public ModelAndView logout(HttpServletRequest request) {
    	logger.debug("> IN [logout]");
        HttpSession session = request.getSession();
        
        if (session.getAttribute(LOGIN) != null) session.invalidate(); // session delete
        
        ModelAndView mav = new ModelAndView("main/main"); 
        mav.setViewName("redirect:/main");	
        return mav;
    }
	
    @PostMapping("/update")
    public void update(memberDTO dto, HttpServletRequest request) {
    	logger.debug("> IN [update]");
    	HttpSession session = request.getSession();
    	memservice.updateMemInfo(dto);
    	
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
