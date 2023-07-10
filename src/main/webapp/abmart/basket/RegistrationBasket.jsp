<%@page import="java.io.PrintWriter"%>
<%@page import="com.semi.basket.model.BasketDAO"%>
<%@page import="com.semi.basket.model.BasketVO"%>
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
	String basketqty = request.getParameter("basketqty");
	String pdno = request.getParameter("pdno");
	String no = request.getParameter("no");
	
	//2. DB 작업 수행
	BasketVO basketVO = new BasketVO();
	basketVO.setBasketqty(Integer.parseInt(basketqty));
	basketVO.setPdno(Integer.parseInt(pdno));
	basketVO.setNo(Integer.parseInt(no));
	
	BasketDAO basketDAO = new BasketDAO();
	int insertResult = basketDAO.insertBasket(basketVO);
	
	//3. 결과 저장
	String resultMessage;
	if (insertResult > 0) {
		resultMessage = "장바구니에 상품이 등록되었습니다.";
	} else {
		resultMessage = "장바구니 상품 등록에 실패하였습니다.";
	}
	
	//4. 웹페이지 리턴
%>

</body>
</html>