package com.quicktion.web.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardService {
	
	@Autowired
	private BoardDAO boardDAO;
	
	public List<BoardDTO> boardList(Map<String, Object> sendMap) {
		return boardDAO.boardList(sendMap);
	}

	public List<HashMap<String, Object>> boardCategoryList() {
		return boardDAO.boardCategoryList();
	}

	public void write(BoardDTO boardDTO) {
		boardDAO.write(boardDTO);
	}

	public BoardDTO detail(int board_no) {
		return boardDAO.detail(board_no);
	}

	public void countUp(int board_no) {
		boardDAO.countUp(board_no);
	}

	public void delete(int board_no) {
		boardDAO.delete(board_no);
	}

	
}
