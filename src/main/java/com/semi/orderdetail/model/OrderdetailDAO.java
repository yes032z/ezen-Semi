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
			
			String sql="select o.orderno, p.filename, p.pdname, od.orderqty, p.price, o.pickup, o.orderregdate"
					+" from orderdetail od left join product p"
					+" on od.pdno = p.pdno"
					+" right join orders o"
					+" on od.orderno = o.orderno"
					+" left join member m"
					+" on o.no= m.no"
					+" where m.id= ?";
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
				
				ViewVO vo=new ViewVO(orderno, filename, pdname, orderqty, price, pickup, orderregdate);
				list.add(vo);
			}
			
			System.out.println("사용자 주문조회 결과, list="+list.size()+", 매개변수 id="+id
					+", startDate="+startDate+", lastDate="+lastDate);
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
		
	}
	
	
}

