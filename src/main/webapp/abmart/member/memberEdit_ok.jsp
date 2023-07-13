<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@include file="../../inc/loginCheck.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="memService" class="com.semi.member.model.MemberService" scope="session"></jsp:useBean>
	<jsp:useBean id="mVo" class="com.semi.member.model.MemberVO" scope="page"></jsp:useBean>
	<jsp:useBean id="zipService" class="com.semi.zipcode.model.ZipcodeService" scope="session"></jsp:useBean>
	<!--  -->
	<%
	//1	
	request.setCharacterEncoding("utf-8");

	String name = request.getParameter("name");
	String id = (String) session.getAttribute("id"); //세션값
	String pwd = request.getParameter("pwd");
	String zipno = request.getParameter("zipno"); 
	String birth = request.getParameter("birth");
	
	String detailaddress = request.getParameter("detailaddress");
	String footsize = request.getParameter("footsize");

	String hp1 = request.getParameter("hp1");
	String hp2 = request.getParameter("hp2");
	String hp3 = request.getParameter("hp3");

	String email1 = request.getParameter("email1");
	String email2 = request.getParameter("email2");
	String email3 = request.getParameter("email3");

	String hp = "";
	String email = "";

	if (hp2 != null && !hp2.isEmpty() && hp3 != null && !hp3.isEmpty()) {
		hp = hp1 + "-" + hp2 + "-" + hp3;
	}

	if (email1 != null && !email1.isEmpty()) {
		if (email2.equals("etc")) {
			if (email3 != null && !email3.isEmpty()) {
		email = email1 + "@" + email3;
			}
		} else {
			email = email1 + "@" + email2;
		}
	}

	mVo.setName(name);
	mVo.setId(id);
	mVo.setPwd(pwd);
	mVo.setFootsize(Integer.parseInt(footsize));	
	mVo.setBirth(birth);
	mVo.setZipno(Integer.parseInt(zipno));
	mVo.setDetailaddress(detailaddress);
	mVo.setTel(hp);
	mVo.setEmail(email);

	//2
	String msg = "", url = "memberEdit.jsp";
	try {
		int result = memService.checkLogin(id, pwd);
		/* 	로그인 처리 관련 상수
			public static final int LOGIN_OK=1; //로그인 성공 */
		if (result == memService.LOGIN_OK) {
			int cnt = memService.editMember(mVo);

			if (cnt > 0) {
		msg = " 회원정보 수정 성공";
		url = "../mypage/mypage.jsp";
			} else {
		msg = " 회원정보 수정 실패";
			}
		} /* public static final int DISAGREE_PWD=2; 비밀번호 불일치 */
		else if (result == memService.DISAGREE_PWD) {
			msg = "비밀번호가 다릅니다";
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}

	request.setAttribute("msg", msg);
	request.setAttribute("url", url);
	%>
	<jsp:forward page="../../inc/message.jsp"></jsp:forward>
	<%@include file="../../inc/bottom.jsp" %>
</body>
</html>