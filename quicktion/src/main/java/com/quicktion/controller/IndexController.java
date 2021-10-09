package com.quicktion.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.quicktion.service.IndexServiceImpl;

@Controller
public class IndexController {

	@Resource(name="indexService")
	private	IndexServiceImpl indexService;

	@GetMapping("/index.do")
	public ModelAndView main(){
		ModelAndView mv = new ModelAndView("index");
		
		return	mv;
	}
}
