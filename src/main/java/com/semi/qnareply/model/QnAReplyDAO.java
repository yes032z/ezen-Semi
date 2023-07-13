package com.semi.qnareply.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import com.semi.db.ConnectionPoolMgr;

public class QnAReplyDAO {
	private ConnectionPoolMgr pool;
	
	public QnAReplyDAO() {
		pool=new ConnectionPoolMgr();
	}
	/**
	 * 상품QnA 댓글등록 메서드
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	public int insertQnAReply(QnAReplyVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		int cnt=0;
		try {
			con=pool.getConnection();
			String sql="insert into qnareply(qnareplyno, qnareplybody, qnano)"
					+ " values(qnareply_seq.nextval, ?, ?)";
			ps=con.prepareStatement(sql);
			ps.setString(1, vo.getQnareplybody());
			ps.setInt(2, vo.getQnano());
		
			cnt=ps.executeUpdate();
			System.out.println("상품QnA 댓글 등록결과, cnt="+cnt+", 매개변수 vo="+vo);
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	public QnAReplyVO selectByQnANo(int qnaNo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		QnAReplyVO vo=null;
		try{
			con=pool.getConnection();
			
			String sql="select * from qnareply where qnano=?";
			ps=con.prepareStatement(sql);
			
			ps.setInt(1, qnaNo);
			
			rs=ps.executeQuery();
			while(rs.next()) {
				int qnaRelyNo=rs.getInt(1);
				String qnaReplyBody=rs.getString(2);
				Timestamp qnaRegdate=rs.getTimestamp(3);
				int qnaNo2=rs.getInt(4);
				
				vo=new QnAReplyVO(qnaRelyNo, qnaReplyBody, qnaRegdate, qnaNo2);
			}
			
			System.out.println("QnA답변 조회 결과 vo="+vo+", 매개변수 qnaNo="+qnaNo);
			return vo;
			
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
}
