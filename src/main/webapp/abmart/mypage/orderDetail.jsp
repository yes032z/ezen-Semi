<%@page import="java.text.DecimalFormat"%>
<%@page import="com.semi.orderdetail.model.OrderdetailVO"%>
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
	DecimalFormat df=new DecimalFormat("#,###");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	//페이징 처리
	int currentPage=1;  //현재 페이지
	
	if(request.getParameter("currentPage")!=null){
		currentPage=Integer.parseInt(request.getParameter("currentPage"));
	}
	
	//[1] 현재 페이지와 무관한 변수
	int totalRecord=list.size(); //총 레코드 개수
	int pageSize=5; //한 페이지에 보여주 레코드 수
	int blockSize=10;  //한 블럭에 보여줄 페이지 수
	
	PagingVO pageVo=new PagingVO(currentPage, totalRecord, pageSize, blockSize);

%>
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
    
    var isChecked = false;
    
    $(".chkItem").on("click", function() {
        isChecked = $(".chkItem:checked").length > 0;
    });
 	
    $(".writeReview").on("click",function(){
   	 	var checkedItems = $('.chkItem:checked');
    	if(!isChecked){
    		alert("리뷰를 작성할 상품을 선택해주세요.");
   			return false;
    	}else if (checkedItems.length !== 1) {
          alert("리뷰를 작성할 상품을 하나만 선택해주세요.");
          return false;
    	}else{
    		var value=checkedItems.attr("value");
    		location.href="../pddetail/reviewWrite.jsp?pdno="+value;
    	}
    });
    
    
});
</script>
<article id="mypage">
	<div class="orderinfo">
		<div id="orderinfo-first">주문 조회</div>
		<form name="frmDateSearch" method="post" action="<%=request.getContextPath() %>/abmart/mypage/orderDetail.jsp">
		<div id="orderinfo-third" class="orderbox">
			온라인 쇼핑몰 구매 내역&nbsp;&nbsp;&nbsp;
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
						<th></th>
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
		  <%if(list==null || list.isEmpty()){ %>
		  	<tr class="mypagerow"><th colspan="9">조회된 주문건이 없습니다.</th></tr>
		  <%}else{ %>
		  	<!--주문 목록 조회 반복문 시작  -->	
		  	<%
		  	
		  	int num=pageVo.getNum();
		  	int curPos=pageVo.getCurPos();
		  	
		  	//5번씩만 반복
		  	for(int i=0;i<pageVo.getPageSize();i++){
		  		if(num<1) break;
		  		
		  		ViewVO vo=list.get(curPos++);
		  		num--;
		  	%>	
			<tr>
				<td>
					<input type="checkbox" name="pdno" class="chkItem" value="<%=vo.getPdno() %>">
				</td>
				<td><%=vo.getOrderno() %></td>
				<td>
					<div class="media">
						<img src="../../images/<%=vo.getFilename() %>" class="mr-3 pdimgsize" alt="상품 이미지">
						<div class="media-body">
							<h5 class="mt-0">
								<a href="#"></a>
							</h5>
						</div>
					</div>
				</td>
				<td><%=vo.getPdname() %></td>
				<td><%=vo.getOrderqty() %></td>
				<td><%=df.format(vo.getPrice()) %>원</td>
				<td><%=vo.getPickup() %></td>
				<td><%=sdf.format(vo.getOrderregdate()) %></td>
				<td><input type="button" class="mypagebtn writeReview" value="리뷰 쓰기" /><br>
				<input type="button" class="mypagebtn" name="del" value="반품 신청"> 
				</td>
			</tr>
		<%}//for %>
	  	<!--반복처리 끝  -->
	  <%}//if %>	
					
				</tbody>
			</table>
	<div class="divPage">
	<!-- 페이지 번호 추가 -->		
	<!-- 이전 블럭으로 이동 -->
	<%if(pageVo.getFirstPage()>1){%>
		<a href="orderDetail.jsp?currentPage=<%=pageVo.getFirstPage()-1%>">◀</a>
	<%} %>
						
	<!-- [1][2][3][4][5][6][7][8][9][10] -->
	<%for(int i=pageVo.getFirstPage();i<=pageVo.getLastPage();i++){
		if(i>pageVo.getTotalPage()) break;
	
	    if(i == currentPage){ %>
         <span style="color: red;font-weight: bold;font-size: 1em"><%=i%></span>
   <%   }else{   %>
         <a href="orderDetail.jsp?currentPage=<%=i%>&startDate=<%=startDate%>&lastDate=<%=lastDate %>">[<%=i %>]</a>
   <%   }//if      
	}//for %>
	
	<!-- 다음 블럭으로 이동 -->
	<%if(pageVo.getLastPage()< pageVo.getTotalPage()){%>
		<a href="orderDetail.jsp?currentPage=<%=pageVo.getLastPage()+1%>">▶</a>	
	<%} %>
	
	<!--  페이지 번호 끝 -->
</div>

		</div>
	</div>

</article>
<%@ include file="../../inc/bottom.jsp"%>