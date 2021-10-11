package com.quicktion.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.quicktion.dto.BoardDTO;
import com.quicktion.service.BoardServiceImpl;
import com.quicktion.util.Util;

@Controller
public class BoardController {
	
	@Resource(name="boardService")
	private BoardServiceImpl boardService;
	@Autowired
	private Util util;
	
	@GetMapping("/sub_board_menu.do")
	public ModelAndView menu() {
		System.out.println("카테고리메뉴");
		ModelAndView mv = new ModelAndView("sub_board_menu");
		List<HashMap<String, Object>> boardCategoryList = boardService.boardCategoryList();
		mv.addObject("boardCategoryList", boardCategoryList);
		return mv;
	}
	
	@GetMapping("/board.do")
	public ModelAndView board(HttpServletRequest request) {
		// .jsp로 보낼 객체 생성
		ModelAndView mv = new ModelAndView("board");
		
		//카테고리 리스트 뽑기		
		List<HashMap<String, Object>> boardCategoryList = boardService.boardCategoryList();
		mv.addObject("boardCategoryList", boardCategoryList);
		
		// 게시판 종류 설정
		int board_cate_no = 1; // 기본값
		if (request.getParameter("board_cate_no") != null && util.str2Int(request.getParameter("board_cate_no"))) {
			board_cate_no = util.str2Int2(request.getParameter("board_cate_no"));
		}

		Map<String, Object> sendMap = new HashMap<String, Object>();
		sendMap.put("board_cate_no", board_cate_no);

		List<Map<String, Object>> boardList = boardService.boardList(sendMap);

		mv.addObject("list", boardList);
		if (boardList.size() > 0) {
			mv.addObject("category", boardList.get(0).get("category_name"));
		}

		mv.addObject("board_cate_no", board_cate_no);

		HttpSession session = request.getSession();
		mv.addObject("id", session.getAttribute("id"));

		return mv;
	}

	
	
}
