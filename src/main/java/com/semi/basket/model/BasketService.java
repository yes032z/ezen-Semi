package com.semi.basket.model;

import java.sql.SQLException;

public class BasketService {
	private BasketDAO basketDAO;
	
	public BasketService() {
		basketDAO = new BasketDAO();
	}
	
	//등록
	public int insertBasket(BasketVO vo) {
		try {
			return basketDAO.insertBasket(vo);
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	//삭제
	public int deleteBasket(int basketno) {
		try {
			return basketDAO.deleteBasket(basketno);
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}
	}
	
}
