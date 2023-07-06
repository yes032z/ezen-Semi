<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../inc/top.jsp" %>
<script type="text/javascript">
	$(function() {
		$('.alink1').eq(0).css('border','1px solid black');
		$('.alink1').click(function() {
			$('.alink1').css('border','');
			$(this).css('border','1px solid black');
			$('.alink2').css('border','');
			$('.alink3').css('border','');
			$('.alink1').eq(0).focus();
		});
		$('.alink2').click(function() {
			$('.alink2').css('border','');
			$(this).css('border','1px solid black');
			$('.alink1').css('border','');
			$('.alink3').css('border','');
			$('.alink2').eq(1).focus();
		});
		$('.alink3').click(function() {
			$('.alink3').css('border','');
			$(this).css('border','1px solid black');
			$('.alink1').css('border','');
			$('.alink2').css('border','');
			$('.alink3').eq(2).focus();
		});
	});
</script>
<style>
	button[name=btn]{
		width:290px;
		height:50px;
		color: white;
		background: black;
		font-weight: bold;
		border-radius: 0.25rem;
	}
	
	.div2{
		width:1200px;
		margin-left: 150px;
	}
	
	.bottomborder{
		border-bottom: 2px solid black;
	}
	
	.clearboth{
		clear: both;
	}
	
	.reviewdiv{
		height: 40px;
	}
	
	.margintop30{
		margin-top: 30px;
	}
	
	span.gray{
		color: rgb(150,150,150);
	}
	
</style>
<script>

</script>
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
         <div style="width:600px;height:100px;float:left;">
         	<span style="float:left;margin-top: 15px;margin-left: 20px">총 결제 금액</span><span style="float:right;margin-top: 15px">원</span><span name="searchqty" style="font-size: 2em;float:right;">0</span>
         </div>
         <div>
         	<button name="btn">장바구니</button>
         	<button name="btn">바로구매</button>
         </div>
	</div>
	
	<!-- 상품정보 -->
	<div style="width: 1200px;margin-left: 150px;clear:both;">
		<ul class="nav nav-tabs">
			<li class="nav-item"><button class="nav-link alink1"
				 style="width: 400px">상품정보</a></li>
			<li class="nav-item"><button class="nav-link alink2"
				 style="width: 400px">상품후기</a></li>
			<li class="nav-item"><button class="nav-link alink3"
				 style="width: 400px">상품Q&A</a></li>
		</ul>
	</div>
	
	
	
	<!-- 상품후기 -->
	<div style="width: 1200px;margin-left: 150px;clear:both;">
		<ul class="nav nav-tabs">
			<li class="nav-item"><button class="nav-link alink1"
				 style="width: 400px">상품정보</a></li>
			<li class="nav-item"><button class="nav-link alink2"
				 style="width: 400px">상품후기</a></li>
			<li class="nav-item"><button class="nav-link alink3"
				 style="width: 400px">상품Q&A</a></li>
		</ul>
	</div>
	<div>
		<div class="div2">
			<img src="../../images/review.png"/>
		</div>
		<div class="div2 reviewdiv clearboth bottomborder">
			<span style="float:left;">총 <span name="searchqty">990</span>개의 리뷰가 있습니다.</span>
			<span class="rightSort span2">&nbsp;|&nbsp;<a href="#">최근 등록순</a></span>
			<span class="rightSort">&nbsp;|&nbsp;<a href="#">평점 낮은순</a>&nbsp;</span>
			<span class="rightSort">&nbsp;<a href="#">평점 높은순</a>&nbsp;</span>
		</div>
		<div class="div2 reviewdiv clearboth" style="margin-top: 10px">
			<span class="leftSort" style="margin-right: 30px">★★★★★</span>
			<span class="leftSort gray" style="margin-right: 30px">black</span>
			<span class="leftSort gray"> | </span>
			<span class="leftSort gray" style="margin-left: 30px">사이즈</span>
		</div>
		<div class="div2 reviewdiv clearboth">
			<span class="leftSort">제목</span>
		</div>
		<div class="div2 reviewdiv clearboth">
<pre class="leftSort">내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용
내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용
내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용</pre>
		</div><br><br>
		<div class="div2">
			<span class="leftSort span2">아이디</span><span class="leftSort span2">&nbsp;|&nbsp;</span><span class="leftSort">등록 날짜</span>
		</div>
	</div>
	<!-- 상품Q&A 탭 -->
	<div style="width: 1200px;margin-left: 150px;clear:both;">
		<ul class="nav nav-tabs">
			<li class="nav-item"><button class="nav-link alink1"
				 style="width: 400px">상품정보</a></li>
			<li class="nav-item"><button class="nav-link alink2"
				 style="width: 400px">상품후기</a></li>
			<li class="nav-item"><button class="nav-link alink3"
				 style="width: 400px">상품Q&A</a></li>
		</ul>
	</div>
</section>
<%@include file="../../inc/bottom.jsp" %>
