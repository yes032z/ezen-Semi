package com.semi.faq.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.semi.db.ConnectionPoolMgr;

public class FAQDAO {
	private ConnectionPoolMgr pool;
	
	private Connection con = null;
	private PreparedStatement ps = null;
	ResultSet rs = null;
	List<FAQVO> list = new ArrayList<>();
	String sql = "";
	
	public FAQDAO() {
		pool = new ConnectionPoolMgr();
	}
	
	/**
	 * 자주 찾는 faq 상위 5개 조회
	 * @return
	 * @throws SQLException
	 */
	public List<FAQVO> selectBest5() throws SQLException {
		
		
		try {
			con = pool.getConnection();
			
			sql = "select * from "
					+ "(select * from faq order by readcount desc) "
					+ "where rownum <= 5";
			ps = con.prepareStatement(sql);
			
			rs = ps.executeQuery();
			while (rs.next()) {
				int faqNo = rs.getInt("faqNo");
				String faqTitle = rs.getString("faqTitle");
				String faqBody = rs.getString("faqBody");
				String faqCategory = rs.getString("faqCategory");
				int readCount = rs.getInt("readCount");
				
				FAQVO vo = new FAQVO(faqNo, faqTitle, faqBody, faqCategory, readCount);
				list.add(vo);
			}
			
			System.out.println("faq 자주 찾는 글 상위 5개 조회결과, list.size() = " + list.size());
			return list;
			
		} finally {
			pool.dbClose(rs, ps, con);
		}
	}//
	
	/**
	 * faq 카테고리 별 검색
	 * @param category
	 * @return
	 * @throws SQLException
	 */
	public List<FAQVO> selectByCategory(String category) throws SQLException {
		
		try {
			con = pool.getConnection();
			
			sql = "select * from faq "
					+ "where faqcategory = ?";
			ps = con.prepareStatement(sql);
			
			ps.setString(1, category);
			
			rs = ps.executeQuery();
			while (rs.next()) {
				int faqNo = rs.getInt("faqNo");
				String faqTitle = rs.getString("faqTitle");
				String faqbody = rs.getString("faqbody");
				String faqCategory = rs.getString("faqCategory");
				int readCount = rs.getInt("readCount");
				
				FAQVO vo = new FAQVO(faqNo, faqTitle, faqbody, faqCategory, readCount);
				list.add(vo);
			}
			
			System.out.println("faq 카테고리별 검색결과, list.size = " + list.size() + ", 매개변수 category = " + category);
			return list;
			
		} finally {
			pool.dbClose(rs, ps, con);
		}
	}//
	
	/**
	 * 사용자가 직접 검색어 입력해서 검색
	 * @param search
	 * @return
	 * @throws SQLException
	 */
	public List<FAQVO> selectBySearch(String search) throws SQLException {
		
		try {
			con = pool.getConnection();
			
			sql = "select * from faq "
					+ "where faqtitle like '%' || ? || '%'";
			ps = con.prepareStatement(sql);
			
			ps.setString(1, search);
			
			rs = ps.executeQuery();
			while (rs.next()) {
				int faqNo = rs.getInt("faqNo");
				String faqTitle = rs.getString("faqTitle");
				String faqBody = rs.getString("faqBody");
				String faqCategory = rs.getString("faqCategory");
				int readcount = rs.getInt("readcount");
				
				FAQVO vo = new FAQVO(faqNo, faqTitle, faqBody, faqCategory, readcount);
				list.add(vo);
			}
			
			System.out.println("faq 검색으로 조회결과, list.size = " + list.size() + ", 매개변수 search = " + search);
			return list;
			
		} finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	/**
	 * FAQ 작성
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	public int insertFaq(FAQVO vo) throws SQLException {
		
		try {
			con = pool.getConnection();
			
			sql = "insert into faq (faqno, faqtitle, faqbody, faqcategory) "
					+ "values (faq_seq.nextval, ?, ?, ?);";
			ps = con.prepareStatement(sql);
			
			ps.setString(1, vo.getfaqTitle());
			ps.setString(2, vo.getfaqBody());
			ps.setString(3, vo.getfaqCategory());
			
			int cnt = ps.executeUpdate();
			
			System.out.println("FAQ 작성결과, cnt = " + cnt + ", 매개변수 vo = " + vo);
			return cnt;
			
		} finally {
			pool.dbClose(ps, con);
		}
	}//
	
	public int deleteFaq(FAQVO vo) throws SQLException {
		
		try {
			con = pool.getConnection();
			
			sql = "delete faq where faqno = ?";
			ps = con.prepareStatement(sql);
			
			ps.setInt(1, vo.getfaqNo());
			
			int cnt = ps.executeUpdate();
			
			System.out.println("faq 삭제 결과, cnt = " + cnt + ", 매개변수 vo = " + vo);
			return cnt;
			
		} finally {
			pool.dbClose(ps, con);
		}
	}//
	
	
	
	
}//
