package com.quicktion.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.quicktion.web.sell.PimgDTO;
import com.quicktion.web.sell.ProductDTO;
import com.quicktion.web.sell.SellService;
import com.quicktion.web.util.FileSave;
import com.quicktion.web.util.Util;



@Controller
public class SellController {
	@Autowired
	private SellService sellService;
	@Autowired
	private FileSave fileSave;
	@Autowired
	private ServletContext servletContext;
	@Autowired
	private Util util;

	
	@GetMapping("/sell")
	public String sell(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		if(session.getAttribute("id") != null) {
			return "sell";
		} else {
			return "board";
		}
	}
	
	@PostMapping("/sell")
	public String sell2(HttpServletRequest request, @RequestParam("files") List<MultipartFile> files) throws IOException {
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("id") != null) {
			
		String id = (String) session.getAttribute("id");
		String product_brand = request.getParameter("product_brand");
		String product_name = request.getParameter("product_name");
		int start_price = Integer.parseInt(request.getParameter("start_price"));
		int trade_method = Integer.parseInt(request.getParameter("trade_method"));
		String product_content = request.getParameter("product_content");
		
		System.out.println("id : " + id 
				+" 상품 브랜드 : "+ product_brand
				+" 상품명 : " +  product_name 
				+ " 상품 가격 : " +  start_price 
				+ " 거래 방법 : " + trade_method + " 내용 :  "+ product_content);
		
		
		ProductDTO productDTO = new ProductDTO();
		
		productDTO.setMember_id(id);
		productDTO.setProduct_brand(product_brand);
		productDTO.setProduct_name(product_name);
		productDTO.setStart_price(start_price);
		productDTO.setTrade_method(trade_method);
		productDTO.setProduct_content(product_content);
		
		sellService.post(productDTO);
		
		PimgDTO pimgDTO = new PimgDTO();
		int pno = sellService.pno(id);
		System.out.println("상품번호 : " + pno);
		pimgDTO.setProduct_no(pno);
		
		//파일이 하나라도 있다면
		if(files.size() > 0) {
			String realPath = servletContext.getRealPath("resources/upfile/");
			String upfile;
			// 파일 업로드(여러개) 처리 부분
			for(MultipartFile file : files) {
				if(file.getSize() >0) {
										
				pimgDTO.setProduct_orifile(file.getOriginalFilename());//원본파일명
				upfile = fileSave.save(realPath, file);
				pimgDTO.setProduct_file(upfile);
				
				System.out.println("file : " + file.getOriginalFilename());
				System.out.println("file size : " + file.getSize());
				
				sellService.postimg(pimgDTO);
				}
				
			}
	    }
		
		return "index";
		//return "redirect://productd"
		}
		
		return "sell";
	}
	
	
}
