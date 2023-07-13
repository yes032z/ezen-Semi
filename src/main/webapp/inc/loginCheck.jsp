<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginCheck.jsp</title>
</head>
<body>
<%
	//로그인이 되지 않은 경우 에러 처리
	String l_id=(String)session.getAttribute("id");
	String ctxPath=request.getContextPath(); 
	
	//로그인 안된 경우
	if(l_id==null || l_id.isEmpty()){%>
		<script type="text/javascript">
			alert("먼저 로그인하세요.");
			location.href="<%=ctxPath %>/abmart/member/login.jsp";
		</script>	
	<%	return; //서비스메서드를 리턴
	}

%>
</body>
</html>