<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp" %>
<%@ include file="../../inc/mypagenav.jsp" %>
<style type="text/css">
.orderinfo {
    margin-bottom: 30px;
    overflow: hidden;
    padding-top: 30px;
}
#orderinfo-second div{
	float: left;
}
div#orderinfo-first {
    border-bottom: 2px solid black;
    padding: 0 0 15px 15px;
    font-size: 20px;
    font-weight: bold;
    width: 1135px;
    text-align: left;
}
div#orderinfo-second {
	text-align: center;
    margin: 10px 10px 10px 10px;
 	width: 1000px;
}
div#orderinfo-second div {
    padding: 10px 70px 10px 10px;
    text-align: center;
}
div#orderinfo-second div a{
	font-size: 40px;
	font-weight: bold;
	text-decoration: none;
}


</style>
<article>
	<div class="orderinfo">
	 	<div id="orderinfo-first">최근 주문내역</div>
	 	<div id="orderinfo-second">
			<div><a href="#">0</a><br>입금대기</div>
			<div><a href="#">0</a><br>결제완료</div>
			<div><a href="#">0</a><br>상품준비중</div>
			<div><a href="#">0</a><br>배송중/픽업준비완료</div>
			<div><a href="#">0</a><br>배송/수령완료</div>
		</div>
	</div>
	<div class="orderinfo">
		<div id="orderinfo-first">최근 본 상품</div>
		<div></div>
	</div>	
	<div class="orderinfo">
		<div id="orderinfo-first">찜한 상품</div>
		<div></div>
	</div>
</article>   
<%@ include file="../../inc/bottom.jsp" %>