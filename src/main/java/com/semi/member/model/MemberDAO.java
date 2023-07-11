package com.semi.member.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

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
			String sql="select pwd no from member where id= ? and outdate is null";
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

	public int insertMember(MemberVO vo) throws SQLException {
		Connection con=null; 
		PreparedStatement ps=null;

		try { //1,2 
			con=pool.getConnection();

			//3 
			String sql =  "insert into member(no,name,id,pwd,footsize,zipno,DETAILADDRESS,tel,email) "
					+ "values(member_seq.nextval,?,?,?,?,?,?,?,?)";

			ps = con.prepareStatement(sql);
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getId()); 
			ps.setString(3, vo.getPwd());
			ps.setInt(4,vo.getFootsize());
			ps.setInt(5, vo.getZipno());
			ps.setString(6,vo.getDetailaddress());
			ps.setString(7, vo.getTel());
			ps.setString(8, vo.getEmail());

			//4 
			int cnt = ps.executeUpdate();
			System.out.println("회원가입 결과 cnt = " + cnt +", 매개변수 vo = " + vo);

			return cnt;
		}finally { 
			pool.dbClose(ps, con); 
		} 

	}
	public MemberVO selectMember(String id) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		MemberVO vo = new MemberVO();
		try {
			con = pool.getConnection();

			String sql = "select * from member where id = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, id);

			rs = ps.executeQuery();
			if(rs.next()) {            
				int no = rs.getInt("no");
				String name = rs.getString("name");
				String id2 = rs.getString("id");
				String pwd = rs.getString("pwd");
				String email = rs.getString("email");
				String tel = rs.getString("tel");
				int zipno = rs.getInt("zipno");
				int footsize = rs.getInt("footsize");
				String birth = rs.getString("birth");
				String detailaddress = rs.getString("detailaddress");
				Timestamp regdate = rs.getTimestamp("regdate");	
				Timestamp outdate = rs.getTimestamp("outdate");

				vo.setName(name);
				vo.setId(id2);
				vo.setPwd(pwd);
				vo.setTel(tel);
				vo.setZipno(zipno);
				vo.setBirth(birth);
				vo.setFootsize(footsize);
				vo.setDetailaddress(detailaddress);
				vo.setEmail(email);
				vo.setNo(no);
				vo.setRegdate(regdate);
				vo.setOutdate(outdate);
			}
			System.out.println("회원 정보: " + vo + ", 매개변수 id: " + id);

			return vo;
		} finally {
			pool.dbClose(rs, ps, con);
		}
	}
	public int editMember(MemberVO vo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;

		try {

			con = pool.getConnection();

			String sql = "update member "
					+ "set birth=?, email =?, detailaddress=?, "
					+ "tel =?, footsize =?, zipno=? "
					+ "where id =?";

			ps = con.prepareStatement(sql);

			ps.setString(1,vo.getBirth());
			ps.setString(2,vo.getEmail());
			ps.setString(3,vo.getDetailaddress());
			ps.setString(4,vo.getTel());
			ps.setInt(5,vo.getFootsize());
			ps.setInt(6, vo.getZipno());
			ps.setString(7,vo.getId());

			int cnt = ps.executeUpdate();
			System.out.println("정보 수정 결과 cnt : " + cnt + ", 매개변수 vo : " + vo);

			return cnt;

		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	public String finPwd(String id, String name) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		String pwd = null; //찾는 pwd
		try {
			con = pool.getConnection();

			String sql ="select pwd "
					+ "from member "
					+ "where id =? and name =? ";

			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2,name);

			rs = ps.executeQuery();
			while(rs.next()) {
				pwd = rs.getString("pwd");


			}
			return pwd;

		}finally {
			pool.dbClose(rs, ps, con);
		}
	}

	public String findId(String name , String pwd) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String id = null; // 찾는 id
		
		try {
			con = pool.getConnection();
			String sql = "select id "
					+ "from member "
					+ "where name =? and pwd = ? ";
			ps = con.prepareStatement(sql);

			ps.setString(1, name);
			ps.setString(2,pwd);

			rs = ps.executeQuery();
			while(rs.next()) {
				id = rs.getString("id");

			}
			return id;
		}finally {
			pool.dbClose(ps, con);


		}
	}
}



