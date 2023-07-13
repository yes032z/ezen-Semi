package com.semi.orderdetail.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.semi.db.ConnectionPoolMgr;
import com.semi.view.model.ViewVO;

public class OrderdetailDAO {
	private ConnectionPoolMgr pool;
	
	public OrderdetailDAO() {
		pool=new ConnectionPoolMgr();
	}
	
	public List<ViewVO> selectAll(String id, String startDate,String lastDate) throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<ViewVO> list=new ArrayList<>();
		try {
			con=pool.getConnection();
			
			String sql="select o.orderno, p.filename, p.pdname, od.orderqty, p.price, o.pickup, o.orderregdate, p.pdno"
					 +" from orderdetail od left join product p"
					 +" on od.pdno = p.pdno"
					 +" left join refund r"
					 +" on od.pdno = r.pdno"
					 +" right join orders o"
					 +" on od.orderno = o.orderno"
					 +" left join member m"
					 +" on o.no= m.no"
					 +" where not exists (select 1 from refund r where r.orderno= od.orderno and r.pdno= od.pdno)"
					 +" and o.orderno > 0"
					 +" and m.id= ?";
					if(startDate!=null && !startDate.isEmpty() && lastDate!=null && !lastDate.isEmpty()) {
						sql +=" and o.orderregdate>=to_date( ? )"
					         +" and o.orderregdate<to_date( ? )+1";
					}
					sql +=" order by o.orderregdate desc";
			ps=con.prepareStatement(sql);
			ps.setString(1, id);
			if(startDate!=null && !startDate.isEmpty() && lastDate!=null && !lastDate.isEmpty()) {
				ps.setString(2, startDate);
				ps.setString(3, lastDate);
			}
			rs=ps.executeQuery();
			while(rs.next()) {
				int orderno=rs.getInt("orderno");
				String filename=rs.getString("filename");
				String pdname=rs.getString("pdname");
				int orderqty=rs.getInt("orderqty");
				int price=rs.getInt("price");
				String pickup=rs.getString("pickup");
				Timestamp orderregdate=rs.getTimestamp("orderregdate");
				int pdno=rs.getInt("pdno");
				
				ViewVO vo=new ViewVO(orderno, filename, pdname, orderqty, price, pickup, orderregdate, pdno);
				list.add(vo);
			}
			
			System.out.println("사용자 주문조회 결과, list="+list.size()+", 매개변수 id="+id
					+", startDate="+startDate+", lastDate="+lastDate);
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
		
	}
	
	public ViewVO selectByOrderNo(String id, int ordernum) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		ViewVO vo=null;
			
		try {
			con=pool.getConnection();
			
			String sql="select od.orderno, od.orderqty, p.pdname, p.price, p.filename,p.pdno"
					+" from orderdetail od left join product p"
					+" on od.pdno = p.pdno"
					+" right join orders o"
					+" on od.orderno = o.orderno"
					+" left join member m"
					+" on o.no = m.no"
					+" where od.orderno= ?"
					+" and m.id= ?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, ordernum);
			ps.setString(2, id);
			
			rs=ps.executeQuery();
			if(rs.next()) {
				int orderno=rs.getInt("orderno");
				int orderqty=rs.getInt("orderqty");
				String pdname=rs.getString("pdname");
				int price=rs.getInt("price");
				String filename=rs.getString("filename");
				int pdno=rs.getInt("pdno");
				
				vo=new ViewVO(orderno, orderqty, pdname, price, filename, pdno);
				
			}
			System.out.println("주문번호로 1건 조회 결과, vo="+vo+", 매개변수 ordernum="+ordernum);
			return vo;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	
	
}

