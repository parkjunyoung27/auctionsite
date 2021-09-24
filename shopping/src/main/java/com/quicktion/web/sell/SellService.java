package com.quicktion.web.sell;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SellService {
	@Autowired
	private SellDAO sellDAO;

	
	//productDTO 등록 및 반환
	public void post(ProductDTO productDTO) {
		sellDAO.post(productDTO);
	}

	public int pno(String id) {
		return sellDAO.pno(id);
	}
	
	//상품이미지 등록
	public void postimg(PimgDTO pimgDTO) {
		sellDAO.postimg(pimgDTO);
	}


}
