<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
	
	String no=request.getParameter("no");
	boolean isEdit=false;
	String pageTitle="", btLabel="";
	if(no!=null && !no.isEmpty()){
		isEdit=true;  //리뷰수정
		
		pageTitle="리뷰 수정하기";
		btLabel="수정";
	}else{  //리뷰등록
		pageTitle="리뷰 등록하기";
		btLabel="등록";		
	}	
	
	//2
	//리뷰수정인 경우만 db에서 데이터 조회해서 출력해준다
	
%>
<title><%=pageTitle %></title>
<style type="text/css">
.star-rating {
  border:none;
  display:flex;
  flex-direction: row-reverse;
  font-size: 30px;
  justify-content: space-around;
  text-align: center;
  width: 150px;
}

.star-rating input {
  display:none;
}

.star-rating label {
  color:#ccc;
  cursor:pointer;
}

.star-rating :checked ~ label,
.star-rating label:hover,
.star-rating label:hover ~ label {
  color:red;
}
#reviewbody{
	width: 500px;
	height: 300px;
	background: #eee;
	border: 1px solid gray;
	font-size: 17px;
}

</style>
<script type="text/javascript" src="../js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('input[name=rating]').click(function(){
			$('.score').show();
			$('.score').find('span').text($('input[name=rating]:checked').val());
		});
		
		$('input[type=button]').click(function(){
			if(confirm('리뷰 등록을 취소하시겠습니까?')){
				location.href='#';
			};
		});
		
		$('input[type=submit]').click(function(){
			if(!$('input[name=rating]:checked').val()){
				alert('별점을 체크해주세요.');
				return false;
			}
			
		});
		
	});

</script>
</head>
<body>
	<nav>
		<dl id="leftNavi">
			<!-- category list -->
			<dt>마이페이지</dt>
			<dd><a href="#">주문조회</a></dd>
			<dd><a href="#">취소/환불</a></dd>
			<dd><a href="#">찜한상품</a></dd>
			<dd><a href="#">재고알림</a></dd>
			<dd><a href="#">상품QnA</a></dd>
			<dd><a href="#">상품리뷰</a></dd>
		</dl>
	</nav>
	<section>
	<article>
	<h3>리뷰 작성하기</h3><hr>
	<h4>상품의 별점은 몇점인가요?</h4>
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
	
	<p class="score" style="display: none"><span></span>점을 주셨네요!<br>
	상품에 대한 상세후기를 작성해주세요.</p>
<form name="frmWrite" method="post" enctype="multipart/form-data"
	<%if(!isEdit){%>
		action="write_ok.jsp"
	<%	}else{%>
		action="edit_ok.jsp"	
	<%	}	%>  >	  
	<textarea id="reviewbody" name="reviewbody"></textarea><br>
	<label for="upfile">사진 첨부</label>
    <input type="file" id="upfile" name="upfile" /> (최대 파일사이즈~~)<br><br>
	<div class="center">
           	<input type = "submit" value="<%=btLabel %>"/>
            <input type = "Button" value="취소" />         
        </div>
</form>	
	</article>
	</section>
</body>
</html>