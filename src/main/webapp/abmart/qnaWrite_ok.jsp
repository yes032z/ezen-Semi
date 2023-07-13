<%@page import="java.sql.SQLException"%>
<%@page import="com.semi.qna.model.QnAVO"%>
<%@page import="com.semi.qna.model.QnAService"%>
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
	request.setCharacterEncoding("utf-8");	

	int no=(int)session.getAttribute("no");
	String pdno=request.getParameter("pdno");
	String qnabody=request.getParameter("qnabody");
	String qnaview=request.getParameter("qnaview");
	
	if(qnaview!=null){
		qnaview="Y";
	}else{
		qnaview="N";
	}
	
	QnAService qnaService=new QnAService();
	QnAVO vo=new QnAVO();
	vo.setNo(no);
	vo.setPdno(Integer.parseInt(pdno));
	vo.setQnabody(qnabody);
	vo.setQnaview(qnaview);
	
	try{
		int cnt=qnaService.insertQnA(vo);
		
		if(cnt>0){%>
			<script type="text/javascript">
				alert("QnA가 등록되었습니다.");
				self.close();
			</script>
			<%
		}else{%>
			<script type="text/javascript">
				alert("QnA 등록실패.");
				history.back();
			</script>
			<%
		}
		
	}catch(SQLException e){
		e.printStackTrace();
	}
%>
</body>
</html>