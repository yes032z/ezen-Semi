<%@page import="java.sql.SQLException"%>
<%@page import="com.semi.view.model.ViewVO"%>
<%@page import="java.util.PrimitiveIterator"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp" %>
<%@ include file="../../inc/mypagenav.jsp" %>
<link href="../../css/mypage.css" rel="stylesheet" type="text/css">
<jsp:useBean id="reviewService" class="com.semi.review.model.ReviewService" scope="session"></jsp:useBean>
<%
	//mypage.jsp에서 get방식 이동
	String id=(String)session.getAttribute("id");
	
	List<ViewVO> list=null;
	try{
		list=reviewService.selectReviewByid(id);
	}catch(SQLException e){
		e.printStackTrace();
	}
%>
<article id="mypage">
	<div class="orderinfo">
		<div id="orderinfo-first">상품 리뷰</div>
		<div class="subtitle">내가 작성한 리뷰</div>
		<div id="orderinfo-third">
			<table class="table table-hover">
				<colgroup>
				<col style="width:10%;" />
				<col style="width:30%;" />
				<col style="width:15%;" />
				<col style="width:15%;" />
				<col style="width:15%;" />		
				<col style="width:15%;" />		
				</colgroup>
				<thead class="thead-dark">
					<tr>
						<th scope="col">번호</th>
						<th scope="col">내용</th>
						<th scope="col">상품명</th>
						<th scope="col">별점</th>
						<th scope="col">좋아요</th>
						<th scope="col">등록일</th>
					</tr>
				</thead>
				<tbody>
				<%if(list==null || list.isEmpty()){ %>
					<tr class="mypagerow"><th colspan="6">내가 작성한 리뷰가 존재하지 않습니다.</th></tr>
				<%}else{
					for(int i=0;i<list.size();i++){
						ViewVO viewVo=list.get(i);
						 int reviewGrade = viewVo.getReviewgrade(); %>	
					<tr>
						<th scope="row"><%=viewVo.getReviewno() %></th>
						<td><a href="#"><%=viewVo.getReviewbody() %></a></td>
						<td><%=viewVo.getPdname() %></td>
						<td>
							<div class="d-flex justify-content-center small text-warning mb-2">
							<%for(int j= 1;j<=5; j++) {
      							if (j<= reviewGrade) {%>
        						<div class="bi-star-fill"></div>
						  	  <%}else {%>
        						<div class="bi-star"></div>
							  <%}//if
      						}//for%>
      						</div>
						</td>
						<td><%=viewVo.getGood() %></td>
						<td><%=viewVo.getReviewregdate() %></td>
					</tr>
					<%}//for
				}//if%>
				</tbody>
			</table>
			</div>
			</div>
</article>
<%@ include file="../../inc/bottom.jsp" %>