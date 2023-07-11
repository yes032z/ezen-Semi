package com.semi.productdetail.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.semi.db.ConnectionPoolMgr;

public class ProductDetailDAO {
	private ConnectionPoolMgr pool;
	
	public ProductDetailDAO() {
		pool=new ConnectionPoolMgr();
	}
	
	public List<ProductDetailVO> selectByPdNo(int pdno) throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		List<ProductDetailVO> list =new ArrayList<>();
		try {
			con=pool.getConnection();
			
			String sql="select * from productdetail where pdno=?";
			ps=con.prepareStatement(sql);
			
			ps.setInt(1, pdno);
			
			rs=ps.executeQuery();
			while(rs.next()) {
				int pdno2=rs.getInt(1);
				String filename=rs.getString(2);
				long filesize=rs.getLong(3);
				String originalfilename=rs.getString(2);
				
				ProductDetailVO vo=new ProductDetailVO(pdno2, filename, filesize, originalfilename);
				list.add(vo);
			}
			
			System.out.println("상품디테일(이미지) 번호 조회 결과 list.size()="+list.size()+", 매개변수 pdno="+pdno);
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
}
