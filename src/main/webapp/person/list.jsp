<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.myhw.person.model.personDAO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.myhw.person.model.personVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
<style type="text/css">
	body{
		margin: 0 auto;
	    width: 410px;
	    text-align: center;
	}
	
	table{
		border-collapse: collapse;
		width: 100%;
	}

	div {
    margin: 10px;
	}
	
	.divBtn{
		text-align: right;
	}
	
	a{
		text-decoration: none;
		color: black;
	}
	
	#register{
		font-weight: bold;
		color: #ff7979;
	}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(function() {
		$('tbody tr').hover(function(){
			$(this).css('background','#eee');
		},function(){
			$(this).css('background','');
		});
	});
</script>
</head>
<body>
<%
	//[1] register_ok.jsp에서 회원등록 성공 후 get방식 이동
	//[2] register.jsp, detail.jsp에서 회원목록 a링크 클릭 후 get방식 이동
	//[3] 검색 - list.jsp에서 검색버튼 클릭 후 post 방식 이동

	//1. 요청파라미터 받아오기(검색의 경우 파라미터)
	//post방식 한글인코딩
	request.setCharacterEncoding("utf-8");
	String keyword=request.getParameter("seachKeyword");
	String condition=request.getParameter("searchCondition");


	//2. db작업
	personDAO personDao = new personDAO();
	List<personVO> list = null;

	try {
		list = personDao.selectAll(keyword, condition);
	} catch (SQLException e) {
		e.printStackTrace();
	}
	//3. 결과처리
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	if(keyword==null) keyword="";

	//++페이징 처리
	int currentPage=1; //현재페이지
	
	if(request.getParameter("currentPage")!=null){
		currentPage=Integer.parseInt(request.getParameter("currentPage"));
	}
	//[1]현재 페이지와 무관한 변수
	int totalRecord=list.size(); //총 레코드 개수
	int pageSize=5; //한 페이지에 보여줄 레코드(회원) 수
	int blockSize=10; //한 블럭에 보여줄 페이지 수
	int totalPage=(int)Math.ceil((float)totalRecord/pageSize);
	
	//[2] 현재 페이지를 이용해서 계산해야 하는 변수
		int firstPage = currentPage - ((currentPage-1)%blockSize); //1,11,21,31.. 블럭의 시작페이지	
		int lastPage = firstPage + (blockSize-1); //10,20,30.. 블럭의 마지막 페이지

		//페이지당 ArrayList에서의 시작 index => 0,5,10,15..
		int curPos = (currentPage-1)*pageSize;
		
		//페이지당 글 리스트 시작 번호
		int num = totalRecord-curPos;
%>
<h2>회원 목록</h2>
<div>
   <%if(keyword!=null && !keyword.isEmpty()){%>
   <p>검색어 :<%=keyword %> ,<%=list.size() %> 건 검색되었습니다.</p>
   <%}%>
</div>
	<div class="divList">
		<table border="1">
			<colgroup>
			<col width="10%" />
			<col width="20%" />
			<col width="40%" />
			<col width="30%" />
			</colgroup>
			<thead>
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>전화번호</th>
					<th>가입일</th>
				</tr>
			</thead>
			<tbody>
				<%if (list == null || list.isEmpty()) {%>
				<tr>
					<th colspan="4">데이터가 없습니다.</th>
				</tr>
				<%} else {%>
				<!-- 회원 내용 반복 시작 -->
				<%//5번씩만 반복
				for (int i = 0; i < pageSize; i++) {
					if(num<1) break;
					
					personVO vo = list.get(curPos++);
					num--;
					%>
				<tr>
					<td><%=vo.getNo()%></td>
					<td>
					<a href="detail.jsp?no=<%=vo.getNo() %>"><%=vo.getName() %></a>
					</td>
					<td><%=vo.getTel()%></td>
					<td><%=sdf.format(vo.getRegdate()) %></td>
				</tr>
				<%} //for%>
				<!-- 회원 내용 반복 끝 -->
				<%} //if%>
			</tbody>
		</table>
	</div>
	<div class="divPage">
		<!-- 페이지 번호 추가 -->
		<!-- 이전 블럭으로 이동 -->
		<%if(firstPage>1){%>
		<a href="list.jsp?currentPage=<%=firstPage-1 %>">
			<img src="../images/first.JPG">
		</a>
	<%} %>					
						
	<!-- [1][2][3][4][5][6][7][8][9][10] -->
	<%for(int i=firstPage;i<=lastPage;i++){ 
		if(i>totalPage) break;
		
		
		 if(i == currentPage){ %>
         <span style="color: blue;font-weight: bold;font-size: 1em"><%=i%></span>
   <%   }else{   %>
         <a href="list.jsp?currentPage=<%=i%>&searchKeyword=<%=keyword%>&searchCondition=<%=condition %>">[<%=i %>]</a>
   <%   }//if      
	}//for %>
	
	<!-- 다음 블럭으로 이동 -->		
	<%if(lastPage< totalPage){%>
		<a href="list.jsp?currentPage=<%=lastPage+1 %>">
			<img src="../images/last.JPG">
		</a>
	<%} %>				
	<!--  페이지 번호 끝 -->
	</div>
	<div class="divSearch">
		<form name="frmSearch" method="post" action="list.jsp">
			<select name="searchCondition">
				<option value="name"
				<%if("name".equals(condition)){%>
            		selected="selected"
            	<% }%>            	
            >이름</option>
				<option value="tel"
				<%if("tel".equals(condition)){%>
            		selected="selected"
            	<% }%> 
            >전화번호</option>
			</select> 
			<input type="text" name="seachKeyword" title="검색어 입력" 
			value="<%=keyword %>"> 
			<input type="submit" value="검색">
		</form>
	</div>
	<div class="divBtn">
		<a href="register.jsp" id="register">회원등록</a>
	</div>

</body>
</html>