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
		$('#basket').click(function(){
			location.href="../basket/ShoppingBasket.jsp";
		});
		$('#order').click(function(){
			location.href="../basket/OrderPayment.jsp";
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
	
	.clearboth{
		clear:both;
	}
	
	.border-bottom{
		border-bottom: 3px solid black;
	}
	
	.reviewdiv{
		height: 50px;
	}
	
	.margin-right20{
		margin-right: 20px;
	}
	
	.margin-left20{
		margin-left: 20px;
	}
	span.gray{
		color: rgb(150,150,150);
	}
	#star{
		color: red;
	}
	.small{
		font-size: 12px;
	}
	.qnafirst{
		border-top: 3px solid black;
		border-bottom: 1px solid gray;
		height: 70px;
		margin-top: 50px;
	}
	.margin-top20{
		margin-top: 20px;
	}
	
	.bold{
		font-weight: bold;
	}
	
	.margin-left650{
		margin-left: 650px;
	}
	
	.margin-left100{
		margin-left: 100px;
	}
	
	.qnadiv{
		border-bottom: 1px solid gray;
		height:70px;
	}
	
	.pdtab{
		width: 1200px;
		margin-left: 150px;
		clear:both;
		margin-top:200px;
	}
</style>
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
         	<button name="btn" id="basket">장바구니</button>
         	<button name="btn" id="order">바로구매</button>
         </div>
	</div>
	
	<!-- 상품정보 -->
	<div class="pdtab">
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
	<div class="pdtab">
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
			<div class="div2 clearboth border-bottom reviewdiv">
				<span style="float:left;">총 <span name="searchqty">990</span>개의 리뷰가 있습니다.</span>
				<span class="rightSort" id="span2">&nbsp;|&nbsp;<a href="#">최근 등록순</a></span>
				<span class="rightSort" id="span1">&nbsp;|&nbsp;<a href="#">평점 낮은순</a>&nbsp;</span>
				<span class="rightSort" id="span1">&nbsp;<a href="#">평점 높은순</a>&nbsp;</span>
			</div>
			<div class="div2 clearboth">
				<span id="star" class="leftSort" style="margin-right: 30px">★★★★★</span>
				<span class="leftSort gray" style="margin-right: 30px">black</span>
				<span class="leftSort gray"> | </span>
				<span class="leftSort gray" style="margin-left: 30px">사이즈</span>
			</div>
			<div class="div2 clearboth">
				<span class="leftSort">제목</span>
				<br><br>
			</div>
			<div class="div2 clearboth">
				<span class="leftSort gray margin-right20">i*****d</span>
				<span class="leftSort gray margin-right20"> | </span>
				<span class="leftSort gray">2023-07-07</span>
			</div>
			
			<div class="div2 clearboth border-bottom reviewdiv">
				<button class="btn leftSort" name="size" >좋아요</button>
			</div>
	</div>
		<div>
			<div class="div2 clearboth">
				<span id="star" class="leftSort" style="margin-right: 30px">★★★★★</span>
				<span class="leftSort gray" style="margin-right: 30px">black</span>
				<span class="leftSort gray"> | </span>
				<span class="leftSort gray" style="margin-left: 30px">사이즈</span>
			</div>
			<div class="div2 clearboth">
				<span class="leftSort">제목</span>
				<br><br>
			</div>
			<div class="div2 clearboth">
				<span class="leftSort gray margin-right20">i*****d</span>
				<span class="leftSort gray margin-right20"> | </span>
				<span class="leftSort gray">2023-07-07</span>
			</div>
			
			<div class="div2 clearboth border-bottom reviewdiv">
				<button class="btn leftSort" name="size" >좋아요</button>
			</div>
		</div>
		<div>
			<div class="div2 clearboth">
				<span id="star" class="leftSort" style="margin-right: 30px">★★★★★</span>
				<span class="leftSort gray" style="margin-right: 30px">black</span>
				<span class="leftSort gray"> | </span>
				<span class="leftSort gray" style="margin-left: 30px">사이즈</span>
			</div>
			<div class="div2 clearboth">
				<span class="leftSort">제목</span>
				<br><br>
			</div>
			<div class="div2 clearboth">
				<span class="leftSort gray margin-right20">i*****d</span>
				<span class="leftSort gray margin-right20"> | </span>
				<span class="leftSort gray">2023-07-07</span>
			</div>
			
			<div class="div2 clearboth border-bottom reviewdiv">
				<button class="btn leftSort" name="size" >좋아요</button>
			</div>
		</div>
	<!-- 상품Q&A 탭 -->
	<div class="pdtab">
		<ul class="nav nav-tabs">
			<li class="nav-item"><button class="nav-link alink1"
				 style="width: 400px">상품정보</a></li>
			<li class="nav-item"><button class="nav-link alink2"
				 style="width: 400px">상품후기</a></li>
			<li class="nav-item"><button class="nav-link alink3"
				 style="width: 400px">상품Q&A</a></li>
		</ul>
	</div>
	<div class="div2">
		<span class="leftSort small">- 단순 상품비방, 상업적인 내용, 미풍양속 위반, 게시판의 성격에 맞지 않는 글은 통보 없이 삭제될 수 있습니다.</span><br>
		<span class="leftSort small">- 오프라인 매장 재고현황 문의는 ‘</span><span class="leftSort small" name=searchqty>전국오프라인매장</span><span class="leftSort small">’ 정보를 참고하시어 해당 매장으로 문의하시면 좀 더 정확한 확인이 가능합니다.</span><br>
		<span class="leftSort small">- 주문/배송/반품 및 AS 등 기타 문의는 </span><span class="leftSort small" name=searchqty>1:1 상담문의(마이페이지>쇼핑수첩>나의상담)</span><span class="leftSort small">에 남겨주시기 바랍니다.</span><br>
		<span class="leftSort small">- (상품 자체에 대한 문의가 아닌 주문/배송/반품 및 AS 등의 기타문의를 작성하실 경우 나의상담 메뉴로 글이 이동될 수 있습니다.)</span>
	</div>
	<div class="div2 qnafirst clearboth">
		<span class="leftSort margin-top20 margin-left20 bold">QnA 질문 제목</span>
		<span class="leftSort margin-top20 margin-left650">i*****d</span>
		<span class="leftSort margin-top20 margin-left100">2023-07-07</span>
		<span class="leftSort margin-top20 margin-left100">답변완료</span>
	</div>
	<div class="div2 clearboth qnadiv">
		<span class="leftSort margin-top20 margin-left20 bold">QnA 질문 제목</span>
		<span class="leftSort margin-top20 margin-left650">i*****d</span>
		<span class="leftSort margin-top20 margin-left100">2023-07-07</span>
		<span class="leftSort margin-top20 margin-left100">답변완료</span>
	</div>
	<div class="div2 clearboth qnadiv">
		<span class="leftSort margin-top20 margin-left20 bold">QnA 질문 제목</span>
		<span class="leftSort margin-top20 margin-left650">i*****d</span>
		<span class="leftSort margin-top20 margin-left100">2023-07-07</span>
		<span class="leftSort margin-top20 margin-left100">답변완료</span>
	</div>
</section>
<%@include file="../../inc/bottom.jsp" %>
