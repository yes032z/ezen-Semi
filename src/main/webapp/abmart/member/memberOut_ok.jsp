<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../../inc/loginCheck.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberOut_ok.jsp</title>
</head>
<body>
<jsp:useBean id="memService" class="com.semi.member.model.MemberService" scope="session"></jsp:useBean>
<%
	request.setCharacterEncoding("utf-8");


	String pwd = request.getParameter("pwd");
	String id = (String)session.getAttribute("id");
	
	String msg = "", url="memberOut.jsp";
	
	try{
		int result = memService.checkLogin(id, pwd);
				
		if(result == memService.LOGIN_OK){
		int cnt = memService.outMember(id);
		
		if(cnt > 0) {		
			msg = "회원 탈퇴 완료";
			url ="../../index.jsp";
			session.invalidate(); //세션 무효화(지우기)
			Cookie ck = new Cookie("ck_userid", id);
			ck.setPath("/");
			ck.setMaxAge(0); // 쿠키 삭제
			response.addCookie(ck); // 삭제된 값 담아주기
		}else{
			msg= "회원 탈퇴 실패";
		}
		
		}else if(result == memService.DISAGREE_PWD){
			msg =" 비밀번호 오류";
		}
	}catch(SQLException e){
		e.printStackTrace();
	}
	request.setAttribute("msg",msg);
	request.setAttribute("url", url);
%>
<jsp:forward page="../../inc/message.jsp"></jsp:forward>

</body>
</html>