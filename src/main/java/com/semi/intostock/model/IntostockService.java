package com.semi.intostock.model;

import java.sql.SQLException;
import java.util.List;

import com.semi.view.model.ViewVO;

public class IntostockService {
	private IntostockDAO intostockDao;
	
	public IntostockService() {
		intostockDao=new IntostockDAO();
	}
	
	public List<ViewVO> selectintoStock(String id) throws SQLException{
		return intostockDao.selectintoStock(id);
	}
}
