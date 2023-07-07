package com.semi.zipcode.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.semi.db.ConnectionPoolMgr;

public class ZipcodeDAO {
	private ConnectionPoolMgr pool;
	
	public ZipcodeDAO() {
		pool=new ConnectionPoolMgr();
	}
	public List<ZipcodeVO> selectZipcode(String dong) throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;


		List<ZipcodeVO> list = new ArrayList<>();

		try {
			// 1 , 2
			con = pool.getConnection();
			// 3
			String sql = "select * from zipcode "
					+ "where dong like '%' || ? || '%'"; /* sql문 돌려서 확인하기 */
				ps = con.prepareStatement(sql);
				ps.setString(1, dong);
			// 4
			rs = ps.executeQuery();
			
			while(rs.next()) {
				int zipno= rs.getInt("zipno");
				String zipcodeno = rs.getString("zipcodeno");
				String si=rs.getString("si");
				String gu=rs.getString("gu");
				String dong2 = rs.getString("dong");
				String startbunji = rs.getString("startbunji");
				String endbunji = rs.getString("endbunji");
				
				ZipcodeVO vo = new ZipcodeVO(zipno, zipcodeno, si, gu, dong2, startbunji, endbunji);

				list.add(vo);
			}
			System.out.println("우편번호 조회결과 : list.size = " + list.size() + ", 매개변수 dong : " + dong);
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}

	}
}
