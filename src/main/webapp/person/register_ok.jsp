<%@page import="java.sql.SQLException"%>
<%@page import="com.myhw.person.model.personVO"%>
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
	//[1]register_ok.jsp에서 등록버튼 클릭하여 post방식 서브밋(이동)됨
	//post 방식 한글인코딩
	request.setCharacterEncoding("utf-8");
	
	//1. 요청파라미터 읽어오기
	String name=request.getParameter("name");
	String tel=request.getParameter("tel");
	
	//2. db연결
	personDAO personDao=new personDAO();
	personVO vo=new personVO();
	
	vo.setName(name);
	vo.setTel(tel);
	try{
		int cnt=personDao.insertPerson(vo);
		
	//3. 결과처리
		if(cnt>0){%>
			<script type="text/javascript">
			alert("회원등록 완료");
			location.href="list.jsp";
			</script>
		<%}else{%>
			<script type="text/javascript">
			alert("회원등록 실패..");
			history.go(-1);
			</script>
		<%}
	
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	
	

%>
</body>
</html>