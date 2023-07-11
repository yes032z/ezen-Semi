<%@page import="java.sql.SQLException"%>
<%@page import="com.semi.member.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:useBean id="memService" class="com.semi.member.model.MemberService"
	scope="session"></jsp:useBean>
<%@ include file="../../inc/top.jsp"%>
<%@ include file="../../inc/mypagenav.jsp"%>
<style>
p.p {
	font-size: 1.1em;
}

.align_center {
	
}

fieldset {
	margin-top: 109px;
	margin-bottom: 507px;
}
input#submit {
    margin-left: 184px;
    margin-top: 21px;
}
</style>
<script type="text/javascript">
	$(function() {
		$('#pwd').focus();

		$('#submit').click(function() {
			if ($('#pwd').val().length < 1) {
				alert('비밀번호를 입력하세요.');
				$('#pwd').focus();
				return false;
			}

			if (!confirm("회원탈퇴하시겠습니까?")) {
				return false;
			}

		});
	});
</script>
<%
String id = (String) session.getAttribute("id");

MemberVO vo = null;
try {
	vo = memService.selectMember(id);
} catch (SQLException e) {
	e.printStackTrace();
}
%>


<article class="simpleForm">
	<form name="frmOut" method="post" action="memberOut_ok.jsp">
		<fieldset>
			<legend>회원 탈퇴</legend>
			<p class="p">
				<%=id%>님 회원탈퇴하시겠습니까?
			</p>
			<div>
				<label for="pwd" class="p">비밀번호</label> <input type="password"
					name="pwd" id="pwd">
			</div>
			<div class="align_center">
				<input type="submit" id="submit" value="회원탈퇴">
				<%-- <input type="reset" value="취소" onclick="location.href='<%=request.getAsyncContext()%>/index.jsp>'"> --%>
			</div>
		</fieldset>
	</form>
</article>


<%@ include file="../../inc/bottom.jsp"%>