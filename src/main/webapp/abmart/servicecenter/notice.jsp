<%@page import="com.semi.common.PagingVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="com.semi.notice.model.NoticeVO"%>
<%@page import="com.semi.notice.model.NoticeService"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp" %>
<style type="text/css">
	.notice {margin: 90px 0 0 400px; font-family: 'Nanum Gothic';}

	.noticeBody {
		width: 900px;
		border-bottom: 1px solid #80808073;
		border-top: 2px solid black;
	}
	
	.noticeBody tr {
		height: 70px;
		border-bottom: 1px solid #80808073;
	}
	
	h4 {margin-bottom: 20px; font-weight: 550;}
	
	a {text-decoration: none; color: black;}
	
	.noticeBody th {text-align: center;}
	
	td:nth-child(odd) {text-align: center;}
	
	/* 페이징 */
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
	function pageFunc(curPage){
		$('input[name="currentPage"]').val(curPage);
		$('form[name="frmPage"]').submit();
	}
</script>
<%

	request.setCharacterEncoding("utf-8");
	String noticeNo = request.getParameter("noticeNo");
	
	
	NoticeService noticeService = new NoticeService();
	List<NoticeVO> list = null;
	
	try {
		list = noticeService.selectAll();
		
	} catch (SQLException e) {
		e.printStackTrace();
	}
	
	PagingVO pageVo = (PagingVO)request.getAttribute("pageVo");
	
	int currentPage = 1;	//현재 페이지
	
	if(request.getParameter("currentPage") != null) {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	
	//
	int totalRecord = list.size();	
	int pageSize = 10;	
	int blockSize = 10;
	int totalPage = (int)Math.ceil((float)totalRecord / pageSize);
	
	int firstPage = currentPage - ((currentPage-1) % blockSize);	
	int lastPage = firstPage + (blockSize - 1);
	
	int curPos = (currentPage - 1)* pageSize;
	
	int num = totalRecord - curPos;
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
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
	
	<!-- 페이징 폼 -->
	<form action="<%=request.getContextPath() %>/abmart/servicecenter/notice.jsp" name="frmPage" method="post">
		<input type="hidden" name="currentPage">
	</form>
	
	<article>
		
		<div class="notice">
			<h4>공지사항</h4>
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
					<% 
					for (int i = 0; i < pageSize; i++) {
						if (num < 1) break;
						
						NoticeVO vo = list.get(curPos++);
						num--;
					%>
					<tr>
						<td><%=vo.getNoticeNo() %></td>
						<td><a href="notice_detail.jsp?noticeNo=<%=vo.getNoticeNo() %>" class="notice-link">
						<%=vo.getNoticeName() %></a>
						<td><%=sdf.format(vo.getNoticeRegdate()) %></td>
					</tr>
					<%} %>
				</tbody>
			</table>
			<!-- 페이징 -->
			<div class="page">
				<% for (int i = firstPage; i <= lastPage; i++) {
					if (i > totalPage) break;
					if (i == currentPage) { %>
					<span class="cur" style="color: white; background-color: black; font-size: 1em"><%=i%></span>
				<%	} else { %>
				<a class="pa" href="#" onclick="pageFunc(<%=i%>)"><%=i %></a>
				<%   }//if      
				}//for %>
			</div> <!-- 페이징 -->
		</div>
	</article><br><br><br><br><br><br>


<%@ include file="../../inc/bottom.jsp" %>