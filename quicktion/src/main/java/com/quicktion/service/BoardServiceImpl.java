package com.quicktion.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quicktion.dao.BoardDAO;
import com.quicktion.dto.BoardDTO;

@Service("boardService")
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardDAO boardDAO;
	
	@Override
	public List<Map<String, Object>> boardList(Map<String, Object> sendMap) {
		return boardDAO.boardList(sendMap);
	}

	@Override
	public List<HashMap<String, Object>> boardCategoryList() {
		return boardDAO.boardCategoryList();
	}

	@Override
	public void write() {
		
	}

	@Override
	public BoardDTO detail() {
		return null;
	}

	@Override
	public void countUp() {
		
	}

	@Override
	public void delete() {
		
	}

}
