<%@page import="com.semi.member.model.MemberService"%>
<%@page import="com.semi.member.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../inc/top.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OrderCompleted.jsp</title>
<style type ="text/css">
header {
	font-size: 20px;	
	float: center;	
	margin: 30px 1000px 0 0px;	
}

p {
	font-size: 30px;
	margin: 30px 0 0 50px;		
}

.message > h2 {
    font-size: 32px;
    font-weight: bold;
    text-align: center;
    color: #555;
    padding: 10px;
}
.message > h2 > i {
    font-size: 26px;
}
.message > p {
    font-size: 18px;
    font-weight: bold;
    padding: 10px;
    text-align: center;
}

.complete > article {
    margin-top: 16px;
}

.complete > article > h1 {
    font-weight: bold;
    font-size: 14px;
    color: #111;
    padding: 6px 0;
}
.complete table {
    width: 100%;
    border-collapse: collapse;
    border-spacing: 0;
    border-top: 2px solid #000;
}
.complete table tr {
    border-bottom: 1px solid #d3d3d3;
}
.complete table tr > th {
    padding: 12px 0;
    background: #fff;
    color: #383838;
    font-size: 0.95em;
    text-align: center;
    letter-spacing: -0.1em;
}

/* 상품정보 */
.info > table tr > th:last-child {
    width: 200px;
}
.info table tr > td {
    text-align: center;
}
.info table tr > td:last-child {
    color: #ff006c;
    font-weight: bold;
    text-align: right;
}
.info table tr > td > article {
    overflow: hidden;
    padding: 6px;
}
.info table tr > td img {
    float: left;
    width: 80px;
}
 .info table tr > td div {
    float: left;
    margin-left: 10px;
    text-align: left;
}
.info table tr > td div > p {
    text-align: left;
    color: #777;
    margin-top: 4px;
}
.info .total > td > table {
    border: none;
}
.info .total > td > table tr {
    border: none;
}
.info .total > td > table td {
    text-align: right;
    color: #111;
    background: #f2f2f2;
    font-weight: normal;
    border-bottom: none;
    padding: 10px;
    box-sizing: border-box;
}
.info .total > td > table tr:last-child span {
    font-weight: bold;
    color: #ff006c;
}
/* 주문정보 */
.order table tr > td {	
    padding: 10px;
    box-sizing: border-box;
}
.order > table tr > td:nth-child(1) {
    width: 160px;
    background: #f2f2f2;
}
.order table tr > td:nth-child(2) {
    width: auto;
}
.order table tr > td:nth-child(3) {
    width: 100px;
    text-align: right;
    vertical-align: top;
    background: #f2f2f2;
}
.order table tr > td:nth-child(4) {
    width: 100px;
    text-align: right;
    vertical-align: top;
    background: #f2f2f2;
}
.order table span {
    font-weight: bold;
    color: #ff006c;
}
/* 배송정보 */
.delivery table tr > td:nth-child(1) {
    width: 160px;
    background: #f2f2f2;
}
.delivery table tr > td {
    padding: 10px;
    box-sizing: border-box;
}
.delivery table tr > td:nth-child(3) {
    width: 200px;
    background: #f2f2f2;
}
        
.alert {
    width: 100%;
    background-color: #f7f7f7;
    padding: 10px;
    padding-left: 24px;
    color: #999;
    box-sizing: border-box;
}
.alert > h1 {
    margin-left: -12px;
}
.alert > ul {
    list-style: inherit;
}
.alert > ul > li {
    line-height: 20px;
}
.alert > ul > li > span {
    position: relative;
    left: -6px;
}

.alert ul :first-child {
  	color: red;
  	font-weight:bold;
}

li{
	text-align: left;
}

li.li{	
	color:black;
	font-weight:bold;
}

</style>
</head>
<%
	String id = (String)session.getAttribute("id");

	MemberService service = new MemberService();
	MemberVO vo = service.selectMember(id); 
		
