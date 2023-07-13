<%@page import="com.semi.faq.model.FAQVO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp" %>

<style type="text/css">
	#search {width: 50%; height: 36px;}
	
	.main {margin: 90px 0 0 400px}

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
	
	.accordion ul, li {margin: 0px; padding:0px;}
	
	#secBox {list-style: none;}
	
	.accordion ul:first-child {border-top: 2px solid black;}
	
	.contents {list-style: none;}
	
	.contents li {padding: 20px 20px 20px 20px;}
	
	.page {
	    font-size: 19px;
	    margin: 20px 0 0 420px;
	    height: 20px;
	}
	
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

<jsp:useBean id="faqService" class="com.semi.faq.model.FAQService" scope="session"></jsp:useBean>
<%
	//검색일 떄 파라미터
	request.setCharacterEncoding("utf-8");
	String faqCategory = request.getParameter("faqCategory");
	String search = request.getParameter("search");
	
	boolean bool = false;
	if (faqCategory != null && !faqCategory.isEmpty() || search != null && !search.isEmpty()) {
			bool = true;
			
	}//
	
	List<FAQVO> list = null;
	
	System.out.println("bool = " + bool);
	if (bool) {
		
		list = faqService.selectBy(faqCategory, search);
		
		if (search == null) search = ""; 
		if (faqCategory == null) faqCategory = ""; 
	}
	
	//자주 찾는 faq 상위 5건  
	if (!bool) {
		try {
			list = faqService.selectBest5();
		} catch (SQLException e) {
				e.printStackTrace();		
		}
		
	}//
	
	
	//
	int currentPage = 1;	//현재 페이지
	
	if(request.getParameter("currentPage") != null) {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	
	//
	int totalRecord = list.size();	
	int pageSize = 5;	
	int blockSize = 10;
	int totalPage = (int)Math.ceil((float)totalRecord / pageSize);
	
	int firstPage = currentPage - ((currentPage-1) % blockSize);	
	int lastPage = firstPage + (blockSize - 1);
	
	int curPos = (currentPage - 1)* pageSize;
	
	int num = totalRecord - curPos;
	
	
%>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-3.7.0.min.js"></script>
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
	         } else {
	            $(this).children('.contents').slideUp();
	         }
		});
		
		$('#search')
		
	});//
	
</script>

	<!-- mypagenav -->
	<nav id="leftNav">
		<h2>고객센터</h2>
		<dl id="leftNavi">
			<!-- category list -->
			<dt><a href="FAQ.jsp?">FAQ</a></dt>
			<dt><a href="notice.jsp">공지사항</a></dt>
			<dt><a href="store.jsp">매장 찾기</a></dt>
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
	
	<!-- 페이징 폼 -->
	<form action="<%=request.getContextPath() %>/abmart/servicecenter/FAQ.jsp" name="frmPage" method="post">
		<input type="hidden" name="currentPage">
	</form>
	
	<article class="main">
	<form name="FAQfrm" method="post" 
		<%if (bool == true) { %>
			action="<%=request.getContextPath() %>/abmart/servicecenter/FAQ.jsp?faqTitle=<%=search %>">
		<%} %>
			
		<h3 style="font-weight: bold;">FAQ</h3>
		<div id="searchFaq">
			<hr style="border: 1px solid black;"><br>
			<a>FAQ 검색</a> 
			<input type="text" name="search" id="search" placeholder="궁금한 내용을 입력해주세요." 
				value="<%=search != null ? search : "" %>">
			<input type="submit" value="검색" class="btsearch"/><br><br>
			<hr>
		</div><br>
		
		<div>
			<table summary="FAQ List" id="category" border="1">
				<tr>
					<td><a href="FAQ.jsp?faqCategory=<%="상품정보" %>">상품정보</a></td>
					<td><a href="FAQ.jsp?faqCategory=<%="배송현황" %>">배송현황</a></td>
					<td><a href="FAQ.jsp?faqCategory=<%="환불" %>">환불</a></td>
					<td><a href="FAQ.jsp?faqCategory=<%="주문/결제/취소" %>">주문/결제/취소</a></td>
				</tr>
				<tr>
					<td><a href="FAQ.jsp?faqCategory=<%="회원정보" %>">회원정보</a></td>
					<td><a href="FAQ.jsp?faqCategory=<%="일반정보" %>">일반정보</a></td>
					<td><a href="FAQ.jsp?faqCategory=<%="AS" %>">AS</a></td>
					<td><a href="FAQ.jsp?faqCategory=<%="영수증" %>">영수증</a></td>
				</tr>
			</table>
		</div>
		
		<div class="question"> 
			<%if (!bool) { %>
			<p style="font-weight: bold;">자주 묻는 질문 BEST 5</p>
		<%	} %>
			<div class="accordion">
		      <ul id="secBox">
			<% 
				/* 질문 best5 반복 시작  */
				for (int i = 0; i < pageSize; i++) {
					if (num < 1) break;
					
					FAQVO vo = list.get(curPos++);
					num--;
				%>
		         <li class="header">
		            <span class="section">
						<img alt="faqImg" src="../../images/FAQ.png"> &nbsp;<%=vo.getfaqTitle() %>
					</span>
		            <ul class="contents">
		               <li><%=vo.getfaqBody() %></li>
		            </ul>
		     	</li>
		     <%}//for %>
		      </ul>
		   </div>
		   <!-- 페이징 -->
		   <div class="page">
		   		<%if (firstPage > 1) {%>
					<a href = "FAQ.jsp?currentPage=<%=firstPage-1 %>">[이전]</a>
				<%} %>
				
				<% for (int i = firstPage; i <= lastPage; i++) {
					if (i > totalPage) break;
					
					if (i == currentPage) { 
						if (totalPage != 1) {%>
						<span class="cur" style="color: white; background-color: black; font-size: 1em"><%=i%></span>
				<%		}
					} else { %>
						<a href="<%=request.getContextPath() %>/abmart/servicecenter/FAQ.jsp?currentPage=<%=i %>&faqTitle=<%=search %>&faqCategory=<%=faqCategory %>"><%=i %></a>
				<%  }//if      
				}//for %>
				
				<%if (lastPage < totalPage) {%>
					<a href = "FAQ.jsp?currentPage=<%=lastPage+1 %>">[다음]</a>
				<%} System.out.println("현재 페이지" + currentPage);%>
			</div> <!-- 페이징 -->
	   </div>
	</form>
	</article><br><br><br><br><br><br>

<%@ include file="../../inc/bottom.jsp" %>