<%@page import="com.semi.zipcode.model.*"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:useBean id="zipcodeService" class="com.semi.zipcode.model.ZipcodeService" 
	scope="session"></jsp:useBean>
<%
	//1
	request.setCharacterEncoding("utf-8");
	String dong=request.getParameter("dong");
	
	//2
	List<ZipcodeVO> list=null;
	if(dong != null && !dong.isEmpty()){
		list=zipcodeService.selectZipcode(dong);
	}
	
	//3 공백일때 null -> 공백 표시
	if(dong==null) dong = "";
%>
<meta charset="UTF-8">
<title>zipcode.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/mainstyle.css"/>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.7.0.min.js"></script>

<style type="text/css">
	body{	margin:5px;padding:5px;}	
	caption{visibility:hidden;	}	
</style>

<script type="text/javascript">
	$(function() {
		$('#dong').focus();
		
	    $('#submit').click(function() {
	       if($('#dong').val().length<1){
	          alert("동을 입력하세요.");
	          $('#dong').focus();
	          event.preventDefault();
	       }
	    });
	 });

	//부모창(회원가입 창)에 우편번호, 주소 셋팅하기
	function setZipcode(zipcode, address){
		$(opener.document).find('#zipcode').val(zipcode); /* 회원가입창 아이디가 zipcode인곳에 값 뿌리기 */
		$(opener.document).find('input[name = address]').val(address); /* 회원가입창 name = address인 부분에 뿌리기 */
		
		self.close(); /* 검색창 닫기 */
	}
</script>
</head>
<body>
<h2>우편번호 검색</h2><br><p>	찾고 싶으신 주소의 동(읍/면)을 입력하세요</p>
	<form name="frmZipcode" method="post" action="zipcode.jsp">
		<label for="dong">지역명 : </label>
		<input type="text" name="dong" id="dong"  value="<%=dong%>">
		<input type="submit" id="submit" value="찾기">
	</form>
	
	<%if(list!=null){%>
		<br>
		<table style="width:470px" class="box2" 
			summary="우편번호 검색 결과 우편번호 주소 정보 제공">
			<caption>우편번호 검색</caption>
			<colgroup>
				<col style="width:20%" />
				<col style="width:*" />				
			</colgroup>
			<thead>
			  <tr>
				  <th scope="col">우편번호</th>
				  <th scope="col">주소</th>	 
			  </tr>
			</thead>
			<tbody>
				<%if(list==null || list.isEmpty()){ %>
					<tr>
						<td colspan="2">해당하는 주소는 존재하지 않습니다.</td>
					</tr>
				<%}else{ %>
					<!-- 반복시작 -->
					<%
					for(int i=0;i<list.size();i++){
						ZipcodeVO vo = list.get(i);
						String address = vo.getSi() + " " + vo.getGu() 
							+ " " + vo.getDong();
						String bunji = vo.getStartbunji();
						String endbunji = vo.getEndbunji();
						if (endbunji != null && !endbunji.isEmpty()) {
							bunji += " ~ " + endbunji; /* endbunji 있을경우 출력 */
						}
					%>
						<tr>
							<td><%=vo.getZipcodeno()%></td>
							<td>
							<a href="#" onclick="setZipcode('<%=vo.getZipcodeno()%>','<%=address %>')">
								<%=address %> <%=bunji %>
							</a>
							</td>
						</tr>
					<%}//for %>
					<!-- 반복끝 -->
				<%} %>
			</tbody>
		</table>
	<%} %>	
</body>
</html>

