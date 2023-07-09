package com.semi.favoritepd.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.semi.db.ConnectionPoolMgr;
import com.semi.view.model.ViewVO;

public class FavoritePdDAO {
	private ConnectionPoolMgr pool;
	
	public FavoritePdDAO() {
		pool=new ConnectionPoolMgr();
	}
	//마이페이지 > 찜목록 조회
	public List<ViewVO> selectFavoriteByid(String id) throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<ViewVO> list=new ArrayList<>();
		try {
			con=pool.getConnection();
			
			String sql="select f.favoriteno, p.filename, p.pdname, p.price, f.pdno"
					  +" from product p right join favoritepd f"
					  +" on p.pdno = f.pdno"
					  +" left join member m"
					  +" on f.no= m.no"
					  +" where m.id= ?"
					  +" order by f.favoriteno desc";
			ps=con.prepareStatement(sql);
			ps.setString(1, id);
			rs=ps.executeQuery();
			while(rs.next()) {
				int favoriteno=rs.getInt("favoriteno");
				String filename=rs.getString("filename");
				String pdname=rs.getString("pdname");
				int price=rs.getInt("price");
				int pdno=rs.getInt("pdno");
				
				ViewVO vo=new ViewVO(favoriteno, filename, pdname, price, pdno);
				list.add(vo);
			}
			System.out.println("사용자 찜목록 조회결과, list.size="+list.size()+", 매개변수 id="+id);
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	//마이페이지 > 찜목록삭제(다중삭제포함)
	public int deleteFavoriteByNo(String[] favoriteno) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		int result=0;
		
		try {
			con=pool.getConnection();
			con.setAutoCommit(false);
			
			String sql="delete from favoritepd where favoriteno= ?";
			ps=con.prepareStatement(sql);
			
			for(int i=0;i<favoriteno.length;i++) {
				ps.setString(1, favoriteno[i]);
				ps.addBatch();
			}
			
			int[] cnt=ps.executeBatch();
			
			for(int i=0;i<cnt.length;i++) {
				if(cnt[i]>=0) {
					result++;
				}
			}
			if(favoriteno.length==result){
				con.commit();
			}
			
			System.out.println("찜 삭제결과, result="+result+", 매개변수 favoriteno="+favoriteno);
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
