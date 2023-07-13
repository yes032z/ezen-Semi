package com.semi.review.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.semi.db.ConnectionPoolMgr;
import com.semi.view.model.ViewVO;

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
		
		try {
			con=pool.getConnection();
			String sql="insert into review(reviewno, reviewbody, reviewgrade, no, pdno)"
					+ " values(review_seq.nextval, ?, ?, ?, ?)";
			ps=con.prepareStatement(sql);
			ps.setString(1, vo.getReviewbody());
			ps.setInt(2, vo.getReviewgrade());
			ps.setInt(3, vo.getNo());
			ps.setInt(4, vo.getPdno());
			
			int cnt=ps.executeUpdate();
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
					+ " set reviewbody= ?, reviewgrade= ?"
					+ " where reviewno= ?";
					ps=con.prepareStatement(sql);
			ps.setString(1, vo.getReviewbody());
			ps.setInt(2, vo.getReviewgrade());
			ps.setInt(3, vo.getReviewno());
			
			cnt=ps.executeUpdate();
			System.out.println("리뷰 수정 결과, cnt="+cnt+", 매개변수 vo="+vo);
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	/**
	 * 마이페이지> 내가작성한 리뷰 조회
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	public List<ViewVO> selectReviewByid(String id,String startDate, String lastDate) throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<ViewVO> list=new ArrayList<>();
		
		try {
			con=pool.getConnection();
			
			String sql="select r.reviewno, r.reviewbody, p.pdname, r.reviewgrade,"
					+" r.good, reviewregdate"
					+" from review r left join product p"
					+" on r.pdno= p.pdno"
					+" left join member m"
					+" on r.no= m.no"
					+" where m.id= ?";
					if(startDate!=null && !startDate.isEmpty() && lastDate!=null && !lastDate.isEmpty()) {
					sql +=" and r.reviewregdate >=to_date( ? )"
						+" and r.reviewregdate< to_date( ? )+1";
					}
					sql +=" order by r.reviewregdate desc";
			ps=con.prepareStatement(sql);
			ps.setString(1, id);
			if(startDate!=null && !startDate.isEmpty() && lastDate!=null && !lastDate.isEmpty()) {
				ps.setString(2, startDate);
				ps.setString(3, lastDate);
			}
			rs=ps.executeQuery();
			while(rs.next()) {
				int reviewno=rs.getInt("reviewno");
				String reviewbody=rs.getString("reviewbody");
				String pdname=rs.getString("pdname");
				int reviewgrade=rs.getInt("reviewgrade");
				int good=rs.getInt("good");
				Timestamp reviewregdate=rs.getTimestamp("reviewregdate");
				
				ViewVO vo=new ViewVO(reviewno, reviewbody, pdname, reviewgrade, good, reviewregdate);
				list.add(vo);
			}
			System.out.println("사용자 리뷰 목록 조회 결과, list.size="+list.size()+", 매개변수 id="+id
					+", startDate="+startDate+", lastDate="+lastDate);
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public int reviewFindNo(int no,int pdno) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		int reviewno=0;
		try {
			con=pool.getConnection();
			
			String sql="select reviewno from review"
					+ " where no=? and pdno=?"
					+ " order by reviewregdate desc";
			ps=con.prepareStatement(sql);
			
			ps.setInt(1, no);
			ps.setInt(2, pdno);
			
			rs=ps.executeQuery();
			if(rs.next()){
				reviewno=rs.getInt(1);
			}
			
			System.out.println("리뷰 번호 찾기 결과 reviewno="+reviewno+", 매개변수 no="+no+", pdno="+pdno);
			return reviewno;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	/**
	 * @param pdno
	 * @return
	 * @throws SQLException
	 */
	//평점 높은순
	public List<ReviewVO> selectGradeHigh(int pdno) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		List<ReviewVO> list =new ArrayList<>();
		try {
			con=pool.getConnection();
			
			String sql="select distinct r.reviewno, r.reviewbody,r.reviewregdate,r.reviewgrade,r.good,r.no,r.pdno,rd.filename,rd.filesize,rd.originalfilename,m.id"
					+ " from review r left join reviewdetail rd"
					+ " on r.reviewno=rd.reviewno"
					+ " left join member m"
					+ " on r.no=m.no"
					+ " left join orders o"
					+ " on m.no=o.no"
					+ " left join orderdetail od"
					+ " on o.orderno=od.orderno"
					+ " where r.pdno=?"
					+ " order by reviewgrade desc";
			ps=con.prepareStatement(sql);
			
			ps.setInt(1, pdno);
			
			rs=ps.executeQuery();
			while(rs.next()) {
				int reviewno=rs.getInt(1);
				String reviewbody=rs.getString(2);
				Timestamp reviewregdate=rs.getTimestamp(3);
				int reviewgrade=rs.getInt(4);
				int good=rs.getInt(5);
				int no=rs.getInt(6);
				int pdno2=rs.getInt(7);
				String filename=rs.getString(8);
				long filesize=rs.getLong(9);
				String originalfilename=rs.getString(10);
				String id=rs.getString(11);
				
				ReviewVO vo=new ReviewVO(reviewno, reviewbody, reviewregdate, reviewgrade, good, no, pdno2, filename, filesize, originalfilename, id);
				list.add(vo);
			}
			
			System.out.println("리뷰 평점 높은순 조회 결과 list.size()="+list.size()+", 매개변수 pdno="+pdno);
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
			
	}
	//평점 낮은순
	public List<ReviewVO> selectGradeLow(int pdno) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		List<ReviewVO> list =new ArrayList<>();
		try {
			con=pool.getConnection();
			
			String sql="select distinct r.reviewno, r.reviewbody,r.reviewregdate,r.reviewgrade,r.good,r.no,r.pdno,rd.filename,rd.filesize,rd.originalfilename,m.id"
					+ " from review r left join reviewdetail rd"
					+ " on r.reviewno=rd.reviewno"
					+ " left join member m"
					+ " on r.no=m.no"
					+ " left join orders o"
					+ " on m.no=o.no"
					+ " left join orderdetail od"
					+ " on o.orderno=od.orderno"
					+ " where r.pdno=?"
					+ " order by reviewgrade";
			ps=con.prepareStatement(sql);
			
			ps.setInt(1, pdno);
			
			rs=ps.executeQuery();
			while(rs.next()) {
				int reviewno=rs.getInt(1);
				String reviewbody=rs.getString(2);
				Timestamp reviewregdate=rs.getTimestamp(3);
				int reviewgrade=rs.getInt(4);
				int good=rs.getInt(5);
				int no=rs.getInt(6);
				int pdno2=rs.getInt(7);
				String filename=rs.getString(8);
				long filesize=rs.getLong(9);
				String originalfilename=rs.getString(10);
				String id=rs.getString(11);
				
				ReviewVO vo=new ReviewVO(reviewno, reviewbody, reviewregdate, reviewgrade, good, no, pdno2, filename, filesize, originalfilename, id);
				list.add(vo);
			}
			
			System.out.println("리뷰 평점 낮은순 조회 결과 list.size()="+list.size()+", 매개변수 pdno="+pdno);
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
			
	}
	//최근 등록순
	public List<ReviewVO> selectLately(int pdno) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		List<ReviewVO> list =new ArrayList<>();
		try {
			con=pool.getConnection();
			
			String sql="select distinct r.reviewno, r.reviewbody,r.reviewregdate,r.reviewgrade,r.good,r.no,r.pdno,rd.filename,rd.filesize,rd.originalfilename,m.id"
					+ " from review r left join reviewdetail rd"
					+ " on r.reviewno=rd.reviewno"
					+ " left join member m"
					+ " on r.no=m.no"
					+ " left join orders o"
					+ " on m.no=o.no"
					+ " left join orderdetail od"
					+ " on o.orderno=od.orderno"
					+ " where r.pdno=?"
					+ " order by r.reviewregdate desc";
			ps=con.prepareStatement(sql);
			
			ps.setInt(1, pdno);
			
			rs=ps.executeQuery();
			while(rs.next()) {
				int reviewno=rs.getInt(1);
				String reviewbody=rs.getString(2);
				Timestamp reviewregdate=rs.getTimestamp(3);
				int reviewgrade=rs.getInt(4);
				int good=rs.getInt(5);
				int no=rs.getInt(6);
				int pdno2=rs.getInt(7);
				String filename=rs.getString(8);
				long filesize=rs.getLong(9);
				String originalfilename=rs.getString(10);
				String id=rs.getString(11);
				
				ReviewVO vo=new ReviewVO(reviewno, reviewbody, reviewregdate, reviewgrade, good, no, pdno2, filename, filesize, originalfilename, id);
				list.add(vo);
			}
			
			System.out.println("리뷰 최근 등록순 조회 결과 list.size()="+list.size()+", 매개변수 pdno="+pdno);
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
			
	}
	
}
