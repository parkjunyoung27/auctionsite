package com.quicktion.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.quicktion.service.LoginServiceImpl;

@Controller
public class LoginController {

	@Resource(name="loginService")
	private LoginServiceImpl loginService;
	
	@GetMapping("/login.do")
	public String login() {
		return "login";
	}
	
}
