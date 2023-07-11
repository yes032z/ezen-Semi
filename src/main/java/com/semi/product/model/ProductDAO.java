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
			
			String sql="insert into product(pdno, pdname, price, kind, brand, filename, filesize, originalfilename)"
					+ " values(product_seq.nextval,?,?,?,?,?,?,?)";
			ps=con.prepareStatement(sql);
			
			ps.setString(1, vo.getPdname());
			ps.setInt(2, vo.getPrice());
			ps.setString(3, vo.getKind());
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
	public List<ProductVO> selectPdAll(String brand, String kind,String grade,String pri) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		List<ProductVO> list =new ArrayList<>();
		try {
			con=pool.getConnection();
			
			String sql="select distinct p.pdno,p.pdname,p.price,p.kind,p.brand,p.pdregdate,p.filename,p.filesize,p.originalfilename,r.reviewgrade"
					+ " from product p left join review r"
					+ " on p.pdno = r.pdno";
			if(brand!=null && !brand.isEmpty()) {
				sql+=" where brand=? ";
			}
			if(kind!=null && !kind.isEmpty()) {
				sql+=" where kind=? ";
			}
			if(grade!=null && !grade.isEmpty()) {
				sql+=" order by r.reviewgrade desc";
			}
			if(pri!=null && !pri.isEmpty()) {
				sql+=" order by p.price";
			}
			if((pri==null || pri.isEmpty()) && (grade==null || grade.isEmpty())) {
				sql+=" order by p.pdno desc";
			}
			
			ps=con.prepareStatement(sql);
			
			if(brand!=null && !brand.isEmpty()) {
				ps.setString(1, brand);
			}
			if(kind!=null && !kind.isEmpty()) {
				ps.setString(1, kind);
			}
			
			
			rs=ps.executeQuery();
			while(rs.next()) {
				int pdno=rs.getInt(1);
				String pdname=rs.getString(2);
				int price=rs.getInt(3);
				String kind2=rs.getString(4);
				String brand2=rs.getString(5);
				Timestamp pdRegdate=rs.getTimestamp(6);
				String fileName=rs.getString(7);
				Long fileSize=rs.getLong(8);
				String originalFileName=rs.getString(9);
				int reviewgrade=rs.getInt(10);
				
				ProductVO vo=new ProductVO(pdno, pdname, price, kind2, brand2, pdRegdate, fileName, fileSize, originalFileName,reviewgrade);
				
				list.add(vo);
			}
			
			System.out.println("상품 전체 조회 결과 list.size()="+list.size());
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
		
	}
	
	public ProductVO selectPdByNo(int pdno) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		ProductVO vo=null;
		try {
			con=pool.getConnection();
			
			String sql="select pdno,pdname,price,kind,brand,pdregdate,filename,filesize,originalfilename from product"
					+ "	where pdno=?";
			ps=con.prepareStatement(sql);
			
			ps.setInt(1, pdno);
			
			rs=ps.executeQuery();
			if(rs.next()) {
				int pdno2=rs.getInt(1);
				String pdname=rs.getString(2);
				int price=rs.getInt(3);
				String kind2=rs.getString(4);
				String brand2=rs.getString(5);
				Timestamp pdRegdate=rs.getTimestamp(6);
				String fileName=rs.getString(7);
				Long fileSize=rs.getLong(8);
				String originalFileName=rs.getString(9);
				
				vo=new ProductVO(pdno2, pdname, price, kind2, brand2, pdRegdate, fileName, fileSize, originalFileName);
			}
			System.out.println("번호로 상품 검색 결과 vo="+vo+", 매개변수 pdno="+pdno);
			return vo;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
}
