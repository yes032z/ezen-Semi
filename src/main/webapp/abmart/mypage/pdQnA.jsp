<%@page import="java.sql.SQLException"%>
<%@page import="com.semi.view.model.ViewVO"%>
<%@page import="java.util.List"%>
<%@page import="com.semi.qna.model.QnAService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp" %>
<%@ include file="../../inc/mypagenav.jsp" %>
<link href="../../css/mypage.css" rel="stylesheet" type="text/css">
<jsp:useBean id="qnaService" class="com.semi.qna.model.QnAService" scope="session"></jsp:useBean>
<%
	//mypage.jsp에서 get방식 이동
	String id=(String)session.getAttribute("id");

	List<ViewVO> list=null;
	try{
		list=qnaService.selectQnAByid(id);
	}catch(SQLException e){
		e.printStackTrace();
	}
%>
<article id="mypage">
	<div class="orderinfo">
		<div id="orderinfo-first">상품 Q & A</div>
		<div class="subtitle">내가 작성한 상품 Q & A</div>
		<div id="orderinfo-third">
			<table class="table table-hover">
				<colgroup>
				<col style="width:10%;" />
				<col style="width:45%;" />
				<col style="width:15%;" />
				<col style="width:15%;" />
				<col style="width:15%;" />		
				</colgroup>
				<thead class="thead-dark">
					<tr>
						<th scope="col">번호</th>
						<th scope="col">내용</th>
						<th scope="col">상품명</th>
						<th scope="col">공개유무</th>
						<th scope="col">등록일</th>
					</tr>
				</thead>
				<tbody>
				<%if(list==null || list.isEmpty()){ %>
					<tr class="mypagerow"><th colspan="5">내가 작성한 Q & A가 존재하지 않습니다.</th></tr>
				<%}else{
					for(int i=0;i<list.size();i++){
						ViewVO viewVo=list.get(i);%>
						<tr>
							<th scope="row"><%=viewVo.getQnano() %></th>
							<td><a href="#"><%=viewVo.getQnabody() %></a></td>
							<td><%=viewVo.getPdname() %></td>
							<td><%=viewVo.getQnaview() %></td>
							<td><%=viewVo.getQnaregdate() %></td>
						</tr>
					<%}//for
				}//if %>	
				</tbody>
			</table>
			</div>
		</div>

</article>
<%@ include file="../../inc/bottom.jsp" %>