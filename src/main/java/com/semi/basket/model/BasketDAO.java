<%@page import="com.semi.basket.model.BasketDAO"%>
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
	//1. 파라미터 읽어오기
	String basketno = request.getParameter("basketno");
	
	//2. DB 작업 수행
	BasketDAO basketDAO = new BasketDAO();
	int deleteResult = basketDAO.deleteBasket(Integer.parseInt(basketno));
	
	//3. 결과 저장
	String resultMessage;
	if (deleteResult > 0) {
	 resultMessage = "장바구니 삭제가 완료되었습니다.";
	} else {
	 resultMessage = "장바구니 삭제에 실패하였습니다.";
	}
	
	//4. 웹페이지 리턴

%>
</body>
</html>

