package com.myhw.book2.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.myhw.db.ConnectionPoolMgr1;

public class Book2DAO {
	private ConnectionPoolMgr1 pool;
	
	public Book2DAO() {
		pool=ConnectionPoolMgr1.getInstance();
	}
	
	/**
	 * 책 등록 메서드
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	public int insertBook2(Book2VO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		int cnt=0;
		try {
			con=pool.getConnection();
			
			String sql="insert into book2(no, title, price, publisher, fileName,"
					+ " fileSize, originalFileName)"
					+ " values(book2_seq.nextval, ?, ?, ?, ?, ?, ?)";
			ps=con.prepareStatement(sql);
			ps.setString(1, vo.getTitle());
			ps.setInt(2, vo.getPrice());
			ps.setString(3, vo.getPublisher());
			ps.setString(4, vo.getFileName());
			ps.setLong(5, vo.getFileSize());
			ps.setString(6, vo.getOriginalFileName());
			
			cnt=ps.executeUpdate();
			System.out.println("책 등록결과, cnt="+cnt+", 매개변수 vo="+vo);
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
}
