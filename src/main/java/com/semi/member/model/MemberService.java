package com.semi.member.model;

import java.sql.SQLException;

//db작업 이외의 로직을 담는 클래스
public class MemberService {
	//아이디 중복확인 관련 상수
	public static final int USABLE_ID=1; //사용가능
	public static final int UNUSABLE_ID=2; //이미 존재하는 아이디여서 사용불가

	//로그인 처리 관련 상수
	public static final int LOGIN_OK=1; //로그인 성공
	public static final int DISAGREE_PWD=2; //비밀번호 불일치
	public static final int NONE_ID=3; //해당 아이디가 존재하지 않는다
	
	private MemberDAO memberDao;
	
	public MemberService() {
		memberDao=new MemberDAO();
	}
	
	public int checkLogin(String id, String pwd) throws SQLException {
		return memberDao.checkLogin(id, pwd);
	}
	public int insertMember(MemberVO vo) throws SQLException  {
		return memberDao.insertMember(vo);
	}
	public MemberVO selectMember(String id) throws SQLException {
		return memberDao.selectMember(id);
	}
	public int editMember(MemberVO vo) throws SQLException {
		return memberDao.editMember(vo);
	}
	public String finPwd(String id, String name) throws SQLException {
		return memberDao.finPwd(id, name);
	}
	public String findId(String name , String pwd) throws SQLException {
		return memberDao.findId(name, pwd);
	}
	public int outMember(String id) throws SQLException {
		return memberDao.outMember(id);
	}
	public int duId(String id) throws SQLException {
		return memberDao.duId(id);
	}
	
}
