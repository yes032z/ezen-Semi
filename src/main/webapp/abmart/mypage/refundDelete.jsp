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
<%
	String[] refundno=request.getParameterValues("refundno");

	try{
		int result=refService.deleterefundByRNo(refundno);
		
		if(result>0){%>
		<script type="text/javascript">
			alert("환불요청 취소가 정상적으로 완료되었습니다.");
			location.href="orderDetail.jsp";
		</script>
		<%}else{%>
		<script type="text/javascript">
		alert("환불요청 취소에 실패했습니다. 재시도 바랍니다. ");
		location.href="refundDetail.jsp";
		</script>
		<%}
	}catch(SQLException e){
		e.printStackTrace();
	}
%>
</body>
</html>