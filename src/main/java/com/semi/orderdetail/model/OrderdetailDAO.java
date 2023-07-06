package com.semi.orderdetail.model;

import com.semi.db.ConnectionPoolMgr;

public class OrderdetailDAO {
	private ConnectionPoolMgr pool;
	
	public OrderdetailDAO() {
		pool=new ConnectionPoolMgr();
	}
	
}
