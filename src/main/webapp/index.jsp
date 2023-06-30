<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- bootstrap css -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.css">
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
</script>
</head>
<body>
<header>
	<input type="text" name="" id="search"><input type="button" value="검색">
	<ul>
		<li>로그인</li>
		<li>마이페이지</li>
		<li>장바구니</li>
	</ul>
	<br>
	<ul>
		<li>브랜드</li>
		<li>종류</li>
	</ul>
</header>

<footer>
	<img>
	<div>
		<span>고객센터</span> <span>1521-1521</span><span>월~금 09:00 ~ 12:00 / 13:00 ~ 18:00(주말,공휴일 휴무)</span>
	</div>
	<div>
		<span>(주)에이비마트 | 대표이사 : 송영은 | 주소: 서울 서초구 서초대로77길 55 에이프로스퀘어 3층</span><br>
		<span>사업자등록번호 : 123-45-67890 | 통신판매업신고:제 2023-서울서초구-1000호</span><br>
		<span>개인정보보호 책임자:최곽두 | 이메일:abmart@abmart.com</span> 
	</div>
</footer>
</body>
</html>