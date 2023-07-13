package com.semi.stock.model;

import java.sql.SQLException;
import java.util.List;

public class StockService {
	private StockDAO stockDao;
	
	public StockService() {
		stockDao=new StockDAO();
	}
	
	public List<StockVO> stockSelectByPdNo(int pdno) throws SQLException {
		return stockDao.stockSelectByPdNo(pdno);
	}
}
