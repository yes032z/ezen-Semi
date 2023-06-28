package com.myhw.person.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.myhw.db.ConnectionPoolMgr;

public class personDAO {
	private ConnectionPoolMgr pool;
	
	public personDAO() {
		pool=new ConnectionPoolMgr();
	}
	
	/**
	 * 회원 등록 메서드
	 * @param vo
	 * @return
	 * @throws SQLException 
	 */
	public int insertPerson(personVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		int cnt=0;
		try {
			con=pool.getConnection();
			
			String sql="insert into person(no, name, tel)"
					  +" values(person_seq.nextval, ?, ?)";
			ps=con.prepareStatement(sql);
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getTel());
			
			cnt=ps.executeUpdate();
			System.out.println("회원등록 결과, cnt="+cnt+", 매개변수 vo="+vo);
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
		
	}//insertPerson
	
	/**
	 * 회원 전체 조회
	 * @return
	 * @throws SQLException 
	 */
	public List<personVO> selectAll(String keyword, String condition) throws SQLException{
	/*
		select * from person
		where name like '%'||?||'%';

		select * from person
		where tel like '%'||?||'%';
	*/
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<personVO> list=new ArrayList<>();
		
		try {
			con=pool.getConnection();
			
			String sql="select * from person";
			//검색의 경우 where 조건절 추가 
			if(keyword!=null && !keyword.isEmpty()) {
				sql+=" where "+condition+" like '%'|| ? ||'%'";	
			}
			sql+=" order by no desc";
			ps=con.prepareStatement(sql);
			
			if(keyword!=null && !keyword.isEmpty()) {
				ps.setString(1, keyword);
			}

			rs=ps.executeQuery();
			while(rs.next()) {
				int no=rs.getInt("no");
				String name=rs.getString("name");
				String tel=rs.getString("tel");
				Timestamp regdate=rs.getTimestamp("regdate");
				
				personVO vo=new personVO(no, name, tel, regdate);
				list.add(vo);
			}
			System.out.println("회원 조회결과, list.size="+list.size()
				+", 매개변수 keyword="+keyword+", condition="+condition);
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
		
	}//selectAll
	/**
	 * 회원 상세 조회
	 * @param no
	 * @return
	 * @throws SQLException
	 */
	public personVO selectByNo(int no) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		personVO vo=new personVO();
		
		try {
			con=pool.getConnection();
			
			String sql="select * from person "
					 +" where no= ?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, no);
			
			rs=ps.executeQuery();
			if(rs.next()) {
				String name=rs.getString("name");
				String tel=rs.getString("tel");
				Timestamp regdate=rs.getTimestamp("regdate");
				
				vo.setName(name);
				vo.setTel(tel);
				vo.setRegdate(regdate);
			}
			System.out.println("회원 상세조회 결과, vo="+vo+", 매개변수 no="+no);
			return vo;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}//selectByNo
	
	public int updatePerson(personVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		int cnt=0;
		try {
			con=pool.getConnection();
			
			String sql="update person"
					 +" set name= ?, tel= ?"
					 +" where no= ?";
			ps=con.prepareStatement(sql);
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getTel());
			ps.setInt(3, vo.getNo());
			
			cnt=ps.executeUpdate();
			System.out.println("회원정보 수정결과, cnt="+cnt+", 매개변수 vo="+vo);
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}//updatePerson
	
	public int deletePerson(int no) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		int cnt=0;
		
		try {
			con=pool.getConnection();
			
			String sql="delete from person"
					  +" where no= ?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, no);
			
			cnt=ps.executeUpdate();
			System.out.println("회원 삭제 결과, cnt="+cnt+", 매개변수 no="+no);
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}//deletePerson
	
	
}
