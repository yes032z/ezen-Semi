package com.semi.reviewdetail.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.semi.db.ConnectionPoolMgr;

public class ReviewDetailDAO {
	private ConnectionPoolMgr pool;
	
	public ReviewDetailDAO() {
		pool=new ConnectionPoolMgr();
	}
	
	public int insertReviewDetail(ReviewDetailVO vo, int size) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con=pool.getConnection();
			
			String sql="insert into reviewdetail(reviewno,filename,filesize,originalfilename)"
					+ " values(reviewdetail_seq.nextval,?,?,?)";
			ps=con.prepareStatement(sql);
			
			ps.setString(1, vo.getFilename());
			ps.setLong(2, vo.getFilesize());
			ps.setString(1, vo.getOriginalfilename());
			
			int cnt=ps.executeUpdate();
			
			System.out.println("리뷰디테일(이미지) 등록 결과 cnt="+cnt+", 등록된 사진 갯수 size="+size+", 매개변수 vo="+vo);
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
}
