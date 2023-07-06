<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp" %>
<%@ include file="../../inc/mypagenav.jsp" %>
<link href="../../css/mypage.css" rel="stylesheet" type="text/css">
<article id="mypage">
	<div class="orderinfo">
		<div id="orderinfo-first">상품 Q & A</div>
		<div class="subtitle">내가 작성한 상품 Q & A</div>
		<div id="orderinfo-third">
			<table class="table table-hover">
				<thead class="thead-dark">
					<tr>
						<th scope="col">번호</th>
						<th scope="col">내용</th>
						<th scope="col">상품명</th>
						<th scope="col">조회수</th>
						<th scope="col">등록일자</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row">1</th>
						<td><a href="#">Maark</a></td>
						<td>Otto</td>
						<td>@mdo</td>
						<td>@mdo</td>
					</tr>
					<tr>
						<th scope="row">2</th>
						<td><a href="#">Mark</a></td>
						<td>Thornton</td>
						<td>@fat</td>
						<td>@mdo</td>
					</tr>
					<tr>
						<th scope="row">3</th>
						<td><a href="#">Mark</a></td>
						<td>the Bird</td>
						<td>@twitter</td>
						<td>@mdo</td>
					</tr>
				</tbody>
			</table>
			</div>
		</div>

</article>
<%@ include file="../../inc/bottom.jsp" %>