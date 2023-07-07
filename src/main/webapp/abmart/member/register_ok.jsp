<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../inc/top.jsp" %>
<section class="py-5">
	<jsp:useBean id="memService" class="com.semi.member.model.MemberService" 
	scope="session"></jsp:useBean>
<jsp:useBean id="mVo" class="com.semi.member.model.MemberVO" scope="page"></jsp:useBean>

<%
	//1	
	request.setCharacterEncoding("utf-8");
	
	String name = request.getParameter("name");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String zipno = request.getParameter("zipno");
	String detailaddress = request.getParameter("detailaddress");
	String footsize = request.getParameter("footsize");
	
	String hp1 = request.getParameter("hp1");
	String hp2 = request.getParameter("hp2");
	String hp3 = request.getParameter("hp3");
	
	String email1 = request.getParameter("email1");
	String email2 = request.getParameter("email2");
	String email3 = request.getParameter("email3");
	
	String hp="";
	String email ="";
	
	if(hp2!=null && !hp2.isEmpty() && hp3!=null && !hp3.isEmpty()){
	      hp=hp1+"-"+hp2+"-"+hp3;
	}
	
	if(email1!=null && !email1.isEmpty()){
	   if(email2.equals("etc")){
		  if(email3!=null && !email3.isEmpty()){
	      	email=email1+"@"+email3;
		  }
	   }else{
	      email = email1+"@"+email2;
	   }
	}	
	
	mVo.setName(name);
	mVo.setId(id);
	mVo.setPwd(pwd);
	mVo.setFootsize(Integer.parseInt(footsize));	
	mVo.setZipno(Integer.parseInt(zipno));
	mVo.setDetailaddress(detailaddress);
	mVo.setTel(hp);
	mVo.setEmail(email);

	//2
	String msg="회원가입 실패!", url="register.jsp";
	try{
		int cnt = memService.insertMember(mVo);

		//3
		if(cnt>0){
			msg="회원가입되었습니다.";
			url="../../index.jsp";
		}
	}catch(SQLException e){
      	e.printStackTrace();
   	}

	request.setAttribute("msg", msg);
	request.setAttribute("url", url);
	
%>
</section>
<jsp:forward page="../../inc/message.jsp"></jsp:forward>
<%@include file="../../inc/bottom.jsp" %>
