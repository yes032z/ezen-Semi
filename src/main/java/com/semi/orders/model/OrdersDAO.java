package com.semi.orders.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import com.semi.db.ConnectionPoolMgr;

public class OrdersDAO {
	private ConnectionPoolMgr pool;
	
	public OrdersDAO() {
		pool=new ConnectionPoolMgr();
	}
	
	public OrdersVO selectOrderByNo(int no) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs =null;
		
		OrdersVO vo=null;
		try {
			con=pool.getConnection();
			
			String sql="select orderno, orderaddress, orderregdate,ordertel,pickup,no,receiver  from orders where no=?";
			ps=con.prepareStatement(sql);
			
			ps.setInt(1, no);
			
			rs=ps.executeQuery();
			if(rs.next()) {
				int orderno=rs.getInt(1);
				String orderaddress=rs.getString(2);
				Timestamp orderregdate=rs.getTimestamp(3);
				String ordertel=rs.getString(4);
				String pickup=rs.getString(5);
				int no2=rs.getInt(6);
				String receiver=rs.getString(7);
				
				vo=new OrdersVO(orderno, orderaddress, orderregdate, ordertel, pickup, no2, receiver);
			}
			System.out.println("주문 조회 결과 vo="+vo + ", 매개변수 no="+no);
			return vo;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
}
