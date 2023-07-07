package com.semi.review.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.semi.db.ConnectionPoolMgr;

public class ReviewDAO {
	private ConnectionPoolMgr pool;
	
	public ReviewDAO() {
		pool=new ConnectionPoolMgr();
	}
	/**
	 * 리뷰 등록 메서드
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	public int insertReview(ReviewVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		int cnt=0;
		
		try {
			con=pool.getConnection();
			String sql="insert into review(reviewno, reviewbody, reviewgrade,"
					+ " no, pdno, filename, filesize, originalfilename)"
					+ " values(review_seq.nextval, ?, ?, ?, ?, ?, ?, ?)";
			ps=con.prepareStatement(sql);
			ps.setString(1, vo.getReviewbody());
			ps.setInt(2, vo.getReviewgrade());
			ps.setInt(3, vo.getNo());
			ps.setInt(4, vo.getPdno());
			ps.setString(5, vo.getFilename());
			ps.setLong(6, vo.getFilesize());
			ps.setString(7, vo.getOriginalfilename());
			
			cnt=ps.executeUpdate();
			System.out.println("리뷰 등록 결과, cnt="+cnt+", 매개변수 vo="+vo);
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	/**
	 * 리뷰 수정 메서드
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	public int updateReview(ReviewVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		int cnt=0;
		
		try {
			con=pool.getConnection();
			String sql="update review"
					+ " set reviewbody= ?, reviewgrade= ?, filename= ?,"
					+ " filesize= ?, originalfilename= ?"
					+ " where reviewno= ?";
					ps=con.prepareStatement(sql);
			ps.setString(1, vo.getReviewbody());
			ps.setInt(2, vo.getReviewgrade());
			ps.setString(3, vo.getFilename());
			ps.setLong(4, vo.getFilesize());
			ps.setString(5, vo.getOriginalfilename());
			ps.setInt(6, vo.getReviewno());
			
			cnt=ps.executeUpdate();
			System.out.println("리뷰 수정 결과, cnt="+cnt+", 매개변수 vo="+vo);
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
}
