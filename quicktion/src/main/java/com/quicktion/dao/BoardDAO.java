package com.quicktion.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.quicktion.dto.BoardDTO;

@Repository("boardDAO")
public class BoardDAO extends AbstractDAO{
	
	public List<Map<String, Object>> boardList(Map<String, Object> sendMap) {
		return selectList("board.boardList", sendMap);
	}
	
	public List<HashMap<String,Object>> boardCategoryList(){
		return selectList("board.boardCategoryList");
	}
	

}
