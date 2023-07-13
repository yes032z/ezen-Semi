package com.semi.orders.model;

import java.sql.SQLException;

public class OrdersService {
	private OrdersDAO orderDao;
	
	public OrdersService() {
		orderDao=new OrdersDAO();
	}
	
	
	public OrdersVO selectOrderByNo(int no) throws SQLException {
		return orderDao.selectOrderByNo(no);
	}

}
