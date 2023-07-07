package com.semi.qna.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.semi.db.ConnectionPoolMgr;

public class QnADAO {
	private ConnectionPoolMgr pool;
	
	public QnADAO() {
		pool=new ConnectionPoolMgr();
	}
	/**
	 * 상품 QnA등록 메서드
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	public int insertQnA(QnAVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		int cnt=0;
		
		try {
			con=pool.getConnection();
			String sql="insert into qna(qnano, qnabody, qnaview, no, pdno)"
					+ " values(qna_seq.nextval, ?, ?, ?, ?)";
			ps=con.prepareStatement(sql);
			ps.setString(1, vo.getQnabody());
			ps.setString(2, vo.getQnaview());
			ps.setInt(3, vo.getNo());
			ps.setInt(4, vo.getPdno());
			
			cnt=ps.executeUpdate();
			System.out.println("QnA 등록 결과, cnt="+cnt+", 매개변수 vo="+vo);
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	
	
}
