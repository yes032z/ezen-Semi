<%@page import="com.semi.product.model.ProductVO"%>
<%@page import="com.semi.product.model.ProductService"%>
<%@page import="com.semi.review.model.ReviewService"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.semi.review.model.ReviewDAO"%>
<%@page import="com.semi.review.model.ReviewVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.ckeditor.com/4.22.1/standard/ckeditor.js"></script>
<script type="text/javascript" src="../js/jquery-3.7.0.min.js"></script>
<meta charset="UTF-8">
<%
String pdno = request.getParameter("pdno");
String reviewno = request.getParameter("reviewno");

	boolean isEdit = false;
	String pageTitle = "", btLabel = "";
	if (reviewno != null && !reviewno.isEmpty()) {
		isEdit = true; //파라미터 reviewno가 있는경우 리뷰수정
	
		pageTitle = "리뷰 수정하기";
		btLabel = "수정";
	} else { //리뷰등록
		pageTitle = "리뷰 등록하기";
		btLabel = "등록";
	}

//2
//리뷰수정인 경우만 db에서 데이터 조회해서 출력해준다
ReviewVO reviewVo = new ReviewVO();
ProductVO pdVo = new ProductVO();
if (isEdit) {
	ReviewService reviewService = new ReviewService();

	try {
		int cnt = reviewService.updateReview(reviewVo);
	} catch (SQLException e) {
		e.printStackTrace();
	}
} else {
	ProductService pdService = new ProductService();
	pdVo = pdService.selectPdByNo(Integer.parseInt(pdno));
}

String reviewbody = reviewVo.getReviewbody();
String reviewgrade = Integer.toString(reviewVo.getReviewgrade()); ///????

if (reviewbody == null)
	reviewbody = "";
if (reviewgrade == null)
	reviewgrade = "";
%>
<title><%=pageTitle%></title>
<style type="text/css">
.star-rating {
	border: none;
	display: flex;
	flex-direction: row-reverse;
	font-size: 30px;
	justify-content: space-around;
	text-align: center;
	width: 150px;
}

.star-rating input {
	display: none;
}

.star-rating label {
	color: #ccc;
	cursor: pointer;
}

.star-rating :checked ~ label, .star-rating label:hover, .star-rating label:hover 
	~ label {
	color: red;
}

#reviewbody {
	width: 500px;
	height: 300px;
	background: #eee;
	border: 1px solid gray;
	font-size: 17px;
}

.center {
	text-align: center;
}
</style>
<script type="text/javascript">
	$(function() {
		CKEDITOR.replace('reviewbody');
		$('input[name=rating]').click(function() {
			var reviewgrade=$('input[name=rating]:checked').val();
			$('.score').show();
			$('.score').find('span').text(reviewgrade);
			$('input[name=reviewgrade]').val(reviewgrade);
		});

		$('input[type=button]').click(function() {
			if (confirm('리뷰 등록을 취소하시겠습니까?')) {
				self.close();
			}
			;
		});

		$('input[type=submit]').click(function() {
			var reviewbody = CKEDITOR.instances.reviewbody.getData();
			var result=reviewbody.replace(/<\/?p>/gi, '');
			CKEDITOR.instances.reviewbody.setData(result);
			if (!$('input[name=rating]:checked').val()) {
				alert('별점을 체크해주세요.');
				return false;
			}
			if (result.length < 5) {
				alert('5글자 이상 입력 바랍니다.');
				return false;
			}

		});

	});
</script>
</head>
<body>
	<section>
		<h3>상품명</h3>
		<hr>
		<img src="../images/<%=pdVo.getFilename()%>" alt="신발이미지" width="150px"
			height="150px"> <span><%=pdVo.getPdname()%></span>
		<hr>
		<article>
			<h3>리뷰 작성하기</h3>
			<hr>
			<h4>상품의 별점은 몇점인가요?</h4>
			<form name="frmWrite" method="post" enctype="multipart/form-data"
				<%if (!isEdit) {%> 
					action="reviewWrite_ok.jsp" 
				<%} else {%>
					action="edit_ok.jsp" 
				<%}%>>
				<input type="hidden" name="reviewgrade" value="" />
				<input type="hidden" name="pdno" value="<%=pdno %>" />
				<div class="star-rating">
					<input type="radio" id="5-stars" name="rating" value="5" />
					<label for="5-stars" class="star">&#9733;</label>
					<input type="radio" id="4-stars" name="rating" value="4" />
					<label for="4-stars" class="star">&#9733;</label>
					<input type="radio" id="3-stars" name="rating" value="3" />
					<label for="3-stars" class="star">&#9733;</label>
					<input type="radio" id="2-stars" name="rating" value="2" />
					<label for="2-stars" class="star">&#9733;</label>
					<input type="radio" id="1-star" name="rating" value="1" />
					<label for="1-star" class="star">&#9733;</label>
				</div>
				<p class="score" style="display: none">
					<span></span>점을 주셨네요!<br> 상품에 대한 상세후기를 작성해주세요.
				</p>
				<textarea id="reviewbody" name="reviewbody"><%=reviewbody%></textarea>
				<br> <label for='image'>사진 첨부</label><br> 
				<input for='image' type="file"name="upfile1"/><br>
				<input for='image' type="file" name="upfile2"/><br>
				<input for='image' type="file" name="upfile3"/><br>
				<br>
				<div class="center">
					<input type="submit" value="<%=btLabel%>" />
					<input type="Button"value="취소" />
				</div>
			</form>
		</article>
	</section>
</body>
</html>