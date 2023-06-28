<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(function(){
		$('input[type=submit]').click(function(){
			$('.infobox').each(function(index,item){
				if(!$(this).val()){
					alert($(this).prev().text()+"을/를 입력하세요");
					$(this).focus();
					event.preventDefault();
					return false;
				}
			});
		});
	});		
</script>
</head>
<body>
<%
	//- list.jsp에서 책등록 버튼 클릭하여 get방식 이동
	
	//1. 요청파라미터 읽어오기
	
	//2. db연결
	
	//3. 결과처리 

%>
<h1>책 등록</h1>
<form name="frmWrite" method="post" action="register_ok.jsp" enctype="multipart/form-data">
	<label for="title">책제목 </label> : 
	<input type="text" name="title" class="infobox"><br>
	<label for="price">가격 </label> : 
	<input type="text" name="price" class="infobox"><br>
	<label for="publisher">출판사</label> : 
	<input type="text" name="publisher" class="infobox"><br>
	<label for="upfile">첨부파일</label> : 
	<input type="file" name="upfile"><br><br>
	<input type="submit" value="등록">
	<input type="reset" value="취소">
</form>
<br>
<a href="bookList.jsp">책 목록</a> 
</body>
</html>