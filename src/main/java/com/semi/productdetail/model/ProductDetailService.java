package com.semi.productdetail.model;

import java.sql.SQLException;
import java.util.List;

public class ProductDetailService {
	private ProductDetailDAO productdetailDao;
	
	public ProductDetailService() {
		productdetailDao=new ProductDetailDAO();
	}
	//상품번호로 상세이미지 뽑아오는 메서드
	public List<ProductDetailVO> selectByPdNo(int pdno) throws SQLException{
		return productdetailDao.selectByPdNo(pdno);
	}
}
