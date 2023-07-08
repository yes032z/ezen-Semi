package com.semi.product.model;

import java.sql.SQLException;
import java.util.List;

public class ProductService {
	private ProductDAO productDao;
	
	public ProductService(){
		productDao=new ProductDAO();
	}
	
	public int insertPd(ProductVO vo) throws SQLException {
		return productDao.insertPd(vo);
	}
	
	public List<ProductVO> selectAllPd() throws SQLException {
		return productDao.selectAllPd();
	}
	
}
