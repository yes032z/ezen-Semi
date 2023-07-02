package com.semi.refund.model;

import com.semi.db.ConnectionPoolMgr;

public class RefundDAO {
	private ConnectionPoolMgr pool;
	
	public RefundDAO() {
		pool=new ConnectionPoolMgr();
	}
	
	
	
}
