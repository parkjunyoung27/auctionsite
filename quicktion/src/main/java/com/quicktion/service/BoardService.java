package com.quicktion.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.quicktion.dto.BoardDTO;

@Service
public interface BoardService {
	
	public List<Map<String, Object>> boardList(Map<String, Object> sendMap); 

	public List<HashMap<String, Object>> boardCategoryList();

	public void write();

	public BoardDTO detail();

	public void countUp();

	public void delete();


}
