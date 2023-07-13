package com.semi.intostock.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.semi.db.ConnectionPoolMgr;
import com.semi.view.model.ViewVO;

public class IntostockDAO {
	private ConnectionPoolMgr pool;
	
	public IntostockDAO() {
		pool=new ConnectionPoolMgr();
	}
	
	public List<ViewVO> selectintoStock(String id) throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<ViewVO> list=new ArrayList<>();
		try {
			con=pool.getConnection();
			
			String sql="select f.favoriteno, p.pdno, it.regdate ,s.stockqty, p.pdname, pr.pdsize,p.filename"
					+" from intostock it right join productsize pr"
					+" on it.pdsizeno = pr.pdsizeno"
					+" left join stock s"
					+" on pr.pdsizeno = s.pdsizeno"
					+" right join product p"
					+" on pr.pdno = p.pdno"
					+" right join favoritepd f"
					+" on p.pdno = f.pdno"
					+" left join member m"
					+" on f.no = m.no"
					+" where it.intostockqty>0"
					+" and pr.pdsize = (select footsize from member where id=? )"
					+" and m.id= ?"
					+" order by it.regdate asc";
					
			ps=con.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, id);
			
			rs=ps.executeQuery();
			while(rs.next()) {
				int favoriteno=rs.getInt("favoriteno");
				int pdno=rs.getInt("pdno");
				Timestamp regdate=rs.getTimestamp("regdate");
				int stockqty=rs.getInt("stockqty");
				String pdname=rs.getString("pdname");
				int pdsize=rs.getInt("pdsize");
				String filename=rs.getString("filename");
				
				ViewVO vo=new ViewVO(favoriteno, pdno, regdate, stockqty, pdname, pdsize, filename);
				list.add(vo);
			}
			
			System.out.println("상품 입고 알림결과, list.size="+list.size()+", 매개변수 id="+id);
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	
}
