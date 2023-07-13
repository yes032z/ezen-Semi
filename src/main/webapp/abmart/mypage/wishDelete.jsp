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
<jsp:useBean id="favoriteService" class="com.semi.favoritepd.model.FavoritePdService" scope="session"></jsp:useBean>
<%
	String[] favoriteno=request.getParameterValues("chkItem");

	try{
		int result=favoriteService.deleteFavoriteByNo(favoriteno);
		
		if(result>0){%>
		<script type="text/javascript">
			alert("삭제처리가 정상적으로 완료되었습니다.");
			location.href="wishList.jsp";
		</script>
		<%}else{%>
		<script type="text/javascript">
		alert("찜목록 삭제에 실패했습니다.");
		location.href="wishList.jsp";
		</script>
		<%}
	}catch(SQLException e){
		e.printStackTrace();
	}
%>
</body>
</html>