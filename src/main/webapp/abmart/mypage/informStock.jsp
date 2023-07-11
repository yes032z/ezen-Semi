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
<jsp:useBean id="intoStockService" class="com.semi.intostock.model.IntostockService" scope="session"></jsp:useBean>
<jsp:useBean id="vo" class="com.semi.view.model.ViewVO" scope="page"></jsp:useBean>
<%
	String id=(String)session.getAttribute("id");
	
	List<ViewVO> list=null;
	try{
		list=intoStockService.selectintoStock(id);
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	//3
	SimpleDateFormat sdf1=new SimpleDateFormat("yyyy-MM-dd E요일 a HH:mm:ss");
	SimpleDateFormat sdf2=new SimpleDateFormat("yyyy-MM-dd");
	
%>
<script type="text/javascript" src="../../js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
$(function() {
	 var isChecked = false; 

    $(".chkItem").on("click", function() {
      isChecked = $(".chkItem:checked").length > 0;
    });
    
    $("#order").click(function() {
        if (!isChecked) {
          alert("주문할 상품을 선택해주세요.");
          return false;
        } else {
      	  var checkedItems = $(".chkItem:checked");
            var values ="";
            
            checkedItems.each(function(index) {
           	  var str = (index === 0) ? "?" : "&";
              values += str + "pdno=" + $(this).attr("value");
            });
            var uri = "../basket/OrderPayment.jsp";
            location.href = uri + values;
        }
      });

});

var uri = "../basket/OrderPayment.jsp";
location.href = uri + values;
</script>
<article id="mypage">
	<div class="orderinfo">
		<div id="orderinfo-first">재고 알림</div>
		<div class="subtitle">찜 상품 입고 알리미</div>
		<%for(int i=0;i<1;i++){
			vo=list.get(i); %>
		<span class="exploreMore">나의 발사이즈 <%=vo.getPdsize() %> 에 맞는 입고 알림입니다.</span>
		<%} %>
		<div id="orderinfo-third">
			<table class="table table-hover">
			<colgroup>
				<col style="width:5%;" />
				<col style="width:12%;" />	
				<col style="width:20%;" />	
				<col style="width:43%;" />	
			</colgroup>
    <thead class="thead-dark">
        <tr>
            <th></th>
            <th>알림일자</th>
            <th></th>
            <th></th>
        </tr>
    </thead>
    <tbody>
     <%if(list==null || list.isEmpty()){ %>
	  	<tr class="mypagerow"><th colspan="5">조회된 알림이 없습니다.</th></tr>
  	<%}else{
  		for(int i=0;i<list.size();i++){
			 vo=list.get(i);	
		%>
        <tr>
            <td><input type="checkbox" name="pdno" class="chkItem" value="<%=vo.getPdno() %>"></td>
            <td><%=sdf1.format(vo.getRegdate()) %></td>
            <td>
                <div class="media">
                   <img src="../../images/<%=vo.getFilename() %>" class="mr-3 pdimgsize" alt="1">
                    <div class="media-body">
                        <h5 class="mt-0"><a href="#"></a></h5>
                    </div>
                </div>
            </td> 
            <td><%=vo.getPdname() %> 이 <%=sdf2.format(vo.getRegdate()) %>에 입고되었습니다.</td>
        </tr>
        <%}//for %>
     <%}//if %>
    </tbody>                  
</table>
	<input type="button" class="mypagebtn2" id="order" name="order" value="주문하기">
			</div>
		</div>
</article>
<%@ include file="../../inc/bottom.jsp" %>