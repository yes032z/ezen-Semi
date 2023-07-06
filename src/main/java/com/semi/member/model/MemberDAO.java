package com.semi.member.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.semi.db.ConnectionPoolMgr;

public class MemberDAO {
	private ConnectionPoolMgr pool;
	
	public MemberDAO() {
		pool=new ConnectionPoolMgr();
	}
	
	/**
	 * 로그인 처리 관련 메서드
	 * @param userid
	 * @param pwd
	 * @return
	 * @throws SQLException
	 */
	public int checkLogin(String id, String pwd) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		try {
			//1,2
			con=pool.getConnection();
			
			//3									//outdate is null => 탈퇴하지 않은 회원
			String sql="select pwd from member where id= ? and outdate is null";
			ps=con.prepareStatement(sql);
			ps.setString(1, id);
			
			//4
			int result=0; //0 => 로그인실패
			rs=ps.executeQuery();
			if(rs.next()) {
				String dbPwd=rs.getString(1);
				if(dbPwd.equals(pwd)) {
					result=MemberService.LOGIN_OK; //로그인 성공
				}else {
					result=MemberService.DISAGREE_PWD; //비밀번호 불일치
				}
			}else {
				result=MemberService.NONE_ID; //해당 아이디가 없음
			}
			
			System.out.println("로그인 처리 결과, result="+result
						+", 매개변수 id="+id+", pwd="+pwd);
			return result;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	
	
	
	
}
