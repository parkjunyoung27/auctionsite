package com.quicktion.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

@Service
public interface IndexService {
	
	List<Map<String, Object>> boardList();
	
}
