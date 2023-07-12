<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="refService" class="com.semi.refund.model.RefundService" scope="session"></jsp:useBean>
<jsp:useBean id="vo" class="com.semi.refund.model.RefundVO" scope="page"></jsp:useBean>
<%
	request.setCharacterEncoding("utf-8");

	String orderno=request.getParameter("orderno");
	String pdno=request.getParameter("pdno");
	String refundbody=request.getParameter("refundbody");
	
	vo.setOrderno(Integer.parseInt(orderno));
	vo.setPdno(Integer.parseInt(pdno));
	vo.setRefundbody(refundbody);
	
	try{
		int cnt=refService.refund(vo);
				
		if(cnt>0){%>
		<script type="text/javascript">
			alert("환불 요청이 완료되었습니다.");
			self.close();
			location.href="refundDetail.jsp";
		</script>	
		<%}else{%>
		<script type="text/javascript">
			alert("환불 요청에 실패했습니다. 재시도 바랍니다.");
			self.close();
			location.href="orderDetail.jsp";
		</script>	
		<%}
	}catch(SQLException e){
		e.printStackTrace();
	}

%>
</body>
</html>