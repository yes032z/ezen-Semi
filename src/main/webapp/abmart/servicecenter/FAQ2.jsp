<%@page import="com.semi.common.PagingVO"%>
<%@page import="com.semi.faq.model.FAQVO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp" %>

<style type="text/css">
	#search {width: 50%; height: 36px;}
	
	.main {margin: 90px 0 0 490px; font-family: 'Nanum Gothic';}

	.question {margin-top: 50px; width: 900px;}
	
	/* FAQ 검색 */
	#btsearch {
		background: black;
		color: white;
		font-weight: bold;
		margin-left: 5px;
		padding: 4px 22px 4px 22px;
	}

	#searchFaq {
		background: #80808014;
		width: 900px;
	}
	
	#searchFaq a {
		margin-left: 10%;
		margin-right: 5%;
	}
	
	/* FAQ 분류 모음 */
	#category {width: 900px;}
	
	#category td {
		padding: 15px 15px 15px 15px;
		text-align: center;
		width: 180px;
	}
	
	#category a {
		color: gray;
		text-decoration: none;
	}
	
	/* FAQ 질문, 내용 */
	.header {
		padding: 20px 0 20px 10px; 
		font-weight: bold;
		border-bottom: 1px solid gray;
	}
	
	.contents {
		background: #80808014; 
		padding: 25px 0 25px 50px;
		margin-top: 13px;
		font-size:14px;
	}
	
	ul:first-child {border-top: 2px solid black;}
	
	#secBox {list-style: none; margin-left: -40px;}
	
	.contents {list-style: none; margin-left: -40px;}
	
	/* mypagenav */
	#leftNav {width: 300px; float: left; margin-left: 70px;}
	
	h2 {font-weight: bold; margin: 55px 0px 26px 50px; padding-left: 20px;}
	
	dl#leftNavi {margin: 10px 10px 0px 50px; padding-left: 23px;}
	
	#leftNavi dt {padding: 15px 0px 10px 0px; font-size: 18px; font-weight: bold;}
	
	#leftNavi dt a {text-decoration: none; color: black;}
	
	#leftNavi dt a:hover{color: red;}
	
	dd:first-child {color: gray; font-size: 18px; font-weight: bold;}
	
	dd:nth-child(2) {font-size: 19px;}
	
	dd:nth-child(n+3) {font-size: 14px; margin-bottom: 0;}

	dd:nth-child(4) {margin-left: 41px}

	dd:nth-child(5) {color: #808080a6;}
	
</style>
<script type="text/javascript">
	$(function() {
		$('#category td').hover(function() {
			$(this).css('background', 'black');
			$(this).find('a').css('color', 'white');
		}, function() {
			$(this).css('background', '');
			$(this).find('a').css('color', '');
		});
		
		$('#category td').click(function() {
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

<jsp:useBean id="faqService" class="com.semi.faq.model.FAQService" scope="session"></jsp:useBean>
<jsp:useBean id="pageVo" class="com.semi.common.PagingVO" scope="page"></jsp:useBean>
<%
	//검색일 떄 파라미터
	request.setCharacterEncoding("utf-8");
	String search = request.getParameter("search");
	String category = request.getParameter("category");
	
	//자주 찾는 faq 상위 5건  ( type = 1
	//카테고리 선택 (type = 2
	//사용자 직접 입력 검색 ( type = 3
	List<FAQVO> list = null;
	
	int type = 0;
	if (search == null || search.isEmpty() || category == null || category.isEmpty()) {
		try {
			list = faqService.selectBest5();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}//
	
	if (category != null || !category.isEmpty()) {
		type = 1;
		try {
			list = faqService.selectByCategory(category);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}//
	
	if (search != null || !search.isEmpty()) {
		type = 2;
		try {
			list = faqService.selectBySearch(search);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}//
	
	
	//페이징
	int currentPage = 1;	//현재 페이지
	
	if (request.getParameter("currentPage") != null) {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	
	//현재 페이지와 무관한 변수
	int totalRecord = list.size();	//총 레코드 개수 (list.size만큼)
	int pageSize = 10;	//한 페이지에 10개씩 보여주기
	int blockSize = 5;	//한 페이지에 보여줄 페이지 개수
	
	pageVo = new PagingVO(currentPage, totalRecord, pageSize, blockSize);

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
	
	<article class="main">
	<form name="FAQfrm" method="post" action="FAQ.jsp?faqtitle=">
		<h3 style="font-weight: bold;">FAQ</h3>
		<div id="searchFaq">
			<hr style="border: 1px solid black;"><br>
			<a>FAQ 검색</a>
			<input type="text" id="search" placeholder="궁금한 내용을 입력해주세요.">
			<button id="btsearch">검색</button><br><br>
			<hr>
		</div><br>
	</form>
		
		<div>
			<table summary="FAQ List" id="category" border="1">
				<tr>
					<td><a href="FAQ.jsp">상품정보</a></td>
					<td><a href="FAQ.jsp">배송현황</a></td>
					<td><a href="FAQ.jsp">환불</a></td>
					<td><a href="FAQ.jsp">주문/결제/취소</a></td>
				</tr>
				<tr>
					<td><a href="FAQ.jsp">회원정보</a></td>
					<td><a href="FAQ.jsp">일반정보</a></td>
					<td><a href="FAQ.jsp">AS</a></td>
					<td><a href="FAQ.jsp">영수증</a></td>
				</tr>
			</table>
		</div>
		
		<div class="question">
			<p style="font-weight: bold;">자주 묻는 질문 BEST 5</p>
			<div class="accordion">
		      <ul id="secBox">
			<% if (type == 0) { 
				/* 질문 best5 반복 시작  */
				 
				int num = pageVo.getNum();
				int curPos = pageVo.getCurPos();
				
				//
				for (int i = 0; i < pageVo.getPageSize(); i++) {
					if (num < 1) break;
					
					FAQVO vo = list.get(curPos++);
					num--;
				%>
		         <li class="header">
		            <span class="section">
						<img alt="faqImg" src="../../images/faq.png"> &nbsp;<%=vo.getfaqTitle() %>
					</span>
		            <ul class="contents">
		               <li><%=vo.getfaqBody() %></li>
		            </ul>
		     	</li>
		     <%}//for %>
	  	<!--반복처리 끝  -->
	  <%}//if %>        
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
		         <li class="header">
		            <span class="section">
		            	<img alt="faqImg" src="../../images/faq.png"> &nbsp;같은날 주문했는데 배송이 따로 왔어요
		            </span>
		            <ul class="contents">
		               <li>온라인쇼핑몰에서는 온라인과 오프라인 매장의 상품이 동시에 판매되고 있습니다.<br />
이에 같은 날 주문을 했더라도, 발송처에 따라 상품을 받는 시기가 다를 수 있습니다.</li>
		            </ul>
		         </li>
		      </ul>
		   </div>
	   </div>
	</article><br><br><br><br><br><br>

<%@ include file="../../inc/bottom.jsp" %>