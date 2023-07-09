<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../inc/top.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OrderPayment.jsp</title>
<style type="text/css">
header {
	font-size: 20px;	
	float: center;	
	margin: 30px 0 0 50px;	
} 

body {
  margin: 0;
}

* {
  box-sizing: border-box;
}

p,
span {
  margin: 0;
}

a {
  color: black;
}

img {
  display: block;
  width: 80%;
  height: 80px;
  margin: auto;
}

.basket {
  width: 80%;
  margin: auto;
  padding: 30px;
}

.basket ul {
  background-color: whitesmoke;
  padding: 30px;
  margin-bottom: 50px;
  border: whitesmoke solid 1px;
  border-radius: 5px;
  font-size: 13px;
  font-weight: 300;
}

table {
  border-top: solid 1.5px black;
  border-collapse: collapse;
  width: 100%;
  font-size: 14px;
}

thead {
  text-align: center;
  font-weight: bold;
}

tbody {
  font-size: 12px;
}

td {
  padding: 15px 0px;
  border-bottom: 1px solid lightgrey;
}

.basket_list_detail :nth-child(3) {
  vertical-align: top;
}

.basket_list_detail :nth-child(3) a {
  font-size: 12px;
}

.basket_list_detail :nth-child(3) p {
  margin-top: 6px;
  font-weight: bold;
}

.basket_list_smartstore {
  font-size: 12px;
  color: gray;
}

.basket_list_option {
  vertical-align: top;
  padding: 20px;
}

.basket_list_option > span {
	float: center;
	font-size : 20px;
}

.basket_list_option p {
  margin-bottom: 25px;
  position: relative;
}

.basket_list_option p::after {
  content: "";
  width: 90%;
  height: 1px;
  background-color: lightgrey;
  left: 0px;
  top: 25px;
  position: absolute;
}

.basket_list_optionbtn {
  background-color: white;
  font-size: 15px;
  border: lightgrey solid 1px;
  padding: 15px;    
  margin-right: 3000px;
  margin-bottom: 20px;
}

.basket_list_detail :nth-child(4),
.basket_list_detail :nth-child(5),
.basket_list_detail :nth-child(6) {
  border-left: 2px solid whitesmoke;
}

.basket_list_detail :nth-child(5),
.basket_list_detail :nth-child(6) {
  text-align: center;
}

.basket_list_detail :nth-child(5) button {
  background-color: limegreen;
  color: white;
  border: none;
  border-radius: 5px;
  padding: 4px 8px;
  font-size: 12px;
  margin-top: 5px;
}

.price {
  font-weight: bold;
}

.basket_mainbtns {
  width: 420px;
  height: 200px;
  padding-top: 40px;
  display: block;
  margin: auto;
}

form>table {
	width: 100%;
	border-top: 2px solid #000;
	border-collapse: collapse;
	border-spacing: 0;
}

form>table tr {
	border-bottom: 1px solid #d3d3d3;
}

form>table th {
	padding: 12px 0;
	background: #fff;
	color: #383838;
	font-size: 0.95em;
	text-align: center;
	letter-spacing: -0.1em;
}

form>table .empty {
	display: none;
}

form>table td {
	text-align: center;
}

form>table td:last-child {
	color: #ff006c;
	font-weight: bold;
}

form>table tr>td>input {
	
}
form>table td>article {
	padding: 6px;
	overflow: hidden;
}

form>table td>article>a {
	float: left;
	display: inline-block;
}

form>table td>article>a>img {
	width: 80px;
}

form>table td>article>div {
	float: left;
	margin-left: 10px;
}

form>table td>article>div>h2 {
	text-align: left;
}

form>table td>article>div>p {
	text-align: left;
	color: #777;
	margin-top: 4px;
}

form>article {
	width: 560px;
	height: auto;
	margin-top: 16px;
}

.final {
	float: right;
	width: 360px;
	height: 412px;
	padding: 20px;
	margin-top: 12px;
	background: #fff;
	border: 1px solid #d3d3d3;
	box-sizing: border-box;
}

.final>h2 {
	width: 100%;
	font-weight: bold;
	font-size: 16px;
	margin-bottom: 10px;
	padding-bottom: 10px;
	box-sizing: border-box;
	color: #1e1e1e;
}

