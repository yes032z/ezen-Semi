<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../inc/top.jsp" %>

<section class="py-5">
	<div style="width: 500px;height: 700px;margin-left: 100px; float:left;">
		<img class="card-img-top" src="https://image.a-rt.com/art/product/2023/03/11678_1678179755820.jpg?shrink=388:388" alt="상품 이미지" />
	</div>
	<!-- 상품 정보 -->
	<div style="float:left;margin-left: 100px;width:600px;height:700px;">
		<div style="font-size: 1.5em;font-weight: bold;float:left;width:600px;">
			<span style="float:left;">상품명</span><span>상품명</span>
		</div>
		<div style="font-size: 1.5em;font-weight: bold;clear:both;float:left;padding-bottom:30px;margin-top:50px;width:600px;">
			<span style="float:left;">가격</span><span>99000원</span>
		</div>
		<div style="font-size: 1.5em;font-weight: bold;clear:both;float:left;padding-bottom:30px;margin-top:50px;width:600px;">
			<span style="float:left;">사이즈</span>
			<button class="btn" name="size">230</button>
			<button class="btn" name="size">235</button>
			<button class="btn" name="size">240</button>
			<button class="btn" name="size">245</button>
			<button class="btn" name="size">250</button>
			<button class="btn" name="size">255</button>
			<button class="btn" name="size">260</button>
		</div>
		<div name="pddetail">
			 <div style="float: left;margin-left: 50px;font-size: 1.2em;">230</div>
			 	<div style="float: left;margin-left: 200px">
			        <button class="btn plus_btn" name="size">+</button>
		         	<input type="text" class="quantity-input" value="1" style="width: 45px;">
		         	<button class="btn minus_btn" name="size">-</button>
		         </div>
	         <div style="float: left;margin-left: 50px;font-size: 1.2em;">99000원</div>
	         <button class="btn" name="size">X</button>
         </div>
         <div name="pddetail">
			 <div style="float: left;margin-left: 50px;font-size: 1.2em;">230</div>
			 	<div style="float: left;margin-left: 200px">
			        <button class="btn plus_btn" name="size">+</button>
		         	<input type="text" class="quantity-input" value="1" style="width: 45px;">
		         	<button class="btn minus_btn" name="size">-</button>
		         </div>
	         <div style="float: left;margin-left: 50px;font-size: 1.2em;">99000원</div>
	         <button class="btn" name="size" name="size">X</button>
         </div>
         <div name="pddetail">
			 <div style="float: left;margin-left: 50px;font-size: 1.2em;">230</div>
			 	<div style="float: left;margin-left: 200px">
			        <button class="btn plus_btn" name="size">+</button>
		         	<input type="text" class="quantity-input" value="1" style="width: 45px;">
		         	<button class="btn minus_btn" name="size">-</button>
		         </div>
	         <div style="float: left;margin-left: 50px;font-size: 1.2em;">99000원</div>
	         <button class="btn" name="size" name="size">X</button>
         </div>
         <div name="pddetail">
			 <div style="float: left;margin-left: 50px;font-size: 1.2em;">230</div>
			 	<div style="float: left;margin-left: 200px">
			        <button class="btn plus_btn" name="size">+</button>
		         	<input type="text" class="quantity-input" value="1" style="width: 45px;">
		         	<button class="btn minus_btn" name="size">-</button>
		         </div>
	         <div style="float: left;margin-left: 50px;font-size: 1.2em;">99000원</div>
	         <button class="btn" name="size" name="size">X</button>
         </div>
         <div name="pddetail" style="border-bottom: 1px solid gray;">
			 <div style="float: left;margin-left: 50px;font-size: 1.2em;">230</div>
			 	<div style="float: left;margin-left: 200px">
			        <button class="btn plus_btn" name="size">+</button>
		         	<input type="text" class="quantity-input" value="1" style="width: 45px;">
		         	<button class="btn minus_btn" name="size">-</button>
		         </div>
	         <div style="float: left;margin-left: 50px;font-size: 1.2em;">99000원</div>
	         <button class="btn" name="size">X</button>
         </div>
         <div>
         	<span>총 결제 금액  </span>
         </div>
	</div>				
	
	<!-- 상품정보, 상품후기, 상품Q&A 탭 -->
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
</section>
<%@include file="../../inc/bottom.jsp" %>
