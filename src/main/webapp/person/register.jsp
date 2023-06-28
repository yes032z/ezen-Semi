<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.myhw.person.model.personVO"%>
<%@page import="com.myhw.person.model.personDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<%
	//[1] 회원등록 : list.jsp에서 [회원등록] 링크 클릭하여 get방식 이동
	//[2] 회원수정 : detail.jsp에서 [회원수정] 링크 클릭하여 get방식 이동
	
	//1. 요청파라미터 읽어오기([2]에만 해당)
	String no=request.getParameter("no");
	boolean isEdit=false;
	String pageTitle="", btLabel="";
	
	if(no!=null && !no.isEmpty()){
		isEdit=true; //회원수정
		pageTitle="회원 수정";
		btLabel="수정";
	}else{//회원등록
		pageTitle="회원 등록";
		btLabel="등록";
	}

	//2. db작업([2]의 경우 db에서 데이터 조회해서 출력해야함)
	personVO vo=new personVO();
	if(isEdit){
		personDAO personDao=new personDAO();
		try{
		vo=personDao.selectByNo(Integer.parseInt(no));
		}catch(SQLException e){
			e.printStackTrace();
		}
	}//if
	String name=vo.getName();
	String tel=vo.getTel();

	
	if(name==null) name="";
	if(tel==null) tel="";
	
	//3. 결과처리

%>
<title><%=pageTitle %></title>
<style type="text/css">
	body{
		margin: 0 auto;
	    width: 410px;
	    margin: 10px;
	   
	}
	
	fieldset {
 		text-align: center;
	}
	
	#firstdiv{
		padding-left: 30px;
	}
	
	div{
		margin: 10px;
	}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(function(){
		$('#name').focus();
		
		$('input[type=button]').click(function(){
			location.href="list.jsp";
		});
		
		$('input[type=submit]').click(function(){
			$('.infobox').each(function(index,item){
				if(!$(this).val()){
					alert($(this).prev().text()+"를 입력하세요.");
					$(this).focus();
					event.preventDefault();
					return false; //event.stopPropagation(); 
				}
			});
		});
	});
</script>
</head>
<body>
	<div class="divfrm">
		<form name="frmWrite" method="post"
		<%if(!isEdit){ %>
			action="register_ok.jsp"
		<%}else{ %>
			action="edit_ok.jsp?no=<%=no %>"
		<%} %> >
			<fieldset>
				<legend><%=pageTitle %></legend>
				<div id="firstdiv">
					<label for="name">이름</label> <input type="text" id="name"
						name="name" class="infobox" value="<%=name %>" />
				</div>
				<div>
					<label for="tel">전화번호</label> <input type="text" id="tel"
						name="tel" class="infobox" value="<%=tel %>" />
				</div>
				<div>
					<input type="submit" value="<%=btLabel %>" />
					<input type="button" value="목록" />
				</div>
			</fieldset>
		</form>
	</div>
</body>
</html>