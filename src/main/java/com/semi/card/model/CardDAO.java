package com.semi.card.model;

import com.semi.db.ConnectionPoolMgr;

public class CardDAO {
	private ConnectionPoolMgr pool;
	
	public CardDAO() {
		pool = new ConnectionPoolMgr();
	}

}

