<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../inc/top.jsp" %>
<section class="py-5">
	<div style="width: 500px;height: 700px;margin-left: 100px; float:left;">
		<img class="card-img-top" src="https://image.a-rt.com/art/product/2023/03/11678_1678179755820.jpg?shrink=388:388" alt="상품 이미지" />
	</div>
	<!-- 상품 정보 -->
	<div style="float:left;margin-left: 50px;">
		<div style="font-size: 2em;font-weight: bold;">상품명</div>
		<div style="font-size: 2em;font-weight: bold;">99000원</div>
	</div>				
	<!-- 상품정보, 상품후기, 상품Q&A 탭 -->
	<div>
		<div style="width: 1200px;margin-left: 150px;clear:both;">
			<ul class="nav nav-tabs">
				<li class="nav-item" style="width: 400px"><a class="nav-link "
					id="alink1" aria-current="page" href="#">상품정보</a></li>
				<li class="nav-item" style="width: 400px"><a class="nav-link "
					id="alink2" href="#">상품후기</a></li>
				<li class="nav-item" style="width: 400px"><a class="nav-link "
					id="alink2" href="#">상품Q&A</a></li>
			</ul>
		</div>
	</div>
</section>
<%@include file="../../inc/bottom.jsp" %>
