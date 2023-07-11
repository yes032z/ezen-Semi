package com.semi.productsize.model;

import java.sql.SQLException;
import java.util.List;

public class ProductSizeService {
	private ProductSizeDAO productSizeDao;
	
	public ProductSizeService() {
		productSizeDao=new ProductSizeDAO();
	}
	
	public List<ProductSizeVO> selectAllByNo(int pdno) throws SQLException {
		return productSizeDao.selectAllByNo(pdno);
	}
}
