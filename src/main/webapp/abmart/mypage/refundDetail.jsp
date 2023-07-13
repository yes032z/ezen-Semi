<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.semi.view.model.ViewVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp" %>
<%@ include file="../../inc/mypagenav.jsp" %>
<link href="../../css/mypage.css" rel="stylesheet" type="text/css">
<jsp:useBean id="refService" class="com.semi.refund.model.RefundService" scope="session"></jsp:useBean>
<%
	
	//orderDetail.jsp 에서 검색버튼 클릭하면 post방식으로 서브밋됨
			
	//1
	String id=(String)session.getAttribute("id");
 	//2
	List<ViewVO> list=null;
	try{
		list=refService.selectAll(id);
	}catch(SQLException e){
		e.printStackTrace();
	}

	DecimalFormat df=new DecimalFormat("#,###");
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
%>
<script type="text/javascript">
	$(function(){
	   var isChecked = false; 
	   
	   $('.refundno').on("click", function() {
		      isChecked = $(".refundno:checked").length > 0;
	    });
		
		$('#del').click(function(){
			 if (!isChecked) {
		        alert("선택한 상품이 없습니다.");
		        return false;
		      }else {
		        var checkedItems = $(".refundno:checked");
		        var values = "";
		        
		        checkedItems.each(function(index) {
		        	 var str = (index === 0) ? "?" : "&";
		             values += str + "refundno=" + $(this).attr("value");
		        });
		        var uri = "refundDelete.jsp";
		        location.href = uri + values;
		      }
		});
	});
</script>
<article id="mypage">
	<div class="orderinfo">
		<div id="orderinfo-first">취소/환불</div>
				
		<div id="orderinfo-third">
			<table class="table table-hover">
			<colgroup>
				<col style="width:5%;" />
				<col style="width:11%;" />
				<col style="width:13%;" />
				<col style="width:13%;" />
				<col style="width:7%;" />	
				<col style="width:10%;" />	
				<col style="width:16%;" />	
				<col style="width:12.5%;" />	
				<col style="width:12.5%;" />	
			</colgroup>
    <thead class="thead-dark">
        <tr>
            <tr>
				<th></th>
				<th>주문번호</th>
				<th>이미지</th>
				<th>상품명</th>
				<th>수량</th>
				<th>금액</th>
				<th>환불사유</th>
				<th>구매일자</th>
				<th>환불신청일자</th>
       		 </tr>
    	</thead>
    <tbody>
     <%if(list==null || list.isEmpty()){ %>
		  	<tr class="mypagerow"><th colspan="8">조회된 환불요청건이 없습니다.</th></tr>
     <%}else{
     	for(int i=0;i<list.size();i++){ 
     		ViewVO vo=list.get(i);
     	%>
       <tr>
			<td>
				<input type="checkbox" name="refundno" class="refundno" value="<%=vo.getRefundno() %>">
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
			<td><%=vo.getRefundbody() %></td>
			<td><%=sdf.format(vo.getOrderregdate()) %></td>
			<td><%=sdf.format(vo.getRefundregdate()) %></td>
		</tr>             
        <%}//for %>
	  <%}//if %>
    </tbody>                  
</table>
	<input type="button" id="del" class="mypagebtn2" name="del" value="취소하기">

			</div>
		</div>

</article>
<%@ include file="../../inc/bottom.jsp" %>