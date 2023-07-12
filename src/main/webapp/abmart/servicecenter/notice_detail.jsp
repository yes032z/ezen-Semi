<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.semi.notice.model.NoticeVO"%>
<%@page import="com.semi.notice.model.NoticeService"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp" %>

<style type="text/css">
	.main {margin: 90px 0 0 400px; width: 900px;}
	
	.header {border-top: 2px solid black; height: 80px; padding-top: 35px;}
	
	.notiTitle {
		margin: 0 150px 20px 20px;
		width: 160px;
		font-size: 19px; 
		font-weight: bold;
	}
	
	.date {color: gray; margin: 100px 0px 50px 50px; padding-left: 300px;}
	
	.content {padding: 20px 20px 20px 20px;}
	
	#btList {
		padding: 15px 40px 15px 40px;
		background-color: black; 
		margin-left: 350px;
		color: white;
		width: 180px;
	}
	
	h4 {margin-bottom: 20px; font-weight: 550;}
	
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

</script>
<%
	request.setCharacterEncoding("utf-8");
	String noticeNo = request.getParameter("noticeNo");
	
	if (noticeNo == null || noticeNo.isEmpty()) { %>
		alert("잘못된 URL입니다.");
		history.back(); 
<% 	}
	
	NoticeService noticeService = new NoticeService();
	NoticeVO vo = new NoticeVO();
	
	try {
		vo = noticeService.selectByNo(Integer.parseInt(noticeNo));
		
	} catch (SQLException e) {
		e.printStackTrace();
	}
	
	String body = vo.getNoticeBody();
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
	
	<article class="main">
		<h4>공지사항</h4>
		<div class="noti">
			<div class="header">
				<span class="notiTitle"><%=vo.getNoticeName() %></span>
				<span class="date"><%=sdf.format(vo.getNoticeRegdate()) %></span>
			</div>
			<hr>
			<div class="content">
				<span class="body"><%=body.replace("\\", "<br>") %></span>
			</div>
			<hr>
		</div>
		<button id="btList" 
		onclick="location.href='<%=request.getContextPath() %>/abmart/servicecenter/notice.jsp'">
		목록</button>
	</article><br><br><br><br><br><br>
	
	
<%@ include file="../../inc/bottom.jsp" %>