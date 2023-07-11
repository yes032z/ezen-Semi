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
	
	public List<ProductVO> selectPdAll(String brand, String kind,String grade,String price) throws SQLException {
		return productDao.selectPdAll(brand,kind,grade,price);
	}
	
	public ProductVO selectPdByNo(int pdno) throws SQLException {
		return productDao.selectPdByNo(pdno);
	}
}
