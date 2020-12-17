package com.lec.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.lec.dto.memberDTO;
import com.lec.service.memberService;

@RestController
public class MemRestController {

	@Autowired
	memberService memservice;
	
	private static final Logger logger = LoggerFactory.getLogger(MemRestController.class);
	
	@PostMapping("/register")
    public boolean register(memberDTO dto) {
    	logger.debug("register controller ¡¯¿‘");
    	boolean registerOk = memservice.register(dto);
    	
        return registerOk;
    }
	
}
