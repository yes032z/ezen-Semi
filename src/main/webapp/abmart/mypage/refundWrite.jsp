<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.semi.orderdetail.model.OrderdetailService"%>
<%@page import="com.semi.view.model.ViewVO"%>
<%@page import="com.semi.product.model.ProductService"%>
<%@page import="com.semi.product.model.ProductVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../../css/mypage.css" rel="stylesheet" type="text/css">
<jsp:useBean id="ODService" class="com.semi.orderdetail.model.OrderdetailService" scope="session"></jsp:useBean>
<script type="text/javascript" src="../../js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
$(function() {
    $("#refund1").click(function() {
     	if(confirm("해당 내용으로 환불을 진행하시겠습니까?")) {
	     	var str=$('#refundbody').val();
	     	if (str.length < 10) {
				alert('10글자 이상 입력 바랍니다.');
				return false;
			}
     	}
    });

    $("#refund2").click(function() {
    	self.close();
    });
    
});  
</script>
</head>
<body>
<%
	String id=(String)session.getAttribute("id");
	String orderno=request.getParameter("orderno");
	
	if(orderno==null || orderno.isEmpty()){%>
	<script type="text/javascript">
		alert('잘못된 url입니다.');
		location.href="<%=request.getContextPath()%>/index.jsp";
	</script>
	<%	return;
	}

	ViewVO vo=null;
	try{
		vo=ODService.selectByOrderNo(id, Integer.parseInt(orderno));
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	String refundbody="";
	
	DecimalFormat df=new DecimalFormat("#,###");
%>
<section>
		<article>
		<h2>환불 신청하기</h2>
		<h4>상품명 : <%=vo.getPdname()%></h4>
		<img src="../../images/<%=vo.getFilename()%>" alt="신발이미지" width="530px"
			height="150px">
		<hr>
		<p>수량 : <%=vo.getOrderqty() %></p>
		<p>금액 : <%=df.format(vo.getPrice()) %>원</p>
		<hr>
		<h4>환불 사유를 작성해 주세요.</h4>
			<form name="frmWrite" method="post" action="refundWrite_ok.jsp">
			<input type="hidden" name="orderno" value="<%=orderno%>">
			<input type="hidden" name="pdno" value="<%=vo.getPdno()%>">
				<textarea id="refundbody" name="refundbody" style="width: 530px; height: 150px; "><%=refundbody %></textarea>
					<input type="submit" class="mypagebtn2 btn btn-secondary" id="refund1" value="등록" />
					<input type="Button" class="mypagebtn2 btn btn-secondary" id="refund2" value="취소" />
			</form>
		</article>
	</section>
</body>
</html>