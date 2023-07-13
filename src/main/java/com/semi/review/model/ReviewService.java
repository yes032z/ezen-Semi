package com.semi.review.model;

import java.sql.SQLException;
import java.util.List;

import com.semi.view.model.ViewVO;

public class ReviewService {
	private ReviewDAO reviewDao;
	
	public ReviewService() {
		reviewDao=new ReviewDAO();
	}
	//리뷰 등록 메서드
	public int insertReview(ReviewVO vo) throws SQLException {
		return reviewDao.insertReview(vo);
	}
	//리뷰 수정 메서드
	public int updateReview(ReviewVO vo) throws SQLException {
		return reviewDao.updateReview(vo);
	}
	//마이페이지> 내가작성한 리뷰조회
	public List<ViewVO> selectReviewByid(String id, String startDate, String lastDate) throws SQLException{
		return reviewDao.selectReviewByid(id,startDate, lastDate);
	}
	//리뷰 등록하고 번호 찾아서 리뷰디테일에 사진 넣기 위해서 번호 찾는 메서드
	public int reviewFindNo(int no,int pdno) throws SQLException {
		return reviewDao.reviewFindNo(no, pdno);
	}
	//평점 낮은순 조회
	public List<ReviewVO> selectGradeLow(int pdno) throws SQLException {
		return reviewDao.selectGradeLow(pdno);
	}
	//평점 높은순 조회
	public List<ReviewVO> selectGradeHigh(int pdno) throws SQLException {
		return reviewDao.selectGradeHigh(pdno);
	}
	//최근 등록순 조회
	public List<ReviewVO> selectLately(int pdno) throws SQLException {
		return reviewDao.selectLately(pdno);
	}
	
}
