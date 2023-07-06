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
<%
	
	//orderDetail.jsp 에서 검색버튼 클릭하면 post방식으로 서브밋됨
			
	//1
	//검색의 경우 파라미터
	request.setCharacterEncoding("utf-8");
	String startDate=request.getParameter("startDate");
	String lastDate=request.getParameter("lastDate");
	
/* 	//2
	ReBoardDAO reBoardDao = new ReBoardDAO();
	List<ReBoardVO> list=null;
	try{
		list=reBoardDao.selectAll(keyword, condition);
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	//3
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	if(keyword==null) keyword="";	
	
	//페이징 처리
	int currentPage=1;  //현재 페이지
	
	if(request.getParameter("currentPage")!=null){
		currentPage=Integer.parseInt(request.getParameter("currentPage"));
	}
	
	//[1] 현재 페이지와 무관한 변수
	int totalRecord=list.size(); //총 레코드 개수, 17
	int pageSize=5; //한 페이지에 보여주 레코드 수
	int blockSize=10;  //한 블럭에 보여줄 페이지 수
	
	PagingVO pageVo=new PagingVO(currentPage, totalRecord, pageSize, blockSize); */

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
   				 <thead class="thead-dark">
					<tr>
						<th><input type="checkbox" name="all" id="chkAll"></th>
						<th>상품명</th>
						<th>총수량</th>
						<th>판매가</th>
						<th>배송비</th>
						<th>금액</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="checkbox" name="1" class="chkItem"></td>
						<td>
							<div class="media">
								<img src="" class="mr-3 pdimgsize" alt="1">
								<div class="media-body">
									<h5 class="mt-0">
										<a href="#">상품명</a>
									</h5>
								</div>
							</div>
						</td>
						<td>1개</td>
						<td>30,000원</td>
						<td>7%</td>
						<td>2500원</td>
						<td><input type="button" class="mypagebtn" value="리뷰 쓰기" /></td>
					</tr>
						<tr>
						<td><input type="checkbox" name="1" class="chkItem"></td>
						<td>
							<div class="media">
								<img src="" class="mr-3 pdimgsize" alt="1">
								<div class="media-body">
									<h5 class="mt-0">
										<a href="#">상품명</a>
									</h5>
								</div>
							</div>
						</td>
						<td>1개</td>
						<td>30,000원</td>
						<td>5%</td>
						<td>2500원</td>
						<td><input type="button" class="mypagebtn" value="리뷰 쓰기" /></td>
					</tr>
				</tbody>
			</table>
			<input type="button" class="mypagebtn2" name="del" value="반품신청"> 
			<input type="button" class="mypagebtn2" name="del" value="취소하기"> 
		</div>
	</div>

</article>
<%@ include file="../../inc/bottom.jsp"%>