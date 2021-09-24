package com.quicktion.web.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginService {

	@Autowired
	private LoginDAO loginDAO;

	public LoginDTO login(LoginDTO dto) {
		return loginDAO.login(dto);
	}

	public int idCheck(String id) {
		return loginDAO.idCheck(id);
	}

	public int insertJoin(LoginDTO dto) {
		return loginDAO.insertJoin(dto);
	}

	
	
}
