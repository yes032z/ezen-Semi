<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp" %>
<%@ include file="../../inc/mypagenav.jsp" %>
<style type="text/css">
.orderinfo {
    margin-bottom: 10px;
    padding-top: 30px;
    width: 1100px;
    float: left;
}
#mypage{
	text-align: center;
	overflow: hidden;
    padding: 20px 20px 20px 80px;
}
#orderinfo-second div{
	float: left;
}
div#orderinfo-first {
    border-bottom: 2px solid black;
    padding: 0 0 15px 15px;
    font-size: 20px;
    font-weight: bold;
    width: 1120px;
    text-align: left;
}
div#orderinfo-second {
	text-align: center;
    margin: 10px 10px 10px 30px;
 	width: 1120px;
}
div#orderinfo-second div {
    padding: 10px 45px 10px 85px;
    text-align: center;
}
div#orderinfo-second div a{
	font-size: 40px;
	font-weight: bold;
	text-decoration: none;
}

</style>
<article id="mypage">
	<div class="orderinfo">
		<div id="orderinfo-first">재고 알림</div>
		<div id="orderinfo-second">
			<div>
			
			</div>
		</div>
	</div>

</article>
<%@ include file="../../inc/bottom.jsp" %>