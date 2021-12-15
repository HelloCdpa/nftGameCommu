package com.phl.nft.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index() {
		
		return "index";
	}
	
	@RequestMapping(value = "/member/join", method = RequestMethod.GET)
	public String joinForm() {
		return "/member/join";
	}
	
	@RequestMapping(value = "/board/save", method = RequestMethod.GET)
	public String saveForm() {
		return "/board/save";
	}
	
	
	
}
