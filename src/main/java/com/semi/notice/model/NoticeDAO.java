package com.semi.notice.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.semi.db.ConnectionPoolMgr;

public class NoticeDAO {
	private ConnectionPoolMgr pool;
	
	public NoticeDAO() {
		pool = new ConnectionPoolMgr();
	}
	
	public NoticeVO selectByNo(int no) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		NoticeVO vo = new NoticeVO();
		
		try {
			con = pool.getConnection();
			
			String sql = "select * from notice where noticeno = ? ";
			ps = con.prepareStatement(sql);
			
			ps.setInt(1, no);
			
			rs = ps.executeQuery();
			if (rs.next()) {
				String noticeName = rs.getString("noticeName");
				String noticeBody = rs.getString("noticeBody");
				Timestamp noticeRegdate = rs.getTimestamp("noticeRegdate");
				
				vo = new NoticeVO(no, noticeName, noticeBody, noticeRegdate);
			}
			
			System.out.println("공지사항 번호로 조회결과, vo = " + vo + ", 매개변수 no = " + no);
			return vo;
			
		} finally {
			pool.dbClose(rs, ps, con);
		}
	}//
	
	public List<NoticeVO> selectAll() throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		List<NoticeVO> list = new ArrayList<>();
		
		try {
			con = pool.getConnection();
			
			String sql = "select * from notice order by noticeno desc ";
			ps = con.prepareStatement(sql);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				int noticeNo = rs.getInt("noticeNo");
				String noticeName = rs.getString("noticeName");
				String noticeBody = rs.getString("noticeBody");
				Timestamp noticeRegdate = rs.getTimestamp("noticeRegdate");
				
				NoticeVO vo = new NoticeVO(noticeNo, noticeName, noticeBody, noticeRegdate);
				list.add(vo);
			}
			System.out.println("공지사항 전체조회 결과, list.size() = " + list.size());
			return list;
			
		} finally {
			pool.dbClose(rs, ps, con);
		}
	}//
	
}//
