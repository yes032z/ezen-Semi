package com.semi.refund.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.semi.db.ConnectionPoolMgr;
import com.semi.view.model.ViewVO;

public class RefundDAO {
	private ConnectionPoolMgr pool;
	
	public RefundDAO() {
		pool=new ConnectionPoolMgr();
	}
	
	public int refund(ViewVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		int cnt=0;
		try {
			//1,2
			con=pool.getConnection();

			//3
			con.setAutoCommit(false); //자동커밋이 안되게 막는다

			//===트랜재션 시작===

			//[1] 환불 insert
			String sql="insert into refund(refundno, refundbody, pdno, orderno)"
			           +" values(REFUND_SEQ.nextval, ?, ?, ?)";
			
			ps=con.prepareStatement(sql);
			ps.setString(1, vo.getRefundbody());
			ps.setInt(2, vo.getPdno());
			ps.setInt(3, vo.getOrderno());

			//4
			cnt=ps.executeUpdate();
			System.out.println("환불 - insert 결과, cnt="+cnt+", 매개변수 vo="+vo);

			//[2] 오더디테일 delete
			sql="delete from orderdetail"
			   +" where orderno= ?";

			ps=con.prepareStatement(sql);
			ps.setInt(1, vo.getOrderno());

			//4
			cnt=ps.executeUpdate();
			System.out.println("오더디테일 - delete 결과, cnt="+cnt+", 매개변수 vo="+vo);

			con.commit();
			//---------트랜잭션 성공, 종료------

		}catch (SQLException e) {
			e.printStackTrace();
			con.rollback();  //트랜잭션 실패
		}finally {
			con.setAutoCommit(true);
			pool.dbClose(ps, con);
		}
		return cnt;
	}
	
	
}
