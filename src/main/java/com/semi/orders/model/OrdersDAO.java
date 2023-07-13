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
	
	public OrdersVO selectOrderByNo(int no , int pdno) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs =null;
		
		OrdersVO vo=null;
		try {
			con=pool.getConnection();
			
			String sql="select od.pdno,od.orderno,od.orderqty,od.pdsizeno,o.orderaddress,o.orderregdate,o.ordertel,o.pickup,o.no,o.receiver"
					+ " from orderdetail od join orders o"
					+ " on od.orderno=o.orderno"
					+ " where o.no=? and od.pdno= ?";
			ps=con.prepareStatement(sql);
			
			ps.setInt(1, no);
			ps.setInt(2, pdno);
			
			rs=ps.executeQuery();
			if(rs.next()) {
				int pdno2=rs.getInt(1);
				int orderno=rs.getInt(2);
				int orderqty=rs.getInt(3);
				int pdsizeno=rs.getInt(4);
				String orderaddress=rs.getString(5);
				Timestamp orderregdate=rs.getTimestamp(6);
				String ordertel=rs.getString(7);
				String pickup=rs.getString(8);
				int no2=rs.getInt(9);
				String receiver=rs.getString(10);
				
				vo=new OrdersVO(pdno2, orderqty, pdsizeno, orderno, orderaddress, orderregdate, ordertel, pickup, no2, receiver);
			}
			System.out.println("주문 조회 결과 vo="+vo + ", 매개변수 no="+no);
			return vo;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
}