%>
<body> 
        <main id="product">      
            <section class="complete">
                <nav><br>
				<!-- header  -->
				<header>01.장바구니 > 2.주문결제 > <strong>03.주문완료</strong></header>
				<hr>
                </nav>
                <article class="message">
                    <h2>
                    	주문완료<br><br>
                        고객님의 주문이 정상적으로 완료되었습니다.
                        <i class="far fa-smile" aria-hidden="true"></i>
                    </h2>
                </article>
                <!-- 상품정보 -->
                <article class="info">
                    <h1>상품정보</h1>
                    <table border="0">
                        <tr>
                            <th>상품명</th>
                            <th>상품금액</th>
                            <th>할인금액</th>
                            <th>수량</th>
                            <th>주문금액</th>
                        </tr>
                        <tr>
                            <td>
                                <article>
                                    <img src="https://via.placeholder.com/80X80" alt="">
                                    <div>
                                        <h2>
                                            <a href="#">상품명</a>
                                        </h2>
                                        <p>상품설명</p>
                                    </div>
                                </article>
                            </td>
                            <td>17,000원</td>
                            <td>1,000원</td>
                            <td>1</td>
                            <td>16,000원</td>
                        </tr>
                        <tr>
                            <td>
                                <article>
                                    <img src="https://via.placeholder.com/80X80" alt="">
                                    <div>
                                        <h2>
                                            <a href="#">상품명</a>
                                        </h2>
                                        <p>상품설명</p>
                                    </div>
                                </article>
                            </td>
                            <td>17,000원</td>
                            <td>1,000원</td>
                            <td>1</td>
                            <td>16,000원</td>
                        </tr>
                        <tr>
                            <td>
                                <article>
                                    <img src="https://via.placeholder.com/80X80" alt="">
                                    <div>
                                        <h2>
                                            <a href="#">상품명</a>
                                        </h2>
                                        <p>상품설명</p>
                                    </div>
                                </article>
                            </td>
                            <td>17,000원</td>
                            <td>1,000원</td>
                            <td>1</td>
                            <td>16,000원</td>
                        </tr>                                                                                             
                        <tr class="total">
                            <td colspan="4"></td>
                            <td>
                                <table>
                                    <tr>
                                        <td>총 상품금액:</td>
                                        <td>
                                            <span>34,000원</span>
                                        </td>
                                     </tr>
                                    <tr>
                                        <td>배송비:</td>
                                        <td>
                                            <span>무료</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>총 결제금액:</td>
                                        <td>
                                            <span>35,000</span>원
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </article>
                
                <!-- 주문정보 -->
                <article class="order">
                    <h1>주문정보</h1>
                    <table border="0">
                        <tr>
                            <td>주문번호</td>
                            <td>2008101324568</td>
                        </tr>
                        <tr>
                            <td>결제방법</td>
                            <td>신용카드</td>
                        </tr>
                    </table>
                </article>
                
                <!-- 배송정보 -->
                <article class="delivery">
                    <h1>배송정보</h1>
                    <table border="0">
                        <tr>
                            <td>주문인</td>
                            <td><%=vo.getName()%></td>                                                                                  
                        </tr>
                        <tr>
                            <td>연락처</td>
                            <td><%=vo.getTel()%></td>    
                        </tr>
                        <tr>
                            <td>배송지 주소</td>
                            <td><%=vo.getDetailaddress()%></td>    
                        </tr>

                    </table>
                </article>
                
                
                <!-- 하단 설명 -->
                <article class="alert">
                    <ul>
                <li>취소/반품/교환 신청전 확인해주세요!</li><br>
				<li class="li">반품</li>
				<li>- 상품 수령 후 7일 이내 신청하여 주세요.</li>
				<li>- 설치상품/주문제작/해외배송/신선냉동 상품 등은 고객센터에서만 반품 신청이 가능합니다. </li><br>
				<li class="li">교환</li>
				<li>- 상품의 교환 신청은 고객센터로 문의하여 주세요.</li><br>
				<li class="li">취소</li>
				<li>- 여행/레저/숙박 상품은 취소 시 수수료가 발생할 수 있으며,</li>
				<li>취소수수료를 확인하여 2일 이내(주말,공휴일 제외) 처리결과를 문자로 안내해드립니다.(당일 접수 기준, 마감시간 오후 4시)</li>
				<li>- 문화 상품은 사용 전날 24시까지 취소 신청 시 취소수수료가 발생되지 않습니다.</li>
                    </ul>
                </article>
            </section>
        </main>
</body>
<%@include file="../../inc/bottom.jsp" %>  
