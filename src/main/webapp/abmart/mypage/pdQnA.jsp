<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.semi.common.PagingVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.semi.view.model.ViewVO"%>
<%@page import="java.util.List"%>
<%@page import="com.semi.qna.model.QnAService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp" %>
<%@ include file="../../inc/mypagenav.jsp" %>
<link href="../../css/mypage.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../../js/jquery-3.7.0.min.js"></script>
<script type="text/javascript" src="../../js/jquery-ui.min.js"></script>
<script type="text/javascript">
$(function() {
    function setDates(startMonth) {
        var startDate = new Date();
        startDate.setMonth(startDate.getMonth() - startMonth);
        var lastDate = new Date(); // 오늘 날짜
        
        var startDateValue = startDate.toISOString().split('T')[0];
        var lastDateValue = lastDate.toISOString().split('T')[0];
        
        $('#startDate').val(startDateValue);
        $('#lastDate').val(lastDateValue);
    }
    
    //첫 페이지 로딩 시, startDate와 lastDate에 값이 있는 경우에는 해당 값을 유지
    var startDateValue = $('#startDate').val();
    var lastDateValue = $('#lastDate').val();
    if (!startDateValue || !lastDateValue) {
        setDates(1);
    }
    
    $('#datebtn1').click(function() {
        setDates(1);
    });

    $('#datebtn2').click(function() {
        setDates(3);
    });

    $('#datebtn3').click(function() {
        setDates(6);
    });

    $('#datebtn4').click(function() {
        setDates(12);
    });
   
});
</script>
<jsp:useBean id="qnaService" class="com.semi.qna.model.QnAService" scope="session"></jsp:useBean>
<%
	//날짜 파라미터 읽어오기
	request.setCharacterEncoding("utf-8");
	String id=(String)session.getAttribute("id");
	String startDate=request.getParameter("startDate");
	String lastDate=request.getParameter("lastDate");
	
	List<ViewVO> list=null;
	try{
		list=qnaService.selectQnAByid(id, startDate, lastDate);
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	//3
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		//페이징 처리
		int currentPage=1;  //현재 페이지
		
		if(request.getParameter("currentPage")!=null){
			currentPage=Integer.parseInt(request.getParameter("currentPage"));
		}
		
		//[1] 현재 페이지와 무관한 변수
		int totalRecord=list.size(); //총 레코드 개수, 17
		int pageSize=5; //한 페이지에 보여주 레코드 수
		int blockSize=10;  //한 블럭에 보여줄 페이지 수
		
		PagingVO pageVo=new PagingVO(currentPage, totalRecord, pageSize, blockSize);
	
%>
<article id="mypage">
	<div class="orderinfo">
		<div id="orderinfo-first">상품 Q & A</div>
		<div class="subtitle">내가 작성한 상품 Q & A</div>
		<form name="frmDateSearch" method="post" action="<%=request.getContextPath() %>/abmart/mypage/pdQnA.jsp">
		<div id="orderinfo-third" class="orderbox">
			Q & A 작성 기간&nbsp;&nbsp;&nbsp;
			<button type="button" id="datebtn1" class="btn btn-outline-secondary" name="size">1개월</button>
			<button type="button" id="datebtn2" class="btn btn-outline-secondary" name="size">3개월</button>
			<button type="button" id="datebtn3" class="btn btn-outline-secondary" name="size">6개월</button>
			<button type="button" id="datebtn4" class="btn btn-outline-secondary" name="size">1년</button>
			<input type="date" id="startDate" name="startDate" value="<%=startDate %>" /> ~ 
			<input type="date" id="lastDate" name="lastDate" value="<%=lastDate %>" />
			<button type="submit" class="mypagebtn">조회</button>
		</div>
		<div id="searchSort" class="selectmyorders">
		 <%if(startDate!=null && !startDate.isEmpty() && lastDate!=null && !lastDate.isEmpty()){%>
		   <span class="leftSort">총 </span><span class="leftSort" name="searchqty"><%=list.size() %></span>
		   <span class="leftSort">건이 조회되었습니다.</span>
	     <%}%>
		</div>
		</form>
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
			  	int num=pageVo.getNum();
			  	int curPos=pageVo.getCurPos();
			  	
			  	//5번씩만 반복
			  	for(int i=0;i<pageVo.getPageSize();i++){
			  		if(num<1) break;
			  		
			  		ViewVO vo=list.get(curPos++);
			  		num--;
			  	%>	
				<tr>
					<th scope="row"><%=vo.getQnano() %></th>
					<td><a href="#"><%=vo.getQnabody() %></a></td>
					<td><%=vo.getPdname() %></td>
					<td><%=vo.getQnaview() %></td>
					<td><%=sdf.format(vo.getQnaregdate()) %></td>
				</tr>
					<%}//for%>
				<%}//if %>	
				</tbody>
			</table>
			<div class="divPage">
				<!-- 페이지 번호 추가 -->		
				<!-- 이전 블럭으로 이동 -->
				<%if(pageVo.getFirstPage()>1){%>
					<a href="list.jsp?currentPage=<%=pageVo.getFirstPage()-1%>">
						<img src="../../images/first.JPG">
					</a>	
				<%} %>
									
				<!-- [1][2][3][4][5][6][7][8][9][10] -->
				<%for(int i=pageVo.getFirstPage();i<=pageVo.getLastPage();i++){
					if(i>pageVo.getTotalPage()) break;
				
				    if(i == currentPage){ %>
			         <span style="color: blue;font-weight: bold;font-size: 1em"><%=i%></span>
			   <%   }else{   %>
			         <a href="orderDetail.jsp?currentPage=<%=i%>&startDate=<%=startDate%>&lastDate=<%=lastDate %>">[<%=i %>]</a>
			   <%   }//if      
				}//for %>
				
				<!-- 다음 블럭으로 이동 -->
				<%if(pageVo.getLastPage()< pageVo.getTotalPage()){%>
					<a href="list.jsp?currentPage=<%=pageVo.getLastPage()+1%>">
						<img src="../../images/last.JPG">
					</a>	
				<%} %>
				
				<!--  페이지 번호 끝 -->
			</div>
		</div>
</div>

</article>
<%@ include file="../../inc/bottom.jsp" %>