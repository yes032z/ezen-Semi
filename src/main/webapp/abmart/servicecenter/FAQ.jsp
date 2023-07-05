<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp" %>
<style type="text/css">
	h2 {margin-left: 27%;}
	
	#txtsearch {width: 50%; height: 36px;}
	
	#btsearch {
		background: black;
		color: white;
		font-weight: bold;
		margin-left: 5px;
		padding: 4px 22px 4px 22px;
	}

	#searchFaq {
		margin-left: 27%;
		background: #80808014;
		width: 900px;
	}
	
	#searchFaq a {
		margin-left: 10%;
		margin-right: 5%;
	}
	
	#faqtab {margin-left: 27%; width: 900px;}
	
	#faqtab td {
		padding: 15px 15px 15px 15px;
		text-align: center;
		width: 180px;
	}
	
	#faqtab a {
		color: gray;
		text-decoration: none;
	}
	
	#question {margin-left: 27%; width: 900px;}
	
	.accordion {margin-left: 24.8%; width: 900px;}
	
	.header {
		padding: 20px 0 20px 10px; 
		font-weight: bold;
		border-bottom: 1px solid gray;
	}
	
	.contents {
		background: #80808014; 
		padding: 25px 0 25px 50px;
		font-size:14px;
	}
	
	ol,ul,li {list-style: none;}
	
</style>
<script type="text/javascript" src="../../js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('#faqtab td').hover(function() {
			$(this).css('background', 'black');
			$(this).find('a').css('color', 'white');
		}, function() {
			$(this).css('background', '');
			$(this).find('a').css('color', '');
		});
		
		$('#faqtab td').click(function() {
			$(this).css('background', 'black');
			$(this).find('a').css('color', 'white');
		});
		
		$('.contents').hide();
		
		$('.header').click(function(){
	         $('.contents').slideUp();
	         if ($(this).children('.contents').is(':hidden')){
	            $(this).children('.contents').slideDown();
	         } else{
	            $(this).children('.contents').slideUp();
	         }
		});
		
	});

</script>
	<article>
		<h2>FAQ</h2>
		<div id="searchFaq">
			<hr><br>
			<a>FAQ 검색</a>
			<input type="text" id="txtsearch" placeholder="궁금한 내용을 입력해주세요.">
			<button id="btsearch">검색</button><br><br>
			<hr>
		</div><br>
		
		<div>
			<table summary="FAQ를 묶어놓은 것 입니다." id="faqtab" border="1">
				<tr>
					<td><a href="#">상품정보</a></td>
					<td><a href="#">배송현황</a></td>
					<td><a href="#">교환/반품/환불</a></td>
					<td><a href="#">주문/결제/취소</a></td>
					<td><a href="#">AS</a></td>
				</tr>
				<tr>
					<td><a href="#">회원정보</a></td>
					<td><a href="#">일반정보</a></td>
					<td><a href="#">멤버십</a></td>
					<td><a href="#">영수증/증빙서류</a></td>
					<td><a href="#">입점/기타</a></td>
				</tr>
			</table>
		</div><br><br>
		
		<p style="font-weight: bold; margin-left: 27%;">자주 묻는 질문 BEST 10</p>
		<div class="accordion">
	      <ul id="secBox">
	         <li class="header" style="border-top: 2px solid black;">
	            <span class="section">
					<img alt="faqImg" src="../../images/faq.png"> &nbsp;결제방법(결제수단)을 변경하고 싶어요.
				</span>
	            <ul class="contents">
	               <li>결제완료 후 '배송완료' 상태까지만 결제수단 변경이 가능하므로 (구매확정 이후 변경 불가)<br />
주문상태를 확인하신 후 고객센터(1588-9667)로 요청해 주시면 재결제 가능하도록 처리해 드리고 있습니다.<br />
<br />
<결제수단 변경 안내><br />
 - 신용카드, 계좌이체 결제건에 한해서 결제수단 변경이 가능합니다. (이외 결제수단은 처리 불가능)<br />
   (포인트, 기프트카드를 같이 사용한 경우 제외)<br />
 - 주문건에 입점사 상품이 포함된 경우 결제수단 변경이 불가능 합니다.<br />
 - 아트배송으로 주문하신 상품은 결제수단 변경이 불가능 합니다.<br />
<br />
*재 결제 경로 : [마이페이지 > 주문/배송 현황 조회 > 주문상세 > 결제수단 변경 버튼 클릭]</li>
	            </ul>
	         </li>
	         <li class="header">
	         	<span class="section">
	            	<img alt="faqImg" src="../../images/faq.png"> &nbsp;포인트 사용은 어떻게 하나요?
	            </span>
	            <ul class="contents">
	               <li>적립된 A-RT 포인트는 바로 사용 가능하며, 100 POINT단위로 사용할 수 있습니다.<br />
온라인 홈페이지에서는 상품 결제시 포인트를 함께 사용 할 수 있으며<br />
ABC-MART 오프라인 매장에서는 멤버십 카드를 사용하시거나<br />
개인정보 인증으로 포인트 사용 비밀번호 입력 후 가능합니다.<br />
최초의 비밀번호는 고객님의 생월일 4자리입니다.<br />
예) 생일이 1월 1일인 경우 비밀번호는 <u>0101</u> 입니다.</li>
	            </ul>
	         </li>
	         <li class="header">
	            <span class="section">
	            	<img alt="faqImg" src="../../images/faq.png"> &nbsp;교환/반품/AS 신청 시 택배비는 어떻게 결제 해야 하나요?
	            </span>
	            <ul class="contents">
	               <li>택배비는 교환/반품/AS 신청 시 선결제 하실 수 있습니다.</li>
	            </ul>
	         </li>
	         <li class="header">
	            <span class="section">
	            	<img alt="faqImg" src="../../images/faq.png"> &nbsp;다른 상품으로 교환할 수 있나요?
	            </span>
	            <ul class="contents">
	               <li>교환의 경우 사이즈 교환만 가능하며, 색상 변경 및 다른상품으로의 교환은 반품(환불)후 재 주문 해주셔야 합니다.</li>
	            </ul>
	         </li>
	      </ul>
	   </div>
	</article>

<%@ include file="../../inc/bottom.jsp" %>