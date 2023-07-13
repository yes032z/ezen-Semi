package com.semi.stock.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.semi.db.ConnectionPoolMgr;

public class StockDAO {
	private ConnectionPoolMgr pool;
	
	public StockDAO() {
		pool=new ConnectionPoolMgr();
	}
	
	public List<StockVO> stockSelectByPdNo(int pdno) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		List<StockVO> list=new ArrayList<>();
		try {
			con=pool.getConnection();
			
			String sql="select * from stock where pdno=? order by pdno, pdsizeno";
			ps=con.prepareStatement(sql);
			
			ps.setInt(1, pdno);
			
			rs=ps.executeQuery();
			while(rs.next()) {
				int stockno=rs.getInt(1);
				int stockqty=rs.getInt(2);
				int pdno2=rs.getInt(3);
				int pdsizeno=rs.getInt(4);
				
				StockVO vo=new StockVO(stockno, stockqty, pdno2, pdsizeno);
				list.add(vo);
			}
			System.out.println("재고 조회 결과 list.size()="+list.size()+", 매개변수 pdno="+pdno);
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
}
