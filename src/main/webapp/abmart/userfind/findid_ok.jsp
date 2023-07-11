<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="memService" class="com.semi.member.model.MemberService" scope="session"></jsp:useBean>
<meta charset="UTF-8">
<section class="py-5">

	<%
	request.setCharacterEncoding("utf-8");

	String name = request.getParameter("name");
	String pwd = request.getParameter("pwd");

	
	String id = memService.findId(name, pwd);
	String msg="아이디 찾기 실패!", url="findid.jsp";	
		
		if(id !=null){		
			msg = "아이디찾기 성공! 회원님의 아이디는 : " + id ;
			url = "../member/login.jsp";
	}

	request.setAttribute("msg", msg);
	request.setAttribute("url", url);
	
	%>

	</section>
	<jsp:forward page="../../inc/message.jsp"></jsp:forward>
