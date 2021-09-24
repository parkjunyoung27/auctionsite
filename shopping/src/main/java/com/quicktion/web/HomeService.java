package com.quicktion.web;



import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quicktion.web.board.BoardDAO;

/*
 * 2021-09-05 TestServic
 */

@Service //service랑 dao랑 연결해야됨
public class HomeService {
	@Autowired
	private BoardDAO boardDAO;
	
}
