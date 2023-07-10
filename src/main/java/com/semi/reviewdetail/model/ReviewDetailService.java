package com.semi.reviewdetail.model;

import java.sql.SQLException;

public class ReviewDetailService {
	ReviewDetailDAO reviewDetailDAO;
	
	public ReviewDetailService() {
		reviewDetailDAO=new ReviewDetailDAO();
	}
	//리뷰 디테일 등록 메서드
	public int insertReviewDetail(ReviewDetailVO vo, int size) throws SQLException {
		return reviewDetailDAO.insertReviewDetail(vo,size);
	}
}
