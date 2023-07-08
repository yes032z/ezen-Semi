<%@page import="com.semi.common.PagingVO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.semi.view.model.ViewVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp" %>
<%@ include file="../../inc/mypagenav.jsp" %>
<link href="../../css/mypage.css" rel="stylesheet" type="text/css">
<jsp:useBean id="favService" class="com.semi.favoritepd.model.FavoritePdService" scope="session"></jsp:useBean>
<%
	String id=(String)session.getAttribute("id");

	List<ViewVO> list=null;
	try{
		list=favService.selectFavoriteByid(id);
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	//3
	DecimalFormat df=new DecimalFormat("#,###");
	//페이징 처리
	int currentPage=1; //첫번째 페이지
	
	if(request.getParameter("currentPage")!=null){
		currentPage=Integer.parseInt(request.getParameter("currentPage"));
	}
	
	//[1] 현재 페이지와 무관한 변수
	int totalRecord=list.size(); //총 레코드 개수
	int pageSize=10; //한 페이지에 보여주 레코드 수
	int blockSize=10;  //한 블럭에 보여줄 페이지 수
	
	PagingVO pageVo=new PagingVO(currentPage, totalRecord, pageSize, blockSize);
	
%>
<script type="text/javascript">
	$(function() {
	    $(".minus_btn").on("click", function() {
	        var quantity = parseInt($(this).siblings(".quantity-input").val());
	        if (quantity > 1) {
	            $(this).siblings(".quantity-input").val(quantity - 1);
	        }
	    });
	
	    $(".plus_btn").on("click", function() {
	        var quantity = parseInt($(this).siblings(".quantity-input").val());
	        $(this).siblings(".quantity-input").val(quantity + 1);
	    });
	    
	    $('#chkAll').click(function(){
			$('.chkItem').prop('checked',this.checked);
			
			$('#del').click(function(){
				if(confirm('정말 삭제하시겠습니까?')){
					//찜번호 넘기기
				}
			});
			
		});
	    
	    
	});
</script>
<article id="mypage">
	<div class="orderinfo">
		<div id="orderinfo-first">찜한 상품</div>
		<div class="subtitle">나의 찜 목록</div>
		<div id="orderinfo-third">
			<table class="table table-hover">
			<colgroup>
				<col style="width:5%;" />
				<col style="width:10%;" />
				<col style="width:20%;" />	
				<col style="width:25%;" />	
				<col style="width:25%;" />	
				<col style="width:15%;" />		
			</colgroup>
    <thead class="thead-dark">
        <tr>
            <th><input type="checkbox" name="all" id="chkAll"></th>
            <th>번호</th>
            <th>이미지</th>
            <th>상품명</th>
            <th>수량</th>
            <th>금액</th>
        </tr>
    </thead>
    <tbody>
    <%if(list==null || list.isEmpty()){ %>
	  	<tr class="mypagerow"><th colspan="6">조회된 주문건이 없습니다.</th></tr>
  	<%}else{ %>
  	<!--찜 목록 조회 반복문 시작  -->	
  	<%
  		int num=pageVo.getNum();
  		int curPos=pageVo.getCurPos();
  		
  		//10번씩만 반복
  		for(int i=0;i<pageVo.getPageSize();i++){
  			if(num<1) break;
	  		
	  		ViewVO vo=list.get(curPos++);
	  		num--;
  	%>
        <tr>
            <td><input type="checkbox" name="1" class="chkItem"></td>
            <td><%=vo.getFavoriteno() %></td>
            <td>
                <div class="media">
                    <img src="../../images/test.jpg" class="mr-3 pdimgsize" alt="1">
                    <div class="media-body">
                        <h5 class="mt-0">
                       		<a href="#"></a>
                        </h5>
                    </div>
                </div>
            </td>
            <td><%=vo.getPdname() %></td>
            <td>
           	 <div class="quantity-adjustment">
	            <button class="plus_btn btn mypagebtn3">+</button>
	            <input type="text" class="quantity-input" value="1" style="width: 45px; height: 35px">
	            <button class="minus_btn btn mypagebtn3">-</button>
       		</div>
            </td>            
            <td><%=df.format(vo.getPrice()) %>원</td>
        </tr>
      <%}//for %>
	  	<!--반복처리 끝  -->
	  <%}//if %>	  
      
    </tbody>                  
</table>
	<input type="button" class="mypagebtn2" id="del" name="del" value="삭제하기">
	<input type="button" class="mypagebtn2" id="order" name="order" value="주문하기">

			</div>
		</div>

</article>
<%@ include file="../../inc/bottom.jsp" %>