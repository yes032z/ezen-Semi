<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.semi.product.model.ProductVO"%>
<%@page import="java.util.List"%>
<%@page import="com.semi.product.model.ProductService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../inc/top.jsp"%>
<jsp:useBean id="pdService" class="com.semi.product.model.ProductService" scope="session"></jsp:useBean>
<%
	String brand=request.getParameter("brand");
	String kind=request.getParameter("kind");

	if(brand==null || brand.isEmpty()){
		brand="";
	}
	if(kind==null || kind.isEmpty()){
		kind="";
	}
	
	List<ProductVO> list=null;
	try{
		list=pdService.selectPdAll(brand, kind);
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	DecimalFormat df=new DecimalFormat("#,###");
%>
<script type="text/javascript">
	$(function() {
		$('button[name=brand]').click(function(){
			var brand=$(this).html();
			
			$('#filter').before("<button class='btn size' id='del' style='float:left'>"+brand+"</button>");
			location.href="pdlist.jsp?brand="+brand;
		});
		
		$('button[name=kind]').click(function(){
			var kind=$(this).html();
			
			$('#filter').before("<button class='btn size' id='del' style='float:left'>"+kind+"</button>");
			location.href="pdlist.jsp?kind="+kind;
		});
		
		$(document).on('click', '#del', function() {
			 $(this).remove();
		});
		
		$('#filter').click(function(){
			$(this).parent().find('*').not(this).remove();
		});
	});
</script>
<div>
	<section class="py-5">
		<!-- <div style="text-align: center">
		<div style="width: 1300px;">
			<ul class="nav nav-tabs">
				<li class="nav-item" style="width: 650px"><a class="nav-link "
					id="alink1" aria-current="page" href="#">선택</a></li>
				<li class="nav-item" style="width: 650px"><a class="nav-link "
					id="alink2" href="#">미선택</a></li>
			</ul>
		</div>
	</div> -->
		<aside
			style="width: 300px; height: 400px; float: left; margin-left: 150px;">
			<div>
				<hr>
				<h4>브랜드</h4>
				<hr>
				<div>
					<button name="brand" class="btn btn-secondary" id="newbalance"
						style="float: left; margin-left: 50px;">뉴발란스</button>
					<button name="brand" class="btn btn-secondary" id="adidas"
						style="float: right; margin-right: 50px">아디다스</button>
					<br>
					<br>
					<button name="brand" class="btn btn-secondary" id="canvas"
						style="float: left; margin-left: 50px;">캔버스</button>
					<button name="brand" class="btn btn-secondary" id="vans"
						style="float: right; margin-right: 50px">반스</button>
					<br>
					<br>
					<button name="brand" class="btn btn-secondary" id="nike"
						style="float: left; margin-left: 50px;">나이키</button>
					<button name="brand" class="btn btn-secondary" id="fila"
						style="float: right; margin-right: 50px">필라</button>
					<br>
					<br>
				</div>
				<hr>
				<h4>종류</h4>
				<hr>
				<div>
					<button type="button" name="kind" class="btn btn-secondary">운동화</button>
					<br>
					<br>
					<button type="button" name="kind" class="btn btn-secondary">슬리퍼</button>
					<br>
					<br>
					<button type="button" name="kind" class="btn btn-secondary">샌들</button>
					<br>
					<br>
				</div>
			</div>
		</aside>
		<div id="pdbox">
			<div id="fiteradd">
				<button class="btn btn-secondary" id="filter" style="float: left;">필터
					초기화</button>
			</div>
			<div id="searchSort">
				<span class="leftSort">총 </span><span class="leftSort"
					name="searchqty"><%=list.size() %></span><span class="leftSort">개의 상품이
					있습니다.</span><span class="rightSort" id="span2">&nbsp;|&nbsp;<a
					href="#">가격순</a></span> <span class="rightSort" id="span1">&nbsp;<a
					href="#">평점순</a>&nbsp;
				</span>
			</div>
			<div class="div1">
				<hr style="clear: both;">
				
			<%for(int i=0;i<list.size();i++){
					ProductVO vo=list.get(i);%>
				<a href="../pddetail/pdDetail.jsp?pdno=<%=vo.getPdno()%>">
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Sale badge-->
						<!-- <div class="badge bg-dark text-white position-absolute"
					style="top: 0.5rem; right: 0.5rem">Sale</div> -->
						<!-- Product image-->
						<img class="card-img-top" src="../../images/<%=vo.getFilename()%>" alt="..." />
						<!-- Cart ins-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 class="fw-bolder"><%=vo.getBrand() %></h5>
								<!-- 상품 이름-->
								<p><%=vo.getPdname() %></p>
								<!-- 상품 별점-->
								<div
									class="d-flex justify-content-center small text-warning mb-2">
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
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
									href="../basket/ShoppingBasket.jsp">장바구니</a>
							</div>
						</div>
					</div>
				</div>
			<%} %>
		</div>
	</section>
	<%@include file="../../inc/bottom.jsp"%>

<!-- 원래 상품 양식 
	<div class="col mb-5">
		<div class="card h-100">
			Sale badge
			<div class="badge bg-dark text-white position-absolute"
				style="top: 0.5rem; right: 0.5rem">Sale</div>
			Product image
			<img class="card-img-top"
				src="https://image.a-rt.com/art/product/2023/03/11678_1678179755820.jpg?shrink=388:388"
				alt="..." />
			Cart ins
			<div class="card-body p-4">
				<div class="text-center">
					Product name
					<h5 class="fw-bolder">나이키</h5>
					상품 이름
					<p>우먼스 나이키 코트 레거시 캔버스</p>
					상품 별점
					<div class="d-flex justify-content-center small text-warning mb-2">
						<div class="bi-star-fill"></div>
						<div class="bi-star-fill"></div>
						<div class="bi-star-fill"></div>
						<div class="bi-star-fill"></div>
						<div class="bi-star-fill"></div>
					</div>
					Product price
					<span class="text-muted text-decoration-line-through">69,000원</span>
					47,000원[31%]
				</div>
			</div>
			Product actions
			<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
				<div class="text-center">
					<a class="btn btn-outline-dark mt-auto"
						href="../basket/ShoppingBasket.jsp">장바구니</a>
				</div>
			</div>
		</div>
	</div>
</div> -->