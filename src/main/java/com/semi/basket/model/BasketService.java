package com.semi.basket.model;

import java.util.List;

public interface BasketService {
	
	//장바구니 상품 추가
	public int addBasket(BasketVO basket);
	
	//장바구니 정보 리스트
	public List<BasketVO> getBasketList(String no);
	
	//장바구니 상품 수량 변경
	public int modifyCount(BasketVO basket);
	
}
