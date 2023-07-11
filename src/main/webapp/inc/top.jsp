<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="pdService" class="com.semi.product.model.ProductService" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html lang="ko">
<head>
<style type="text/css">
ul.navbar-nav.me-auto.mb-2.mb-lg-0.ms-lg-4 {
    font-size: 15px;
}

form.frlist2 {
    width: 494px;
}
button.btn.btn-outline-dark {
 	width: 120px;
    margin-left: 39px;
}
.container.px-4.px-lg-5 {
    width: 100%;
}

input.form-control.mr-sm-2 {
    width: 400px;
    float: left;
}
</style>
<meta charset="utf-8" />
    <head>

<%
	String j_userid=(String)session.getAttribute("id");
	boolean j_isLogin=false;
	if(j_userid!=null && !j_userid.isEmpty()){  //세션에 값이 있으면 로그인된 경우
		j_isLogin=true;
	}
%>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title> Main Test </title>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="<%=request.getContextPath()%>/js/scripts.js"></script>
    
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" /> -->
        <link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet" />

        <link href="<%=request.getContextPath()%>/css/pdstyle.css" rel="stylesheet"/>

        <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.7.0.min.js"></script>
    </head>
    <body>
    <!-- 한글 인코딩이 깨져서 영어로 표시  -->
        <!-- Navigation--> 
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="<%=request.getContextPath()%>/index.jsp">AB-MART</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                      <%if(j_isLogin){ %>
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="<%=request.getContextPath()%>/abmart/member/logout.jsp">로그아웃</a></li>
                        <%}else{ %>
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="<%=request.getContextPath()%>/abmart/member/login.jsp">로그인</a></li>
                        <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/abmart/member/register.jsp">회원가입</a></li>
                        <%} %>                 
	                    <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/abmart/mypage/mypage.jsp">마이페이지</a></li>                        
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">메뉴</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#!">모든 상품</a></li>
                                <li><hr class="dropdown-divider">브랜드</li>
								<li><a class="dropdown-item" href="#!">나이키</a></li>
								<li><a class="dropdown-item" href="#!">아디다스</a></li>
								<li><a class="dropdown-item" href="#!">캔버스</a></li>
								<li><a class="dropdown-item" href="#!">반스</a></li>
								<li><a class="dropdown-item" href="#!">뉴발란스</a></li>
								<li><a class="dropdown-item" href="#!">필라</a></li>
								<li><hr class="dropdown-divider">종류</li>
								<li><a class="dropdown-item" href="#1">운동화</a></li>
								<li><a class="dropdown-item" href="#1">슬리퍼</a></li>
								<li><a class="dropdown-item" href="#1">샌들</a></li>
                            </ul>
                        </li>                         
                    </ul>

					<!-- 검색창  -->
					<!-- 값 입력해서 sql문에서 like로 일치하는거 찾기  -->
					<form class ="frlist2" action="<%=request.getContextPath()%>/abmart/pdlist//pdlist.jsp">
				    <input class="form-control mr-sm-2" id ="searchpd" type="search" placeholder="검색어를 입력해주세요" aria-label="Search" >
				    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
				    </form>
					<!-- 장바구니 버튼-->		
		            <form class="d-flex" action="<%=request.getContextPath()%>/abmart/basket/ShoppingBasket2.jsp">
		                <button class="btn btn-outline-dark" type="submit" style="width:120px;height:65px"> 
		                    <i class="bi-cart-fill me-1"></i>장바구니
		                    <span class="badge bg-dark text-black ms-1 rounded-pill">0</span> 
		                </button>
		            </form>
                </div>
            </div>
        </nav>   
