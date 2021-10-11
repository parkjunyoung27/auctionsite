package com.quicktion.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.quicktion.common.CommandMap;
import com.quicktion.service.LoginServiceImpl;

@Controller
public class LoginController {

	@Resource(name="loginService")
	private LoginServiceImpl loginService;
	
	//로그인하기
	@GetMapping("/login.do")
	public String login() {
		return "login";
	}
	
	//회원가입하기
	@GetMapping("/join.do")
	public String join() {
		return "join";
	}
	
	//회원가입하기
	@PostMapping("/login.do")
	public String join(CommandMap commandMap, HttpServletRequest request) {
		
		Map<String,Object> login = loginService.login(commandMap.getMap());
		System.out.println("나온 값 : " + login);
		
		if(login != null) {
		HttpSession session = request.getSession();
		session.setAttribute("name", login.get("member_name"));
		session.setAttribute("id", login.get("member_id"));
		session.setAttribute("level", login.get("user_level"));		
			return "redirect:/index.do";			
		}
		return "redirect:/login.do";
		
	}
	
	//id 찾기 
	@GetMapping("/idSearch.do")
	public String idSearch() {
		return "idSearch";
	}
	
	//패스워드 찾기
	@GetMapping("/pwSearch.do")
	public String pwSearch() {
		return "pwSearch";
	}
	
}
