package com.semi.review.model;

import java.sql.SQLException;

public class ReviewService {
	private ReviewDAO reviewDao;
	
	public ReviewService() {
		reviewDao=new ReviewDAO();
	}
	//리뷰 등록 메서드
	public int insertReview(ReviewVO vo) throws SQLException {
		return reviewDao.insertReview(vo);
	}
	
	
	
}
