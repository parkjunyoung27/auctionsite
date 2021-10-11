package com.quicktion.service;

import java.util.Map;

import org.springframework.stereotype.Service;

@Service
public interface LoginService {
	
	public Map<String, Object> login(Map<String,Object> map);

}