.final>table {
	width: 100%;
}

.final>table tr:nth-last-child(1) td {
	font-size: 20px;
}

.final>table tr:nth-last-child(1) td:last-child {
	color: #ff006c;
	font-size: 20px;
	font-weight: bold;
}

.final>table td {
	padding: 10px 0;
	font-size: 14px;
	color: #555;
}

form>.final>table td:last-child {
	text-align: right;
}

form>.final>input[type=submit] {
	width: 100%;
	height: 56px;
	font-size: 26px;
	border-width: 1px;
	border-color: #d81818;
	border-bottom-color: #9e1212;
	background: #ed2f2f;
	background-image: -webkit-linear-gradient(#ed2f2f, #dd0e0e);
	color: #fff;
	box-sizing: border-box;
	margin-top: 10px;
}

form>article>h1 {
	font-weight: bold;
	font-size: 14px;
	padding: 6px 0;
	margin-bottom: 12px;
}

form>article>div {
	padding: 6px;
	box-sizing: border-box;
}

form>.delivery>table {
	margin-top: 10px;
}

form>.delivery>table tr>td:nth-child(1) {
	padding: 6px;
}

form>.delivery>table input[type=button] {
	padding: 4px 6px;
	border: 1px solid #ccc;
	background-color: #f0f4f9;
	border-color: #acc0e0;
	color: #3371c9;
	outline: none;
}

form input {
	color: #555;
	padding: 2px 0;
	border: 1px solid #999;
	box-sizing: border-box;
}

form>.delivery>table input[name=addr1] {
	width: 400px;
}

form>.delivery>table input[name=addr2] {
	width: 400px;
}

form>.discount>div {
	overflow: hidden;
}

form>.discount>div>p {
	float: left;
}

form>.discount>div>label {
	float: right;
}

form>.discount>div>label>input[type=text] {
	display: inline-block;
	outline: none;
}

form>.discount>div>span {
	display: block;
	margin-top: 20px;
	color: #888;
}

form>.discount>div>label>input[type=button] {
	padding: 4px 6px;
	border: 1px solid #ccc;
	background-color: #f0f4f9;
	border-color: #acc0e0;
	color: #3371c9;
	outline: none;
}

form>.payment>div {
	margin-bottom: 10px;
}

form>.payment>div>span {
	display: inline-block;
	color: #3a85c8;
	margin: 6px 0;
}

form>.payment>div label {
	margin-right: 16px;
}

form>.payment>div input {
	vertical-align: bottom;
	margin-right: 4px;
}

form>.alert {
	width: 560px;
	background-color: #f7f7f7;
	padding: 6px;
	padding-left: 20px;
	color: #999;
	box-sizing: border-box;
}

form>.alert>ul {
	list-style: inherit;
}

form>.alert>ul>li {
	line-height: 20px;
}

form>.alert>ul>li>span {
	position: relative;
	left: -6px;
}
.alert{
	width: 300px;
}

.alert ul :first-child {
  	color: red;
  	font-weight:bold;  	
}

li{
	text-align: left;
}

</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
  	$(".final input[type='submit']").click(function(event) {
	    event.preventDefault(); 
	    location.href = "OrderCompleted.jsp"; 
	 });  	  	 
});
</script>
</head>
<body>
	<div id="Payment">
	<!-- header  -->
	<header> 01.장바구니 > <strong>02.주문결제 ></strong>03.주문완료</header>
	<hr>
	</div>
	<div id="Paymentbody">
		<section class="pt_table">
				<nav>
				</nav>
				<form action="#">
        <table class="basket_list">
            <form>            	             	
                <thead>
                    <tr>
                        <td></td>
                        <td colspan="2">상품정보</td>
                        <td>상품 주문 수량</td>
                        <td>총 상품금액</td>
                        <td>배송비</td>                                               
                    </tr>
                </thead>
                <tbody>
                    <tr class="basket_list_detail">
                        <td><input type="checkbox"></td>
                        <td><img src="https://image.a-rt.com/art/product/2023/05/73554_1683853295803.jpg?shrink=590:590" alt="1"></td>
                        <td><a href="#">아디다스</a><span class="basket_list_smartstore"></span>
                            <p>아디코드</p>                       
                        </td>
                       	<td class="basket_list_option">                  
                        </td>
                        <td><span class="sumprice">63,000원</span><br>                            
                        </td>
                        <td>무료</td>
                    </tr>
                    <tr class="basket_list_detail">
                        <td style="width: 2%;"><input type="checkbox"></td>
                        <td style="width: 13%;">
                            <img src="https://image.a-rt.com/art/product/2020/10/29855_1603086614649.jpg?shrink=590:590" alt="1">
                        </td>
                        <td style="width: 27%;"><a href="#">나이키</a><span class="basket_list_smartstore"></span>
                            <p>스탠 스미스</p>
                        </td>
                        <td class="basket_list_option" style="width: 27%;">
                        	<div class="quantity-adjustment">
	                           	<button class="plus_btn">+</button>
		                        <input type="text" class="quantity-input" value="1" style=width:30px>
		                        <button class="minus_btn">-</button>    
		                    </div>                       
                        </td>
                        <td style="width: 15%;"><span class="sumprice">29,000원</span><br>                            
                        </td>
                        <td style="width: 15%;">무료</td>
                    </tr>
                </tbody>                
            </form>
        </table>
        
        <!-- 최종 결제 정보 -->
		<div class="final">
			<h2>최종결제 정보</h2>
			<table>
				<tr>
					<td>총</td>
					<td>3 건</td>
				</tr>
				<tr>
					<td>상품금액</td>
					<td>84,000원</td>
				</tr>
				<tr>
					<td>할인금액</td>
					<td>-4,200원</td>
				</tr>
				<tr>
					<td>배송비</td>
					<td>0원</td>
				</tr>
				<tr>
					<td>전체주문금액</td>
					<td>79,800원</td>
				</tr>
			</table>
			<input type="submit" value="결제하기">
		</div>
		<!-- 주문 고객정보 -->
		
		<!-- 배송정보 -->
			<article class="delivery">
				<h1>배송정보</h1>
				<table>
					<tr>
						<td>이름</td>
						<td><input type="text" name="orderer"></td>
					</tr>
					<tr>
						<td>휴대폰</td>
						<td><input type="text" name="hp"></td>
					</tr>
					<tr>
						<td>이메일</td>
						<td><input type="text" name="email">
						    <select name="email2" id="email2"  title="이메일주소 뒷자리">
				            <option value="naver.com">naver.com</option>
				            <option value="hanmail.net">hanmail.net</option>
				            <option value="nate.com">nate.com</option>
				            <option value="gmail.com">gmail.com</option>
				            <option value="etc">직접입력</option>
				            </select>
				            <input type="text" name="email3" id="email3" title="직접입력인 경우 이메일주소 뒷자리" style="visibility:hidden;">      				
						</td>
					</tr>
					<tr>
						<td>우편번호</td>
						<td><input type="text" name="zip"> <input
							type="button" value="검색"></td>
					</tr>
					<tr>
						<td>기본주소</td>
						<td><input type="text" name="addr1"></td>
					</tr>
					<tr>
						<td>상세주소</td>
						<td><input type="text" name="addr2"></td>
					</tr>
				</table>
			</article>		
			
		<!-- 결제 수단선택 -->
					<article class="Payment method">
				<h1>결제정보</h1>
				<table>
					<tr>
						<td>카드사</td>
						<td><input type="text" name="orderer"></td>
					</tr>
					<tr>
						<td>카드번호</td>
						<td><input type="text" name="hp"></td>
					</tr>
				</table>
			</article>		
		
		
		<!-- 하단 설명 -->
           <article class="alert">
                <ul>
			        <li>품절 취소 안내!</li>
					<li>상품 품절로 인해 주문 후 취소될 수 있습니다. 품절 취소 시 결제하신 수단으로 자동 환불되며,</li>
					<li>품절 보상 쿠폰을 발급해드립니다. (일부 상품은 쿠폰 발급이 제외될 수 있습니다.) </li>
					<li>※ 결제하신 수단으로 환불이 불가능할 경우 별도 안내드립니다.</li>
                </ul>
           </article>					
		</form>
	</section>
</div>
</body>
</html>
<%@include file="../../inc/bottom.jsp" %>
