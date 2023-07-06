<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
section {
	display: hidden;
}
#leftNav {
    width: 300px;
    float: left;
    margin-left: 70px;
}
h2{
    font-weight: bold;
  	margin: 55px 0px 26px 50px;
    padding: 0 0 0 20px;
}
dl#leftNavi {
    margin: 10px 10px 45px 50px;
    padding: 0 0 0 23px;
}

#leftNavi dt {
	padding: 15px 0px 10px 0px;
	font-size: 18px;
	font-weight: bold;
}
#leftNavi dd a {
	text-decoration: none;
	color: #585721;
}
#leftNavi dd a:hover{
	color: red;
}
footer{
clear: both;
}
</style>
<nav id="leftNav">
	<h2>마이페이지</h2>
	<dl id="leftNavi">
		<!-- category list -->
		<dt>쇼핑 정보</dt>
		<dd><a href="<%=request.getContextPath() %>/abmart/mypage/orderDetail.jsp">주문 조회</a></dd>
		<dd><a href="<%=request.getContextPath() %>/abmart/mypage/refundDetail.jsp">취소/환불</a></dd>
		<dd><a href="<%=request.getContextPath() %>/abmart/mypage/informStock.jsp">재고 알림</a></dd>
		<dt>활동 정보</dt>
		<dd><a href="<%=request.getContextPath() %>/abmart/mypage/wishList.jsp">찜한 상품</a></dd>
		<dd><a href="<%=request.getContextPath() %>/abmart/mypage/pdQnA.jsp">상품 Q & A</a></dd>
		<dd><a href="<%=request.getContextPath() %>/abmart/mypage/pdReview.jsp">상품 리뷰</a></dd>
		<dt>나의 정보</dt>
		<dd><a href="#">회원정보 수정</a><dd>
		<dd><a href="#">비밀번호 변경</a><dd>
	</dl>
</nav>    


