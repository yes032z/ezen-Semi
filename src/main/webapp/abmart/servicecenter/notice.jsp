<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp" %>
<style type="text/css">
	.notice {margin: 90px 0 0 490px; font-family: 'Nanum Gothic';}

	.noticeBody {
		width: 900px;
		border-bottom: 1px solid #80808073;
		border-top: 1px solid black;
	}
	
	.noticeBody tr {
		height: 70px;
		border-bottom: 1px solid #80808073;
	}
	
	h3 {margin-bottom: 20px; font-weight: 550;}
	
	a {text-decoration: none; color: black;}
	
	.noticeBody th {text-align: center;}
	
	td:nth-child(odd) {text-align: center;}
	
	/* 페이징 */
	.page {
		font-size: 19px;
		margin-left: 420px;;
	}
	

	/* mypagenav */
	#leftNav {width: 300px; float: left; margin-left: 70px;}
	
	h2 {font-weight: bold; margin: 55px 0px 26px 50px; padding-left: 20px;}
	
	dl#leftNavi {margin: 10px 10px 0px 50px; padding-left: 23px;}
	
	#leftNavi dt {padding: 15px 0px 10px 0px; font-size: 18px; font-weight: bold;}
	
	#leftNavi dt a {color: black;}
	
	#leftNavi dt a:hover{color: red;}
	
	dd:first-child {color: gray; font-size: 18px; font-weight: bold;}
	
	dd:nth-child(2) {font-size: 19px;}
	
	dd:nth-child(n+3) {font-size: 14px; margin-bottom: 0;}

	dd:nth-child(4) {margin-left: 41px}

	dd:nth-child(5) {color: #808080a6;}
</style>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">

</script>
<%
	/* 페이징 처리 */
	int currentPage = 1;	//현재 페이지
	
	if (request.getParameter("currentPage") != null) {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
%>
	<!-- mypagenav -->
	<nav id="leftNav">
		<h2>고객센터</h2>
		<dl id="leftNavi">
			<!-- category list -->
			<dt><a href="FAQ.jsp">FAQ</a></dt>
			<dt><a href="notice.jsp">공지사항</a></dt>
			<dt><a href="findStore.jsp">매장 찾기</a></dt>
		</dl>
		<hr style="width: 170px;">
		<dl id="leftNavi">
			<dd><img alt="csImg" src="<%=request.getContextPath() %>/images/csImg.png"> &nbsp;CS CENTER</dd>
			<dd>1588 - 9667 </dd>
			<dd>월~금 09:00~12:00</dd>
			<dd>13:00~18:00</dd>
			<dd>(주말,공휴일 휴무)</dd>
		</dl>
	</nav>
	
	<article>
		<div class="notice">
			<h3>공지사항</h3>
			<table class="noticeBody" summary="공지사항 목록">
				<colgroup>
					<col style="width: 75px;">
					<col>
					<col style="width: 121px;">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">제목</th>
						<th scope="col">작성일</th>
					</tr>
				</thead>
				<tbody id="noticeList">
					<tr>
						<td><img alt="noticeImg" src="<%=request.getContextPath() %>/images/noticeImg.jpg"></td>
						<td><a href="notice_detail.jsp" class="notice-link">개인정보처리방침 개정 안내</a>
						<td>2023.06.22</td>
					</tr>
					
					<tr>
						<td>9</td>
						<td><a href="#" class="notice-link">크록스 제품 발송 안내</a>
						<td>2023.06.12</td>
					</tr>
					
					<tr>
						<td>8</td>
						<td><a href="#" class="notice-link">닥터마틴 소비자가 변동 안내</a>
						<td>2023.05.22</td>
					</tr>
					
					<tr>
						<td>7</td>
						<td><a href="#" class="notice-link">반스 소비자가 변동 안내</a>
						<td>2023.05.19</td>
					</tr>
					
					<tr>
						<td>6</td>
						<td><a href="#" class="notice-link">아디다스 소비자가 변동 안내</a>
						<td>2023.05.18</td>
					</tr>
					
					<tr>
						<td>5</td>
						<td><a href="#" class="notice-link">개인정보 처리방침 및 위치정보서비스 이용약관 개정 안내</a>
						<td>2023.04.12</td>
					</tr>
					
					<tr>
						<td>4</td>
						<td><a href="#" class="notice-link">개인정보처리방침 개정 안내</a>
						<td>2023.02.23</td>
					</tr>
					
					<tr>
						<td>3</td>
						<td><a href="#" class="notice-link">스케쳐스 소비자가 변동 안내</a>
						<td>2023.02.09</td>
					</tr>
					
					<tr>
						<td>2</td>
						<td><a href="#" class="notice-link">에이비씨 셀렉트 소비자가 변동 안내</a>
						<td>2023.01.09</td>
					</tr>
					
					<tr>
						<td>1</td>
						<td><a href="#" class="notice-link">누오보 소비자가 변동 안내</a>
						<td>2022.12.21</td>
					</tr>
				</tbody>
			</table>
			<!-- 페이징 -->
			<div class="page">
				<a href="#">[1]</a>
				<a href="#">[2]</a>
			</div>
		</div>
	</article><br><br><br><br><br><br>


<%@ include file="../../inc/bottom.jsp" %>