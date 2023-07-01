package com.semi.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

//dbcp(DataBase Connection Pool)를 이용하여 커넥션 객체를 빌려오는 클래스
public class ConnectionPoolMgr {
	private DataSource ds; //톰캣이 등록한 ConnectionPool

	public ConnectionPoolMgr() {
		try {	
			Context ctx = new InitialContext();
			ds =(DataSource) ctx.lookup("java:comp/env/jdbc/oracledb");
		}catch(NamingException e) {
			e.printStackTrace();
		}
	}
	
	//커넥션 객체 대여
	public Connection getConnection() throws SQLException {
		Connection con=ds.getConnection();
		//=> Connection Pool에서 커넥션을 빌려온다.
		
		System.out.println("dbcp - db연결 여부, con="+con);
		return con;
	}
	
	//커넥션 객체 반납 - 오버로딩 메서드로 구현
	public void dbClose(PreparedStatement ps, Connection conn) throws SQLException {
		if(ps!=null) ps.close();
		if(conn!=null) conn.close(); //Connection Pool에 커넥션 반납
	}
	
	public void dbClose(ResultSet rs,PreparedStatement ps, Connection conn) 
			throws SQLException {
		if(rs!=null) rs.close();
		if(ps!=null) ps.close();
		if(conn!=null) conn.close();
	}
}
