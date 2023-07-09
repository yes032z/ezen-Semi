package com.semi.favoritepd.model;

import java.sql.SQLException;
import java.util.List;

import com.semi.view.model.ViewVO;

public class FavoritePdService {
	private FavoritePdDAO favoritePdDao;
	
	public FavoritePdService() {
		favoritePdDao=new FavoritePdDAO();
	}
	
	public List<ViewVO> selectFavoriteByid(String id) throws SQLException{
		return favoritePdDao.selectFavoriteByid(id);
	}
	
	public int deleteFavoriteByNo(String[] favoriteno) throws SQLException {
		return favoritePdDao.deleteFavoriteByNo(favoriteno);
	}
}
