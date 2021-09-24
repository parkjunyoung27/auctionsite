package com.quicktion.web.sell;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SellDAO {
	@Autowired
	private SqlSession sqlSession;
	
	//상품 등록
	public void post(ProductDTO productDTO) {
		sqlSession.insert("sell.post", productDTO);
	}

	//상품 번호 찾기
	public int pno(String id) {
		return sqlSession.selectOne("sell.pno", id);
	}
	
	//상품 이미지 등록
	public void postimg(PimgDTO pimgDTO) {
		sqlSession.insert("sell.postimg", pimgDTO);
	}
}
