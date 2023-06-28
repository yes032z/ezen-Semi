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
	//[1]register.jsp 에서 수정버튼 클릭하여 post방식 서브밋(이동)됨
	//post방식 - 한글인코딩
	request.setCharacterEncoding("utf-8");
	//1. 요청파라미터 읽어오기
	String no=request.getParameter("no");
	if(no==null||no.isEmpty()){%>
		<script type="text/javascript">
		alert("잘못된 url입니다.");		
		location.href="list.jsp";
		</script>
	<% return;	
	}
	String name=request.getParameter("name");
	String tel=request.getParameter("tel");
	//2. db작업
	personDAO personDao=new personDAO();
	personVO vo=new personVO();
	
	vo.setNo(Integer.parseInt(no));
	vo.setName(name);
	vo.setTel(tel);
	
	try{
		int cnt=personDao.updatePerson(vo);	
	//3. 결과처리
		if(cnt>0){%>
			<script type="text/javascript">
			alert("회원정보 수정 완료");
			location.href="detail.jsp?no=<%=no%>";
			</script>
		<%}else{%>
			<script type="text/javascript">
			alert("회원정보 수정 실패..");
			history.go(-1);
			</script>
		<%}
	}catch(SQLException e){
		e.printStackTrace();
	}
%>
</body>
</html>