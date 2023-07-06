<%@page import="com.semi.common.PagingVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.semi.view.model.ViewVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp"%>
<%@ include file="../../inc/mypagenav.jsp"%>
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
    //기본설정 startDate 한달전
    setDates(1);
    
    $('#chkAll').click(function(){
		$('.chkItem').prop('checked',this.checked);
	});
    
});
</script>
<jsp:useBean id="ODService" class="com.semi.orderdetail.model.OrderdetailService" scope="session"></jsp:useBean>
<%
	
	//orderDetail.jsp 에서 검색버튼 클릭하면 post방식으로 서브밋됨
			
	//1
	//날짜 파라미터 읽어오기
	request.setCharacterEncoding("utf-8");
	String id=(String)session.getAttribute("id");
	String startDate=request.getParameter("startDate");
	String lastDate=request.getParameter("lastDate");
	
 	//2
	List<ViewVO> list=null;
	try{
		list=ODService.selectAll(id, startDate, lastDate);
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
		<div id="orderinfo-first">주문 조회</div>
		<form name="frmDateSearch" method="post" action="orderDetail.jsp">
		<div id="orderinfo-third" class="orderbox">
			온라인 쇼핑몰 구매 내역&nbsp;&nbsp;&nbsp;
			<button type="button" id="datebtn1" class="btn btnDate" name="size">1개월</button>
			<button type="button" id="datebtn2" class="btn btnDate" name="size">3개월</button>
			<button type="button" id="datebtn3" class="btn btnDate" name="size">6개월</button>
			<button type="button" id="datebtn4" class="btn btnDate" name="size">1년</button>
			<input type="date" id="startDate" name="startDate" value="" /> ~ 
			<input type="date" id='lastDate' name="lastDate" value="" />
			<button type="submit" class="mypagebtn">조회</button>
		</div>
		<div id="searchSort" class="selectmyorders">
		
		   <span class="leftSort">총 </span><span class="leftSort" name="searchqty">10</span>
		   <span class="leftSort">건이 조회되었습니다.</span>
		   
		</div>
		</form>
		<div id="orderinfo-third">
			<table class="table table-hover">
			<colgroup>
				<col style="width:5%;" />
				<col style="width:10%;" />
				<col style="width:15%;" />
				<col style="width:13%;" />
				<col style="width:7%;" />	
				<col style="width:12.5%;" />	
				<col style="width:12.5%;" />	
				<col style="width:12.5%;" />	
				<col style="width:12.5%;" />		
				</colgroup>
   				 <thead class="thead-dark">
					<tr>
						<th><input type="checkbox" name="all" id="chkAll"></th>
						<th>주문번호</th>
						<th>이미지</th>
						<th>상품명</th>
						<th>수량</th>
						<th>금액</th>
						<th>픽업유무</th>
						<th>구매일자</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="checkbox" name="1" class="chkItem"></td>
						<td>주문번호</td>
						<td>
							<div class="media">
								<img src="" class="mr-3 pdimgsize" alt="1">
								<div class="media-body">
									<h5 class="mt-0">
										<a href="#"></a>
									</h5>
								</div>
							</div>
						</td>
						<td>자세한 상품명</td>
						<td>7개</td>
						<td>25000원</td>
						<td>배송</td>
						<td>2023-07-06</td>
						<td><input type="button" class="mypagebtn" value="리뷰 쓰기" /></td>
					</tr>
						
				</tbody>
			</table>
			<div class="divPage">
	<!-- 페이지 번호 추가 -->		
	<!-- 이전 블럭으로 이동 -->
	<%if(pageVo.getFirstPage()>1){%>
		<a href="list.jsp?currentPage=<%=pageVo.getFirstPage()-1%>">
			<img src="../images/first.JPG">
		</a>	
	<%} %>
						
	<!-- [1][2][3][4][5][6][7][8][9][10] -->
	<%for(int i=pageVo.getFirstPage();i<=pageVo.getLastPage();i++){
		if(i>pageVo.getTotalPage()) break;
	
	    if(i == currentPage){ %>
         <span style="color: blue;font-weight: bold;font-size: 1em"><%=i%></span>
   <%   }else{   %>
         <a href="list.jsp?currentPage=<%=i%>&startDate=<%=startDate%>&lastDate=<%=lastDate %>">[<%=i %>]</a>
   <%   }//if      
	}//for %>
	
	<!-- 다음 블럭으로 이동 -->
	<%if(pageVo.getLastPage()< pageVo.getTotalPage()){%>
		<a href="list.jsp?currentPage=<%=pageVo.getLastPage()+1%>">
			<img src="../images/last.JPG">
		</a>	
	<%} %>
	
	<!--  페이지 번호 끝 -->
</div>
			<input type="button" class="mypagebtn2" name="del" value="반품신청"> 
			<input type="button" class="mypagebtn2" name="del" value="취소하기"> 
		</div>
	</div>

</article>
<%@ include file="../../inc/bottom.jsp"%>