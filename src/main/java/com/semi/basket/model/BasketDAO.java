package com.semi.basket.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.semi.db.ConnectionPoolMgr;

public class BasketDAO {
	private ConnectionPoolMgr pool;
	
	public BasketDAO() {
		pool = new ConnectionPoolMgr();
	}
	
	public int insertBasket(BasketVO vo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con = pool.getConnection();
			
			String sql = "insert into basket(basketno, basketqty, pdno, no) "
						+ "values (basket_seq.nextval, ?, ?, ?)";
			ps = con.prepareStatement(sql);
			ps.setInt(1, vo.getBasketqty());
			ps.setInt(2, vo.getPdno());
			ps.setInt(3, vo.getNo());
			
			int cnt = ps.executeUpdate();
			System.out.println("장바구니 등록 결과 cnt: " + cnt + ", 매개변수 vo: " + vo);
			
			return cnt;
		} finally {
			pool.dbClose(ps, con);
		}
	}
	
	public int deleteBasket(int basketno) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con = pool.getConnection();
			
			String sql = "delete from basket where basketno = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, basketno);
			
			int cnt = ps.executeUpdate();
			System.out.println("장바구니 삭제 결과 cnt: " + cnt + ", 매개변수 basketno: " + basketno);
			
			return cnt;
		} finally {
			pool.dbClose(ps, con);
		}
	}

}
