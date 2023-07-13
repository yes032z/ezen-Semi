package com.semi.orders.model;

import java.sql.SQLException;

public class OrdersService {
	private OrdersDAO orderDao;
	
	public OrdersService() {
		orderDao=new OrdersDAO();
	}
	
	
	public OrdersVO selectOrderByNo(int no,int pdno) throws SQLException {
		return orderDao.selectOrderByNo(no,pdno);
	}

}
