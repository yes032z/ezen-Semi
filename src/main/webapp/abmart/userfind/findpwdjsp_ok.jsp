<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="memService" class="com.semi.member.model.MemberService" scope="session"></jsp:useBean>
<meta charset="UTF-8">
<section class="py-5">

	<%
	request.setCharacterEncoding("utf-8");

	String name = request.getParameter("name");
	String id = request.getParameter("id");

	
	String pwd = memService.finPwd(id, name);
	String msg="비밀번호 찾기 실패!", url="findpwdjsp.jsp";	
		
		if(pwd !=null){		
			msg = "비밀번호찾기 성공! 회원님의 비밀번호 : " + pwd ;
			url = "../member/login.jsp";
	}

	request.setAttribute("msg", msg);
	request.setAttribute("url", url);
	
	%>

	</section>
	<jsp:forward page="../../inc/message.jsp"></jsp:forward>
