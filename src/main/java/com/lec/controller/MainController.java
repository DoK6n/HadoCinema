package com.lec.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	@RequestMapping("/main")
	public String main() {
		
		return "main/main";
	}
	
	@RequestMapping("/testheader")
	public String testheader() {
		return "main/testheader";
	}
	
}
