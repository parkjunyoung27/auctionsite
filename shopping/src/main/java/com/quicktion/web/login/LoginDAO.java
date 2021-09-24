package com.quicktion.web.login;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LoginDAO {
	@Autowired
	private SqlSession sqlSession;

	public LoginDTO login(LoginDTO dto) {
		return sqlSession.selectOne("login.login", dto);
	}

	public int idCheck(String id) {
		return sqlSession.selectOne("login.idCheck", id);
	}

	public int insertJoin(LoginDTO dto) {
		return sqlSession.insert("login.insertJoin", dto);
	}
	
	
}
