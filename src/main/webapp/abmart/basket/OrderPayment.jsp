<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../inc/top.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OrderPayment.jsp</title>
<style type="text/css">
header{
	font-size: 30px;
	margin: 30px 0 0 50px;	
}

#product>.order>form>table {
	width: 100%;
	border-top: 2px solid #000;
	border-collapse: collapse;
	border-spacing: 0;
}

#product>.order>form>table tr {
	border-bottom: 1px solid #d3d3d3;
}

#product>.order>form>table th {
	padding: 12px 0;
	background: #fff;
	color: #383838;
	font-size: 0.95em;
	text-align: center;
	letter-spacing: -0.1em;
}

#product>.order>form>table .empty {
	display: none;
}

#product>.order>form>table td {
	text-align: center;
}

#product>.order>form>table td:last-child {
	color: #ff006c;
	font-weight: bold;
}

#product>.order>form>table tr>td>input {
	
}

#product>.order>form>table td>article {
	padding: 6px;
	overflow: hidden;
}

#product>.order>form>table td>article>a {
	float: left;
	display: inline-block;
}

#product>.order>form>table td>article>a>img {
	width: 80px;
}

#product>.order>form>table td>article>div {
	float: left;
	margin-left: 10px;
}

#product>.order>form>table td>article>div>h2 {
	text-align: left;
}

#product>.order>form>table td>article>div>p {
	text-align: left;
	color: #777;
	margin-top: 4px;
}

#product>.order>form>article {
	width: 560px;
	height: auto;
	margin-top: 16px;
}

#product>.order>form>.delivery {
	
}

#product>.order>form>.final {
	float: right;
	width: 360px;
	height: 412px;
	padding: 20px;
	margin-top: 12px;
	background: #fff;
	border: 1px solid #d3d3d3;
	box-sizing: border-box;
}

#product>.order>form>.final>h2 {
	width: 100%;
	font-weight: bold;
	font-size: 16px;
	border-bottom: 1px solid #111;
	margin-bottom: 10px;
	padding-bottom: 10px;
	box-sizing: border-box;
	color: #1e1e1e;
}

#product>.order>form>.final>table {
	width: 100%;
}

#product>.order>form>.final>table tr:nth-last-child(1) td {
	font-size: 20px;
}

#product>.order>form>.final>table tr:nth-last-child(1) td:last-child {
	color: #ff006c;
	font-size: 20px;
	font-weight: bold;
}

#product>.order>form>.final>table td {
	padding: 10px 0;
	font-size: 14px;
	color: #555;
}

#product>.order>form>.final>table td:last-child {
	text-align: right;
}

#product>.order>form>.final>input[type=submit] {
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

#product>.order>form>article>h1 {
	font-weight: bold;
	font-size: 14px;
	padding: 6px 0;
	margin-bottom: 12px;
	border-bottom: 1px solid #111;
}

#product>.order>form>article>div {
	padding: 6px;
	box-sizing: border-box;
}

#product>.order>form>.delivery>table {
	margin-top: 10px;
}

#product>.order>form>.delivery>table tr>td:nth-child(1) {
	padding: 6px;
}

#product>.order>form>.delivery>table input[type=button] {
	padding: 4px 6px;
	border: 1px solid #ccc;
	background-color: #f0f4f9;
	border-color: #acc0e0;
	color: #3371c9;
	outline: none;
}

#product>.order>form input {
	color: #555;
	padding: 2px 0;
	border: 1px solid #999;
	box-sizing: border-box;
}

#product>.order>form>.delivery>table input[name=addr1] {
	width: 400px;
}

#product>.order>form>.delivery>table input[name=addr2] {
	width: 400px;
}

#product>.order>form>.discount>div {
	overflow: hidden;
}

#product>.order>form>.discount>div>p {
	float: left;
}

#product>.order>form>.discount>div>label {
	float: right;
}

#product>.order>form>.discount>div>label>input[type=text] {
	display: inline-block;
	outline: none;
}

#product>.order>form>.discount>div>span {
	display: block;
	margin-top: 20px;
	color: #888;
}

#product>.order>form>.discount>div>label>input[type=button] {
	padding: 4px 6px;
	border: 1px solid #ccc;
	background-color: #f0f4f9;
	border-color: #acc0e0;
	color: #3371c9;
	outline: none;
}

#product>.order>form>.payment>div {
	margin-bottom: 10px;
}

#product>.order>form>.payment>div>span {
	display: inline-block;
	color: #3a85c8;
	margin: 6px 0;
}

#product>.order>form>.payment>div label {
	margin-right: 16px;
}

#product>.order>form>.payment>div input {
	vertical-align: bottom;
	margin-right: 4px;
}

#product>.order>form>.alert {
	width: 560px;
	background-color: #f7f7f7;
	padding: 6px;
	padding-left: 20px;
	color: #999;
	box-sizing: border-box;
}

#product>.order>form>.alert>ul {
	list-style: inherit;
}

#product>.order>form>.alert>ul>li {
	line-height: 20px;
}

#product>.order>form>.alert>ul>li>span {
	position: relative;
	left: -6px;
}
</style>
</head>
<body>
	<div id="Payment">
	<!-- header  -->
	<header>HOME > 장바구니> <strong>주문결제</strong> > 주문완료</header>
	<hr>
		<main id="product">
			<aside>
			</aside>
			<section class="order">
				<nav>>
				</nav>
				<form action="#">
					<table border="0">
						<tr>
							<th>상품명</th>
							<th>총수량</th>
							<th>판매가</th>
							<th>배송비</th>
							<th>소계</th>
						</tr>
						<tr class="empty">
							<td colspan="7">장바구니에 상품이 없습니다.</td>
						</tr>
						<tr>
							<td><article>
									<a href="#"> <img src="https://image.a-rt.com/art/product/2023/06/18154_1686895862787.jpg?shrink=224:224"
										alt="1">
									</a>
									<div>
										<h2>
											<a href="#">상품명</a>
										</h2>
									</div>
								</article></td>
							<td>1</td>
							<td>28,000</td>
							<td>무료배송</td>
							<td>28,000</td>
						</tr>
						<tr>
							<td><article>
									<a href="#"> <img src="https://image.a-rt.com/art/product/2023/06/91937_1688017522910.jpg?shrink=590:590"
										alt="1">
									</a>
									<div>
										<h2>
											<a href="#">상품명</a>
										</h2>
									</div>
								</article></td>
							<td>1</td>
							<td>28,000</td>
							<td>무료배송</td>
							<td>28,000</td>
						</tr>
						<tr>
							<td><article>
									<a href="#"> <img src="https://image.a-rt.com/art/product/2023/06/14712_1687503790541.jpg?shrink=224:224"
										alt="1">
									</a>
									<div>
										<h2>
											<a href="#">상품명</a>
										</h2>
									</div>
								</article></td>
							<td>1</td>
							<td>28,000</td>
							<td>무료배송</td>
							<td>28,000</td>
						</tr>
					</table>
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
								<td><input type="text" name="email"></td>
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
				</form>
			</section>
		</main>
</body>
</html>