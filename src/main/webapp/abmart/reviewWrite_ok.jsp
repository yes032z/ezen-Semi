<%@page import="com.semi.reviewdetail.model.ReviewDetailVO"%>
<%@page import="com.semi.reviewdetail.model.ReviewDetailService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.semi.review.model.ReviewVO"%>
<%@page import="com.semi.review.model.ReviewService"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
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
	List<String> fileNameArr=new ArrayList<>();
	List<Long> fileSizeArr=new ArrayList<>();
	List<String> originalFileNameArr=new ArrayList<>();

	String upDir="images";
	String saveDir=config.getServletContext().getRealPath(upDir);
	saveDir=application.getRealPath(upDir);
	saveDir="D:\\lecture\\workspace_list\\web_semi_ws\\semiProject\\src\\main\\webapp\\images";
	out.println("업로드 경로: "+saveDir);
	
	int maxSize= 10*1024*1024; //10메가
	String encoding="utf-8";
	
	try{
		//동일한 이름이 있는 경우 이름 변경 abc.txt => abc1.txt
		DefaultFileRenamePolicy policy=new DefaultFileRenamePolicy();
		
		MultipartRequest multi
			=new MultipartRequest(request, saveDir, maxSize, encoding, policy);
		out.println("파일 업로드 완료");
		
		//업로드된 파일의 정보 읽어오기
		Enumeration fileNames= multi.getFileNames();
		
		
		
		String fileName="";
		long fileSize=0;
		String originalFileName="";
		while(fileNames.hasMoreElements()){
			//여러개 파일을 업로드하는 경우 파일이름 목록을 리턴
			String fName=(String)fileNames.nextElement();
			fileNameArr.add(fName);
			//업로드된 파일의 이름(변경된 파일의 이름)
			fileName=multi.getFilesystemName(fName);
			//변경전 원래 파일 이름
			originalFileName= multi.getOriginalFileName(fName);
			originalFileNameArr.add(originalFileName);
			File myFile= multi.getFile(fName);
			if(myFile!=null){ //파일이 첨부된 경우만
				fileSize=myFile.length();
				fileSizeArr.add(fileSize);
			}
		}//while
			
		//1. post방식 요청 파라미터 읽어오기(한글인코딩 위에서 완료)
		String reviewgrade=multi.getParameter("reviewgrade");
		String reviewbody=multi.getParameter("reviewbody");
		String no=(String)session.getAttribute("no");
		String pdno=multi.getParameter("pdno");
		
		//2. db작업
		ReviewService reviewService=new ReviewService();
		ReviewVO reviewVo=new ReviewVO();
		
		reviewVo.setReviewbody(reviewbody);
		reviewVo.setReviewgrade(Integer.parseInt(reviewgrade));
		reviewVo.setNo(Integer.parseInt(no));
		
		int cnt=reviewService.insertReview(reviewVo);
		
		int reviewno=reviewService.reviewFindNo(Integer.parseInt(no), Integer.parseInt(pdno));
		
		
		ReviewDetailService reviewDetailService=new ReviewDetailService();
		ReviewDetailVO reviewDetailVo= new ReviewDetailVO();
		
		reviewDetailVo.setReviewno(reviewno);
		for(int i=0;i<fileNameArr.size();i++){
			reviewDetailVo.setFilename(fileNameArr.get(i));
			reviewDetailVo.setFilesize(fileSizeArr.get(i));
			reviewDetailVo.setOriginalfilename(originalFileNameArr.get(i));
			
			int cnt2=reviewDetailService.insertReviewDetail(reviewDetailVo, fileNameArr.size());
		}
		//3. 결과처리
		if(cnt>0){%>
			<script type="text/javascript">
			alert("리뷰 등록이 완료되었습니다.");
			self.close();
			</script>
		<%}else{%>
			<script type="text/javascript">
			alert("리뷰 등록에 실패했습니다.");
			histroy.back();
			</script>
		<%}
	}catch(SQLException e){
		e.printStackTrace();
	}catch(IOException e){
		e.printStackTrace();
		String str="<script type='text/javascript'>";
		str += "alert('10M 이상의 파일은 업로드할 수 없습니다.');";
		str += "history.go(-1);</script>";
		out.print(str);
	}
%>
</body>
</html>