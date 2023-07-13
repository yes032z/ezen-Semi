package com.semi.basket.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.semi.db.ConnectionPoolMgr;

public class BasketDAO {
	private ConnectionPoolMgr pool;
	
	    public BasketDAO() {
	        pool = new ConnectionPoolMgr();
	    }

	    // 장바구니 등록
	    public int insertBasket(BasketVO vo) throws SQLException {
	        Connection con = null;
	        PreparedStatement ps = null;

	        try {
	            con = pool.getConnection();

	            String sql = "INSERT INTO basket(basketno, basketqty, pdno, no, pdsizeno) "
	                    + "VALUES (basket_seq.nextval, ?, ?, ?, ?)";
	            ps = con.prepareStatement(sql);
	            ps.setInt(1, vo.getBasketqty());
	            ps.setInt(2, vo.getPdno());
	            ps.setInt(3, vo.getNo());
	            ps.setInt(4, vo.getPdsizeno());

	            int cnt = ps.executeUpdate();
	            System.out.println("장바구니 등록 결과 cnt: " + cnt + ", 매개변수 vo: " + vo);

	            return cnt;
	        } finally {
	            pool.dbClose(ps, con);
	        }
	    }

	    // 장바구니 삭제
	    public int deleteBasket(int basketno) throws SQLException {
	        Connection con = null;
	        PreparedStatement ps = null;

	        try {
	            con = pool.getConnection();

	            String sql = "DELETE FROM basket WHERE basketno = ?";
	            ps = con.prepareStatement(sql);
	            ps.setInt(1, basketno);

	            int cnt = ps.executeUpdate();
	            System.out.println("장바구니 삭제 결과 cnt: " + cnt + ", 매개변수 basketno: " + basketno);

	            return cnt;
	        } finally {
	            pool.dbClose(ps, con);
	        }
	    }

	    // 장바구니 리스트 조회
	    public List<BasketVO> getBasketList() throws SQLException {
	        Connection con = null;
	        PreparedStatement ps = null;
	        ResultSet rs = null;

	        try {
	            con = pool.getConnection();

	            String sql = "SELECT * FROM basket";
	            ps = con.prepareStatement(sql);
	            rs = ps.executeQuery();

	            List<BasketVO> basketList = new ArrayList<>();

	            while (rs.next()) {
	                int basketno = rs.getInt("basketno");
	                int basketqty = rs.getInt("basketqty");
	                int pdno = rs.getInt("pdno");
	                int no = rs.getInt("no");
	                int pdsizeno = rs.getInt("pdsizeno");

	                BasketVO vo = new BasketVO(basketno, basketqty, pdno, no, pdsizeno);
	                basketList.add(vo);
	            }

	            return basketList;
	        } finally {
	            pool.dbClose(rs, ps, con);
	        }
	    }
	}
