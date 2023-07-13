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

	//마이페이지 최근찜 4건 조회
	public List<ViewVO> select4FavoriteByid(String id) throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<ViewVO> list=new ArrayList<>();
		try {
			con=pool.getConnection();

			String sql="select A.filename, A.pdname, A.price, A.brand, A.pdno"
					+" from("
					+" select f.favoriteno, p.filename, p.pdname, p.brand, p.price, f.pdno"
					+" from product p right join favoritepd f"
					+" on p.pdno = f.pdno"
					+" left join member m"
					+" on f.no= m.no"
					+" where m.id= ?"
					+" order by f.favoriteno desc"
					+" )A"
					+" where rownum<=4";
			ps=con.prepareStatement(sql);
			ps.setString(1, id);
			rs=ps.executeQuery();
			while(rs.next()) {
				String filename=rs.getString("filename");
				String pdname=rs.getString("pdname");
				String brand=rs.getString("brand");
				int price=rs.getInt("price");
				int pdno=rs.getInt("pdno");

				ViewVO vo=new ViewVO(filename, pdname, brand, price, pdno);
				list.add(vo);
			}
			System.out.println("찜목록 최신 4건 조회결과, list.size="+list.size()+", 매개변수 id="+id);
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}

	public int insertFavoritePd(int no,int pdno) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con=pool.getConnection();
			
			String sql="insert into favoritepd"
					+ " values(favoritepd_seq.nextval,?,?)";
			ps=con.prepareStatement(sql);
			
			ps.setInt(1, no);
			ps.setInt(2, pdno);
			
			int cnt=ps.executeUpdate();
			
			System.out.println("찜한상품 등록 결과 cnt="+cnt+", 매개변수 no="+no+", pdno="+pdno);
			return cnt;
			
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	public Boolean selectByNo(int no,int pdno) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		boolean bool=false;
		
		try {
			con=pool.getConnection();
			
			String sql="select count(*) from favoritepd where no= ? and pdno=?";
			ps=con.prepareStatement(sql);
			
			ps.setInt(1, no);
			ps.setInt(2, pdno);
			
			rs=ps.executeQuery();
			if(rs.next()) {
				int cnt=rs.getInt(1);
				
				if(cnt>0) {
					bool=true;
				}
			}
			System.out.println("찜한 상품 등록 여부 결과 bool="+bool+", 매개변수 no="+no+", pdno="+pdno);
			return bool;
			
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public int deleteFavoriteByNo(int no,int pdno) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;

		try {
			con=pool.getConnection();

			String sql="delete from favoritepd where no=? and pdno=?";
			ps=con.prepareStatement(sql);

			ps.setInt(1, no);
			ps.setInt(2, pdno);

			int cnt=ps.executeUpdate();

			System.out.println("찜 삭제 결과 cnt="+cnt+", 매개변수 no=+"+no+", pdno="+pdno);
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
}
