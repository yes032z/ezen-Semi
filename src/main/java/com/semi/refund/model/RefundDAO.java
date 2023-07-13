package com.semi.refund.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.semi.db.ConnectionPoolMgr;
import com.semi.view.model.ViewVO;

public class RefundDAO {
	private ConnectionPoolMgr pool;
	
	public RefundDAO() {
		pool=new ConnectionPoolMgr();
	}
	
	public int insertRefund(RefundVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		int cnt=0;
		try {
			con=pool.getConnection();

			String sql="insert into refund(refundno, refundbody, pdno, orderno)"
			           +" values(REFUND_SEQ.nextval, ?, ?, ?)";
			
			ps=con.prepareStatement(sql);
			ps.setString(1, vo.getRefundbody());
			ps.setInt(2, vo.getPdno());
			ps.setInt(3, vo.getOrderno());

			cnt=ps.executeUpdate();
			System.out.println("환불 - insert 결과, cnt="+cnt+", 매개변수 vo="+vo);
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	public List<ViewVO> selectAll(String id) throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<ViewVO> list=new ArrayList<>();
		try {
			con=pool.getConnection();
			
			String sql="select r.refundno, o.orderno, p.filename, p.pdname, od.orderqty, p.price, o.pickup, o.orderregdate, p.pdno"
					 +" from orderdetail od left join product p"
					 +" on od.pdno = p.pdno"
					 +" left join refund r"
					 +" on od.pdno = r.pdno"
					 +" right join orders o"
					 +" on od.orderno = o.orderno"
					 +" left join member m"
					 +" on o.no= m.no"
					 +" where exists (select 1 from refund r where r.orderno= od.orderno and r.pdno= od.pdno)"
					 +" and m.id= ?"
					 +" order by o.orderregdate desc";
			ps=con.prepareStatement(sql);
			ps.setString(1, id);
			
			rs=ps.executeQuery();
			while(rs.next()) {
				int refundno=rs.getInt("refundno");
				int orderno=rs.getInt("orderno");
				String filename=rs.getString("filename");
				String pdname=rs.getString("pdname");
				int orderqty=rs.getInt("orderqty");
				int price=rs.getInt("price");
				String pickup=rs.getString("pickup");
				Timestamp orderregdate=rs.getTimestamp("orderregdate");
				int pdno=rs.getInt("pdno");
				
				ViewVO vo=new ViewVO(refundno, orderno, filename, pdname, orderqty, price, pickup, orderregdate, pdno);
				list.add(vo);
			}
			
			System.out.println("사용자 주문조회 결과, list="+list.size()+", 매개변수 id="+id);
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}	
	
	//마이페이지 > 환불요청삭제(다중삭제포함)
		public int deleterefundByRNo(String[] refundno) throws SQLException {
			Connection con=null;
			PreparedStatement ps=null;
			int result=0;
			
			try {
				con=pool.getConnection();
				con.setAutoCommit(false);
				
				String sql="delete from refund where refundno= ?";
				ps=con.prepareStatement(sql);
				
				for(int i=0;i<refundno.length;i++) {
					ps.setString(1, refundno[i]);
					ps.addBatch();
				}
				
				int[] cnt=ps.executeBatch();
				
				for(int i=0;i<cnt.length;i++) {
					if(cnt[i]>=0) {
						result++;
					}
				}
				if(refundno.length==result){
					con.commit();
				}
				
				System.out.println("환불요청 삭제결과, result="+result+", 매개변수 refundno="+refundno);
			}catch (SQLException e) {
				e.printStackTrace();
				con.rollback();  	
			}finally {
				con.setAutoCommit(true);
				pool.dbClose(ps, con);
			}
			return result;
		}
}
