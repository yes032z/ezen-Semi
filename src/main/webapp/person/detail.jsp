<%@page import="com.myhw.person.model.personVO"%>
<%@page import="com.myhw.person.model.personDAO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
	//[1]list.jsp에서 name의 a링크 클릭하여 get방식으로 이동함
	//1. 요청파라미터 읽어오기
	String no=request.getParameter("no");
	if(no==null ||no.isEmpty()){%>
	<script type="text/javascript">
		alert("잘못된 url 입니다.");
		location.href="list.jsp";
	</script>	
  	<%	return;
  	}	
	
	//2. db작업
	personDAO personDao=new personDAO();
	personVO vo=null;
	try{
		vo=personDao.selectByNo(Integer.parseInt(no));
	}catch(SQLException e){
		e.printStackTrace();
	}
	//3. 결과처리
	
%>
<meta charset="UTF-8">
<title>회원 상세보기</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(function(){
		$('#pDel').click(function(){
			if(confirm("삭제하시겠습니까?")){
				location.href="delete_ok.jsp?no=<%=no %>";
			}
		});
	});
</script>
</head>
<body>

	<h2>회원 상세보기</h2>
	<div class="divfrm">
		<div>
			<span class="sp1">번호</span> <span><%=no%></span>
		</div>
		<div>
			<span class="sp1">이름</span> <span><%=vo.getName()%></span>
		</div>
		<div>
			<span class="sp1">전화번호</span> <span><%=vo.getTel()%></span>
		</div>
		<div>
			<span class="sp1">가입일</span> <span><%=vo.getRegdate()%></span>
		</div>
		<div>
		<a href="register.jsp?no=<%=no %>">수정</a> |
		<a href="#" id="pDel">삭제</a> |
		<a href="list.jsp">목록</a>
		</div>
	</div>
</body>
</html>