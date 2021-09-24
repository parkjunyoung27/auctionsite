package com.quicktion.web;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;
import com.quicktion.web.board.BoardDTO;
import com.quicktion.web.board.BoardService;
import com.quicktion.web.util.Util;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;
	@Autowired
	private Util util;

	@RequestMapping("/sub_board_menu")
	public ModelAndView menu() {
		ModelAndView mv = new ModelAndView("sub_board_menu");
		List<HashMap<String, Object>> boardCategoryList = boardService.boardCategoryList();
		mv.addObject("boardCategoryList", boardCategoryList);
		return mv;
	}

	@RequestMapping("/board")
	public ModelAndView board(HttpServletRequest request) {
		// .jsp로 보낼 객체 생성
		ModelAndView mv = new ModelAndView("board");

		// 게시판 종류 설정
		int bcno = 1; // 기본값
		if (request.getParameter("bcno") != null && util.str2Int(request.getParameter("bcno"))) {
			bcno = util.str2Int2(request.getParameter("bcno"));
		}

		Map<String, Object> sendMap = new HashMap<String, Object>();
		sendMap.put("bcno", bcno);

		List<BoardDTO> boardList = boardService.boardList(sendMap);

		mv.addObject("list", boardList);
		if (boardList.size() > 0) {
			mv.addObject("category", boardList.get(0).getCategory_name());
		}

		mv.addObject("bcno", bcno);

		HttpSession session = request.getSession();
		mv.addObject("id", session.getAttribute("id"));

		return mv;
	}

	@GetMapping("/write")
	public String wrtie(HttpServletRequest request) {

		HttpSession session = request.getSession();
		if (session.getAttribute("id") != null) {
			session.getAttribute("grade");
			return "write";
		} else {
			return "board";
		}

	}

	@PostMapping("/write")
	public String write2(HttpServletRequest request, MultipartFile file) {

		HttpSession session = request.getSession();

		// 불러온 값 정리하기
		String member_id = (String) session.getAttribute("id");
		int board_cate = util.str2Int2(request.getParameter("board_cate"));
		String board_title = request.getParameter("board_title");
		String board_content = request.getParameter("board_content");

		System.out.println(member_id + ':' + board_cate + ':' + board_title + ':' + board_content);

		BoardDTO boardDTO = new BoardDTO();
		boardDTO.setMember_id(member_id);
		boardDTO.setBoard_cate(board_cate);
		boardDTO.setBoard_title(board_title);
		boardDTO.setBoard_content(board_content);

		boardService.write(boardDTO); // 자동으로 맵핑됨

		return "redirect:/board?bcno=" + board_cate;
	}

	@GetMapping("/detail")
	public ModelAndView detail(@RequestParam("board_no") int board_no, HttpServletRequest request) {
		boardService.countUp(board_no);

		BoardDTO boardDTO = boardService.detail(board_no);

		ModelAndView mv = new ModelAndView("detail");

		mv.addObject("boardDTO", boardDTO);

		return mv;
	}

	@GetMapping("/delete")
	public String delete(@RequestParam("board_no") int board_no, HttpServletRequest request) {
		boardService.delete(board_no);

		return "redirect:/board?bcno=3";
	}

	@RequestMapping(value="/uploadSummernoteImageFile", produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request )  {
		JsonObject jsonObject = new JsonObject();
        /*
		 * String fileRoot = "C:\\summernote_image\\"; // 외부경로로 저장을 희망할때.
		 */	
		// 내부경로로 저장
		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
		System.out.println("contextRoot : " + contextRoot);
		String fileRoot = contextRoot+"resources/fileupload/";
		System.out.println("fileRoot : " + fileRoot);
		
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		//오리지날 파일명 : Untitled Diagram.drawio.png
		System.out.println("오리지날 파일명 : "+originalFileName);
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		
		File targetFile = new File(fileRoot + savedFileName);	
		//targetFile : C:\quicktion\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\shopping\resources\fileupload\03097384-ad4e-4a23-b906-86d1415cb9c6.png
		//저장장소
		System.out.println("targetFile : "+targetFile);
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			jsonObject.addProperty("url", "./resources/fileupload/"+savedFileName); // contextroot + resources + 저장할 내부 폴더명
			jsonObject.addProperty("responseCode", "success");
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		String a = jsonObject.toString();
		return a;
	}
}
