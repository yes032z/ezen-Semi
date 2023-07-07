<%@page import="com.semi.member.model.MemberService"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="memService" class="com.semi.member.model.MemberService"
	 scope="session"></jsp:useBean>
<%
	//login.jsp 에서 post방식으로 submit됨
	
	//1 post방식 - 파라미터 읽어오기 (+한글인코딩)
	request.setCharacterEncoding("utf-8");
	
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	String chkSave=request.getParameter("chkSave");
	
	//2 db작업
	String msg="로그인 처리 실패", url="login.jsp";
	try{
		int result=memService.checkLogin(id, pwd);
				
		
	//3 결과처리
		if(result==MemberService.LOGIN_OK){
			//[1] 세션에 로그인 정보 저장
			session.setAttribute("id", id);
			
			//[2] 쿠키에 저장- 아이디 저장하기가 체크된 경우 on, null
			if(chkSave!=null){ //체크한 경우
				Cookie ck=new Cookie("ck_userid", id);
				ck.setPath("/"); //path 지정
				ck.setMaxAge(1000*24*60*60); //1000일, 유효기간 설정
				response.addCookie(ck);
			}else{ //체크하지 않은 경우 null, 기존 쿠키 제거
				Cookie ck=new Cookie("ck_userid", id);
				ck.setPath("/");  // "/" =>webapp의 경로에 쿠키생성
				//path 지정 //경로를 지정하지 않으면 로그인 폴더에만 쿠키생성
				ck.setMaxAge(0);
				response.addCookie(ck);
			}
			msg= id+ "님 로그인되었습니다.";
			url="../../index.jsp";
					
		}else if(result==MemberService.DISAGREE_PWD){
			msg="비밀번호가 일치하지 않습니다.";
		}else if(result==MemberService.NONE_ID){
			msg="해당 아이디가 존재하지 않습니다.";
		}
	}catch(SQLException e){
		e.printStackTrace();
	}
	
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);

%>
<jsp:forward page="../../inc/message.jsp"></jsp:forward>
</body>
</html>