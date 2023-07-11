<%@page import="java.sql.SQLException"%>
<%@page import="com.semi.product.model.ProductVO"%>
<%@page import="java.util.List"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>

<!-- Headerd이미지-->
<header class="bg-dark py-5">
	<
	<!-- 기존 배너 -->
	<!-- 	<!--  <div class="container px-5 px-lg-5 my-5">
			<div class="text-center text-white">
				<img class="card-img-top"
					src="https://image.a-rt.com//art/display/gs/contents/202306/20230626115213680.jpg?fitting=large|1920:600"
					alt="..." />
			</div>
		</div>   -->
	<div id="carouselExample" class="carousel slide">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img
					src="https://image.a-rt.com//art/display/gs/contents/202306/20230629143044736.jpg?fitting=large|1920:600"
					class="d-block w-100" alt="..." />
			</div>
			<div class="carousel-item">
				<img
					src="https://image.a-rt.com//art/display/gs/contents/202307/20230701104256906.jpg?fitting=large|1920:600"
					class="d-block w-100" alt="..." />
			</div>
			<div class="carousel-item">
				<img
					src="https://image.a-rt.com//art/display/gs/contents/202306/20230602100214370.jpg?fitting=large|1920:600"
					class="d-block w-100" alt="..." />
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExample" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExample" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>
</header>
<!-- Section-->
<%
	List<ProductVO> list=null;
	try{
		list=pdService.selectPdAll(null, null,null,null);
	}catch(SQLException e) {
		e.printStackTrace();
	}
	DecimalFormat df=new DecimalFormat("#,###");
%>
<section class="py-5">
	<div class="div1">
		<h1 class="leftSort">전체 상품</h1>
		<hr style="clear: both;">
		<%for(int i=0;i<list.size();i++){
			ProductVO vo=list.get(i);%>
		<a href="abmart/pddetail/pdDetail.jsp?pdno=<%=vo.getPdno()%>">
			<div class="col mb-5">
				<div class="card h-100">
					<!-- Product image-->
					<img class="card-img-top" src="images/<%=vo.getFilename()%>"
						alt="..." />
					<!-- Cart ins-->
					<div class="card-body p-4">
						<div class="text-center">
							<!-- Product name-->
							<h5 class="fw-bolder"><%=vo.getBrand() %></h5>
							<!-- 상품 이름-->
							<p><%=vo.getPdname() %></p>
							<!-- 상품 별점-->
							<div class="d-flex justify-content-center small text-warning mb-2">
							
							<%if(vo.getGrade()<2){ %>
								<div class="bi-star-fill"></div>
							<%}else if(vo.getGrade()<3){ %>
								<div class="bi-star-fill"></div>
								<div class="bi-star-fill"></div>
							<%}else if(vo.getGrade()<4){%>
								<div class="bi-star-fill"></div>
								<div class="bi-star-fill"></div>
								<div class="bi-star-fill"></div>
							<%}else if(vo.getGrade()<5){%>
								<div class="bi-star-fill"></div>							
								<div class="bi-star-fill"></div>							
								<div class="bi-star-fill"></div>							
								<div class="bi-star-fill"></div>							
							<%}else{%>
								<div class="bi-star-fill"></div>							
								<div class="bi-star-fill"></div>							
								<div class="bi-star-fill"></div>							
								<div class="bi-star-fill"></div>							
								<div class="bi-star-fill"></div>							
							<%} %>
							</div>
							<!-- Product price-->
							<span class="text-muted text-decoration-line-through"><%=df.format(vo.getPrice())%>원</span>
						</div>
					</div>
		</a>
		<!-- Product actions-->
		<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
			<div class="text-center">
				<a class="btn btn-outline-dark mt-auto"
					href="<%=request.getContextPath()%>/abmart/basket/ShoppingBasket.jsp">장바구니</a>
			</div>
		</div>
	</div>
	</div>
	<%} %>
	</div>

	</div>
</section>
<%@include file="../inc/bottom.jsp"%>
</body>
</html>


