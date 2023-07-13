<%@page import="com.semi.member.model.MemberService"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:useBean id="memService" class="com.semi.member.model.MemberService" scope="session"></jsp:useBean>
<%
	//http://localhost:9090/herbmall/member/checkId.jsp?userid=hh
	//register.jsp에서 open()에 의해 새창 열림, get
	//1
	String id = request.getParameter("id");

	//2
	//아이디를 입력한 경우에만 db작업
	int result=0;
	if(id!=null && !id.isEmpty()){
		try{
			result=memService.duId(id);
		}catch(SQLException e){
			e.printStackTrace();
		}
	}	
	
	
%>
<meta charset="UTF-8">
<title>checkId.jsp</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.7.0.min.js"></script>

<script type="text/javascript">
$(function(){
	$('#btUse').click(function(){
		$(opener.document).find("#id").val("<%=id%>");
		$(opener.document).find("#chkId").val("Y");
		
		self.close();
	});
	
	$('form[name=frmId]').submit(function(){
		if($('#userid').val().length<1){
			$('.errorMessage').show();
			event.preventDefault();
		}
	});
	
	
});
</script>
</head>
<body>
<h2>아이디 중복 검사</h2><br>
<form name="frmId" method="post" action="Idcheck.jsp">
	<input type="text" name="id" id="id" title="아이디입력" value="<%=id%>" >	
	<input type="submit"  id="submit" value="아이디 확인">
	<span class="errorMessage" style="display: none">아이디를 입력하세요</span>
	
	<%if(result == memService.UNUSABLE_ID){ //이미존재-사용불가 %>
		<p>이미 등록된 아이디입니다. 다른 아이디를 입력하세요</p>
	<%}else if(result == memService.USABLE_ID){ //사용가능 %>
		<input type="button" value="사용하기" id="btUse">
		<p>사용가능한 아이디입니다.</p>
	<%} %>
</form>

</body>
</html>










