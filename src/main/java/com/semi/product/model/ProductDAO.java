package com.semi.product.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.semi.db.ConnectionPoolMgr;

public class ProductDAO {
	private ConnectionPoolMgr pool;
	
	public ProductDAO() {
		pool=new ConnectionPoolMgr();
	}
	
	//상품 등록
	public int insertPd(ProductVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con=pool.getConnection();
			
			String sql="insert into product(pdno, productno, pdname, price, brand, filename, filesize, originalfilename)"
					+ " values(product_seq.nextval,?,?,?,?,?,?,?)";
			ps=con.prepareStatement(sql);
			
			ps.setString(1, vo.getProductNo());
			ps.setString(2, vo.getPdname());
			ps.setInt(3, vo.getPrice());
			ps.setString(4, vo.getBrand());
			ps.setString(5, vo.getFilename());
			ps.setLong(6, vo.getFilesize());
			ps.setString(7, vo.getOriginalfilename());
			
			int cnt=ps.executeUpdate();
			
			System.out.println("상품 등록 결과 cnt="+cnt+", 매개변수 vo="+vo);
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
		
	}
	
	//상품 리스트
	public List<ProductVO> selectAllPd() throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		List<ProductVO> list =new ArrayList<>();
		try {
			con=pool.getConnection();
			
			String sql="select pdno,productno,pdname,price,brand,pdregdate,filename,filesize,originalfilename from product order by pdno desc";
			ps=con.prepareStatement(sql);
			
			rs=ps.executeQuery();
			while(rs.next()) {
				int pdno=rs.getInt(1);
				String productNo=rs.getString(2);
				String pdname=rs.getString(3);
				int price=rs.getInt(4);
				String brand=rs.getString(5);
				Timestamp pdRegdate=rs.getTimestamp(6);
				String fileName=rs.getString(7);
				Long fileSize=rs.getLong(8);
				String originalFileName=rs.getString(9);
				
				ProductVO vo=new ProductVO(pdno, productNo, pdname, price, brand, pdRegdate, fileName, fileSize, originalFileName);
				
				list.add(vo);
			}
			
			System.out.println("상품 전체 조회 결과 list.size()="+list.size());
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
		
	}
}
