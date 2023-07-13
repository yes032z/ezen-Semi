<%@page import="java.sql.SQLException"%>
<%@page import="com.semi.favoritepd.model.FavoritePdService"%>
<%@page import="com.semi.favoritepd.model.FavoritePdDAO"%>
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
	String no=(String)session.getAttribute("no");
	String pdno=request.getParameter("pdno");
	
	FavoritePdService favoritePdService=new FavoritePdService();
	
	try{
		int cnt=favoritePdService.insertFavoritePd(Integer.parseInt(no), Integer.parseInt(pdno));
		
		if(cnt>0){%>
			<script type="text/javascript">
				alert("찜한 상품이 등록되었습니다.");
				location.href="pdDetail.jsp?pdno=<%=pdno%>";
			</script>
			<%
		}
	}catch(SQLException e){
		e.printStackTrace();
	}
%>
</body>
</html>