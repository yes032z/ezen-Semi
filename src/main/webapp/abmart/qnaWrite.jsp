<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String pdno=request.getParameter("pdno");
%>
	<form name="frmqna" method="post" action="qnaWrite_ok.jsp">
		<input type="hidden" name="pdno" value="<%=pdno%>">
		<h1>Q&A 작성</h1>
		<hr style="clear:both;border: 1px solid black;">
		<div class="div3" style="margin-top: 50px;margin-left: 50px" >
			<div style="width:100px;height:40px;clear:both;float:left;">
				<span>문의 내용</span>
			</div>
				<textarea name="qnabody" id="qnabody" style="width:700px;height:150px;"></textarea>
			</div>
			
			<div style="clear:both;margin-left: 145px;clear:both;">
				<input for="qnaview" type="checkbox" name="qnaview" id="qnaview" /><label for="qnaview">비밀글 설정</label>
			</div>
			<br><br><br>
			<hr style="clear:both;border: 1px solid black;">
		</div>
		<div>
			<img alt="qna이미지" src="../images/qna.png">
		</div>
		<div class="div3" style="text-align: center;margin-top: 30px;">
			<input type="submit" name="submit" id="submit" value="등록" style="width:200px;height:30px;" />
		</div>
	</form>
</body>
</html>