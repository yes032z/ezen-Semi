package com.semi.favoritepd.model;

import java.sql.SQLException;
import java.util.List;

import com.semi.view.model.ViewVO;

public class FavoritePdService {
	private FavoritePdDAO favoritePdDao;
	
	public FavoritePdService() {
		favoritePdDao=new FavoritePdDAO();
	}
	//마이페이지 > 찜목록 조회
	public List<ViewVO> selectFavoriteByid(String id) throws SQLException{
		return favoritePdDao.selectFavoriteByid(id);
	}
	//마이페이지> 찜목록삭제(다중삭제포함)
	public int deleteFavoriteByNo(String[] favoriteno) throws SQLException {
		return favoritePdDao.deleteFavoriteByNo(favoriteno);
	}
	//마이페이지 찜목록 최근 4건조회
	public List<ViewVO> select4FavoriteByid(String id) throws SQLException{
		return favoritePdDao.select4FavoriteByid(id);
	}
	
}
