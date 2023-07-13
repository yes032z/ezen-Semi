package com.semi.productsize.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.semi.db.ConnectionPoolMgr;

public class ProductSizeDAO {
	private ConnectionPoolMgr pool;
	
	public ProductSizeDAO(){
		pool=new ConnectionPoolMgr();
	}
	
	public List<ProductSizeVO> selectAllByNo(int pdno) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		List<ProductSizeVO> list=new ArrayList<>();
		try {
			con=pool.getConnection();
			
			String sql="select * from productsize where pdno= ? order by pdno, pdsizeno";
			ps=con.prepareStatement(sql);
			
			ps.setInt(1, pdno);
			
			rs=ps.executeQuery();
			while(rs.next()) {
				int pdsizeno=rs.getInt(1);
				int pdsize=rs.getInt(2);
				int pdno2=rs.getInt(3);
				
				ProductSizeVO vo=new ProductSizeVO(pdsizeno, pdsize, pdno2);
				list.add(vo);
			}
			System.out.println("번호로 사이즈 조회 결과 list.size()="+list.size()+", pdno="+pdno);
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
}
