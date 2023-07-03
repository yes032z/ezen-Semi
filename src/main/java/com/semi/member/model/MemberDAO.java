package com.semi.member.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.semi.db.ConnectionPoolMgr;

public class MemberDAO {
	private ConnectionPoolMgr pool;
	
	public MemberDAO() {
		pool=new ConnectionPoolMgr();
	}
	

	public int insertMember(MemberVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;

		try {
			//1,2
			con=pool.getConnection();

			//3
			String sql = "";

			ps = con.prepareStatement(sql);
			ps.setString(1, vo.getName());
			

			//4
			int cnt = ps.executeUpdate();
			System.out.println("회원가입 결과 cnt = " + cnt + ", 매개변수 vo = " + vo);

			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}

	
	
	
	
	
}
