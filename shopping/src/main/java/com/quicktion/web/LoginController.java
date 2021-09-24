package com.quicktion.web;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quicktion.web.login.LoginDTO;
import com.quicktion.web.login.LoginService;
import com.quicktion.web.util.Util;

@Controller
public class LoginController {
	@Autowired
	private LoginService loginService;
	
	@RequestMapping("/login")
	public String login() {
		
		return "login";
	}

	@PostMapping("/")
	public String loginAction(HttpServletRequest request) {
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
//		System.out.println("입력된 id : " + id + " pw : " + pw);
		
		LoginDTO dto = new LoginDTO();
		dto.setMember_id(id);
		dto.setMember_pw(pw);
		
		LoginDTO result = loginService.login(dto);
		
		if(result != null) {
			
			HttpSession session = request.getSession();
			session.setAttribute("id", result.getMember_id());
			session.setAttribute("grade", result.getMember_level());
			
			return "redirect:/";			
		}else {
			return "redirect:/login?error=loginerror"; //로그인 실패
		}	
	}
	
	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		//session.invalidate();
		if(session.getAttribute("id") != null) {
			session.removeAttribute("id");
		}
		
		return "redirect:/";
	}
	
	@GetMapping("/join")
	public String join(HttpServletRequest request) {
		
		return "join";
	}
	
	@PostMapping("/idCheck")
	public void idCheck(HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("id 중복확인 요청 들어왔습니다.");
		int result = 1;
		String id = request.getParameter("id");
		System.out.println("들어온 id : "+ id);
		
		result = loginService.idCheck(id);
		System.out.println("중복된 ID의 수 : " + result);
		
		PrintWriter pw = response.getWriter();
		pw.print(result);	
	}
	
	@PostMapping("/join")
	public String joinAction(HttpServletRequest request) {
		
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String pw = request.getParameter("pw1");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String date = request.getParameter("date2");
		
		LoginDTO dto = new LoginDTO();
		dto.setMember_id(id);
		dto.setMember_name(name);
		dto.setMember_pw(pw);
		dto.setMember_email(email);
		dto.setMember_address(address);
		dto.setMember_phone(phone);
		dto.setMember_birth(date);
		
		int result = loginService.insertJoin(dto);
		System.out.println("회원 "+result+"분이 추가되었습니다.");
		
		return "redirect:/login";
	}
	
}
