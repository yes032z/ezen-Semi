package com.semi.basket.model;

import java.sql.SQLException;
import java.util.List;

public class BasketService {
	private BasketDAO basketDAO;
	
	    public BasketService() {
	        basketDAO = new BasketDAO();
	    }

	    // 장바구니에 상품 등록
	    public int insertBasket(BasketVO vo) {
	        try {
	            return basketDAO.insertBasket(vo);
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return 0;
	    }

	    // 장바구니에서 상품 삭제
	    public int deleteBasket(int basketno) {
	        try {
	            return basketDAO.deleteBasket(basketno);
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return 0;
	    }

	    // 장바구니 리스트 조회
	    public List<BasketVO> getBasketList() {
	        try {
	            return basketDAO.getBasketList();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return null;
	    }
	}
