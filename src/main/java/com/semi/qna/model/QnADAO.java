package com.semi.qna.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.semi.db.ConnectionPoolMgr;
import com.semi.view.model.ViewVO;

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
	/**
	 * 마이페이지> 내가작성한 Q&A 조회
	 * @param id //회원아이디
	 * @return
	 * @throws SQLException
	 */
	public List<ViewVO> selectQnAByid(String id, String startDate,String lastDate) throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<ViewVO> list=new ArrayList<>();
		
		try {
			con=pool.getConnection();
			
			String sql="select q.qnano, q.qnabody, p.pdname, q.qnaview, q.qnaregdate"
					 +" from qna q left join product p"
					 +" on q.pdno= p.pdno"
					 +" left join member m"
					 +" on q.no= m.no"
					 +" where m.id= ? and q.qnaregdate>=to_date( ? )"
					 +" and q.qnaregdate<to_date( ? )+1"
					 +" order by q.qnaregdate desc";
			ps=con.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, startDate);
			ps.setString(3, lastDate);
			
			rs=ps.executeQuery();
			while(rs.next()) {
				int qnano=rs.getInt("qnano");
				String qnabody=rs.getString("qnabody");
				String pdname=rs.getString("pdname");
				String qnaview=rs.getString("qnaview"); //공개유무
				Timestamp qnaregdate=rs.getTimestamp("qnaregdate");
				
				ViewVO vo=new ViewVO(qnano, qnabody, pdname, qnaview, qnaregdate);
				list.add(vo);
			}
			System.out.println("사용자 Q&A 목록 조회 결과, list.size="+list.size()+", 매개변수 id="+id);
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	
	
}
