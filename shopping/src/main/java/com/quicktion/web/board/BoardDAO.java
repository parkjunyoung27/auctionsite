package com.quicktion.web.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class BoardDAO {
	@Autowired
	private SqlSession sqlSession;
	
	public List<BoardDTO> boardList(Map<String, Object> sendMap){
		return sqlSession.selectList("board.boardList", sendMap); //네임스페이스.id
	}

	public List<HashMap<String, Object>> boardCategoryList() {
		return sqlSession.selectList("board.boardCategoryList");
	}

	public void write(BoardDTO boardDTO) {
		sqlSession.insert("board.write", boardDTO);
	}

	public BoardDTO detail(int board_no) {
		return sqlSession.selectOne("board.detail", board_no);
	}

	public void countUp(int board_no) {
		sqlSession.update("board.countUp", board_no);
	}

	public void delete(int board_no) {
		sqlSession.update("board.delete", board_no);
	}
	
	
}
