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
<jsp:useBean id="vo" class="com.semi.view.model.ViewVO" scope="page"></jsp:useBean>
<%
	String id=(String)session.getAttribute("id");
	String pdno=request.getParameter("pdno");	
	String favoriteno=request.getParameter("favoriteno");
	
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
	int totalRecord=list.size(); 
	int pageSize=10; 
	int blockSize=10; 
	
	PagingVO pageVo=new PagingVO(currentPage, totalRecord, pageSize, blockSize);
	
%>
<script type="text/javascript" src="../../js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
$(function() {
    $(".minus_btn").on("click", function() {
      var quantity = parseInt($(this).siblings(".quantity-input").val());
      if (quantity > 1) {
        $(this).siblings(".quantity-input").val(quantity - 1);
        quantity--;
      }
      updateSumPrice($(this));
    });

    $(".plus_btn").on("click", function() {
      var quantity = parseInt($(this).siblings(".quantity-input").val());
      $(this).siblings(".quantity-input").val(quantity + 1);
      quantity++;
      updateSumPrice($(this));
    });

    function updateSumPrice(btn) {
      var quantity = parseInt(btn.siblings(".quantity-input").val());
      var price = parseInt(btn.parents("tr").find(".price").text().replace("원", "").replace(",", ""));
      var sumprice = price * quantity;
      btn.parents("tr").find(".sumprice").text(sumprice.toLocaleString() + "원");
    };

    var isChecked = false; 

    $(".chkItem").on("click", function() {
      isChecked = $(".chkItem:checked").length > 0;
    });

    $("#del").click(function() {
      if (!isChecked) {
        alert("선택한 상품이 없습니다.");
        return false;
      } else if (!confirm("선택한 상품을 삭제하시겠습니까?")) {
        return false;
      } else {
        var checkedItems = $(".chkItem:checked");
        var values = "";
        
        checkedItems.each(function(index) {
        	 var str = (index === 0) ? "?" : "&";
             values += str + "chkItem=" + $(this).attr("value1");
        });
        var uri = "wishDelete.jsp";
        location.href = uri + values;
      }
    });

    $("#order").click(function() {
      if (!isChecked) {
        alert("주문할 상품을 선택해주세요.");
        return false;
      } else {
    	  var checkedItems = $(".chkItem:checked");
          var values = "";
          
          checkedItems.each(function(index) {
        	  var str = (index === 0) ? "?" : "&";
              values += str + "pdno=" + $(this).attr("value2");
          });
          var uri = "../basket/OrderPayment.jsp";
          location.href = uri + values;
      }
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
				<col style="width:23%;" />	
				<col style="width:21%;" />	
				<col style="width:15%;" />	
				<col style="width:20%;" />		
				<col style="width:15%;" />		
			</colgroup>
    <thead class="thead-dark">
        <tr>
            <th></th>
            <th>이미지</th>
            <th>상품명</th>
            <th>판매가</th>
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
	  		
	  		vo=list.get(curPos++);
	  		num--;
  	%>	
        <tr>
            <td>
	            <input type="checkbox" name="chkItem" class="chkItem" 
	            value1="<%=vo.getFavoriteno() %>" value2="<%=vo.getPdno() %>">
            </td>
            <td>
                <div class="media">
                    <img src="../../images/<%=vo.getFilename() %>" class="mr-3 pdimgsize" alt="1">
                    <div class="media-body">
                        <h5 class="mt-0">
                       		<a href="#"></a>
                        </h5>
                    </div>
                </div>
            </td>
            <td><%=vo.getPdname() %></td>
            <td class="price"><%=df.format(vo.getPrice()) %>원</td>
            <td>
           	 <div class="quantity-adjustment">
	            <button class="plus_btn btn mypagebtn3">+</button>
	            <input type="text" class="quantity-input" value="1" style="width: 45px; height: 35px">
	            <button class="minus_btn btn mypagebtn3">-</button>
       		</div>
            </td>
            <td class="sumprice"><%=df.format(vo.getPrice()) %>원</td>            
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
		<a href="wishList.jsp?currentPage=<%=pageVo.getFirstPage()-1%>">◀</a>	
	<%} %>
								
	<!-- [1][2][3][4][5][6][7][8][9][10] -->
	<%for(int i=pageVo.getFirstPage();i<=pageVo.getLastPage();i++){
		if(i>pageVo.getTotalPage()) break;
	
	    if(i == currentPage){ %>
         <span style="color: red;font-weight: bold;font-size: 1em"><%=i%></span>
   <%   }else{   %>
         <a href="wishList.jsp?currentPage=<%=i%>">[<%=i %>]</a>
   <%   }//if      
	}//for %>
			
			<!-- 다음 블럭으로 이동 -->
			<%if(pageVo.getLastPage()< pageVo.getTotalPage()){%>
				<a href="wishList.jsp?currentPage=<%=pageVo.getLastPage()+1%>">▶</a>	
			<%} %>
			
			<!--  페이지 번호 끝 -->
		</div>
<input type="submit" class="mypagebtn2" id="del" name="del" value="삭제하기">
<input type="submit" class="mypagebtn2" id="order" name="order" value="주문하기">
			</div>
		</div>

</article>
<%@ include file="../../inc/bottom.jsp" %>