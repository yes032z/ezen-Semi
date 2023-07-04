<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp" %>
<style type="text/css" src="../../css/bootstrap.min.css"></style>
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
	
	.accordion {margin-left: 27%; width: 900px;}
	
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
		<div class="accordion" id="accordionExample">
		  <div class="card">
		    <div class="card-header" id="headingOne">
		      <h2 class="mb-0">
		        <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
		          Collapsible Group Item #1
		        </button>
		      </h2>
		    </div>
		
		    <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
		      <div class="card-body">
		        Some placeholder content for the first accordion panel. This panel is shown by default, thanks to the <code>.show</code> class.
		      </div>
		    </div>
		  </div>
		  <div class="card">
		    <div class="card-header" id="headingTwo">
		      <h2 class="mb-0">
		        <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
		          Collapsible Group Item #2
		        </button>
		      </h2>
		    </div>
		    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
		      <div class="card-body">
		        Some placeholder content for the second accordion panel. This panel is hidden by default.
		      </div>
		    </div>
		  </div>
		  <div class="card">
		    <div class="card-header" id="headingThree">
		      <h2 class="mb-0">
		        <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
		          Collapsible Group Item #3
		        </button>
		      </h2>
		    </div>
		    <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
		      <div class="card-body">
		        And lastly, the placeholder content for the third and final accordion panel. This panel is hidden by default.
		      </div>
		    </div>
		  </div>
		</div>
	</article>

<%@ include file="../../inc/bottom.jsp" %>