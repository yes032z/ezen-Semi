<%@page import="java.util.Scanner"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.myhw.person.model.personDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//[1] detail.jsp에서 삭제 a링크 클릭하여 get방식 이동
	//1. 요청파라미터 읽어오기
	String no=request.getParameter("no");

	if(no==null||no.isEmpty()){%>
		<script type="text/javascript">
		alert("잘못된 url 입니다.");
		location.href="list.jsp";
		</script>
	<% return;
	}

	//2. db작업123
	personDAO personDao=new personDAO();
	try{
		int cnt=personDao.deletePerson(Integer.parseInt(no));
	//3. 결과처리
		if(cnt>0){%>
			<script type="text/javascript">
			alert("회원정보 삭제 성공");
			location.href="list.jsp";
			</script>		
		<%}else{%>
			<script type="text/javascript">
			alert("회원정보 삭제 실패");
			history.go(-1);
			</script>
		<%}
	}catch(SQLException e){
		e.printStackTrace();
	}
	
%>
</body>
</html>