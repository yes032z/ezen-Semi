<%@page import="com.myhw.book2.model.Book2VO"%>
<%@page import="com.myhw.book2.model.Book2DAO"%>
<%@page import="java.io.File"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
	//- register.jsp 에서 등록버튼 클릭하여 post방식 서브밋(이동)됨
	String upPath = "/upload";
	//업로드할 폴더의 절대경로
	String saveDir = config.getServletContext().getRealPath(upPath);
	System.out.println("saveDir="+saveDir);

	saveDir="D:\\lecture\\workspace_list\\jsp_ws\\myhw\\src\\main\\webapp\\upload";
	System.out.println("test saveDir="+saveDir);
	
	int maxSize= 2* 1024* 1024;
	String encoding ="utf-8";
	
	
	try{
	DefaultFileRenamePolicy policy=new DefaultFileRenamePolicy();
	
	MultipartRequest multi
		=new MultipartRequest(request, saveDir, maxSize, encoding, policy);
	System.out.println("파일 업로드 완료!");
	
	//1 요청 파라미터 읽어오기
	String fileName = multi.getFilesystemName("upfile");
	
	long fileSize=0;
	String originalFileName ="";
	if(fileName!=null){
		File myFile = multi.getFile("upfile");
		
		fileSize= myFile.length();
		originalFileName = multi.getOriginalFileName("upfile");
	}//if
	
	String title=multi.getParameter("title");
	String price=multi.getParameter("price");
	String publisher=multi.getParameter("publisher");
	
	
	//2 db작업
	Book2DAO book2Dao=new Book2DAO();
	Book2VO vo=new Book2VO();
	
	vo.setTitle(title);
	vo.setPrice(Integer.parseInt(price));
	vo.setPublisher(publisher);
	vo.setFileName(fileName);
	vo.setFileSize(fileSize);
	vo.setOriginalFileName(originalFileName);
	
	int cnt=book2Dao.insertBook2(vo);
	
	//3 결과처리	
		if(cnt>0){%>
		<script type="text/javascript">
			alert("책 등록 성공");
			location.href="list.jsp";
		</script>	
		<%}else{%>
		<script type="text/javascript">
			alert("책 등록 실패");
			history.back();	
		</script>
		<%}
	}catch(SQLException e){
		e.printStackTrace();
	}catch(IOException e){
		e.printStackTrace();
	}
%>
</body>
</html>