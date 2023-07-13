<%@page import="java.text.DecimalFormat"%>
<%@page import="com.semi.view.model.ViewVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp" %>
<%@ include file="../../inc/mypagenav.jsp" %>
<link href="../../css/mypage.css" rel="stylesheet" type="text/css">
<jsp:useBean id="ODService" class="com.semi.orderdetail.model.OrderdetailService" scope="session"></jsp:useBean>
<jsp:useBean id="favService" class="com.semi.favoritepd.model.FavoritePdService" scope="session"></jsp:useBean>
<jsp:useBean id="vo" class="com.semi.view.model.ViewVO" scope="page"></jsp:useBean>
<%
	String id=(String)session.getAttribute("id");
	String startDate=null;
	String lastDate=null;
	
	List<ViewVO> list=null;
	List<ViewVO> list3=null;
	try{
		list=ODService.selectAll(id, startDate, lastDate);
		list3=favService.select4FavoriteByid(id);
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	int Delcompleted=list.size();
	DecimalFormat df=new DecimalFormat("#,###");
	
%>
<script type="text/javascript" src="../../js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#orderinfo-second-last').find('a').text(<%=Delcompleted %>);
	});
</script>
<article id="mypage">
	<div class="orderinfo">
		<div id="orderinfo-first">최근 주문내역</div>
		<div id="orderinfo-second">
			<div>
				<a href="orderDetail.jsp">0</a><span class="gt">&gt;</span><br>입금대기
			</div>
			<div>
				<a href="orderDetail.jsp">0</a><span class="gt">&gt;</span><br>결제완료
			</div>
			<div>
				<a href="orderDetail.jsp">0</a><span class="gt">&gt;</span><br>상품준비중
			</div>
			<div>
				<a href="orderDetail.jsp">0</a><span class="gt">&gt;</span><br>배송중<br>픽업준비완료
			</div>
			<div id="orderinfo-second-last">
				<a href="orderDetail.jsp">0</a><br>배송<br>수령완료
			</div>
		</div>
	</div>
	
	<div class="orderinfo" id="orderinfo2">
		<div id="orderinfo-first">최근 본 상품
		<span class="exploreMore">나의 최근 조회 상품입니다.</span>		
		</div>
<script type="text/javascript">
const storedData = localStorage.getItem('products');
let storedProducts = storedData ? JSON.parse(storedData) : [];

if (storedProducts.length === 0) {
  document.write('<div class="mypagerow">최근 본 상품이 없습니다.</div>');
}else {
  for (let i = 0; i < storedProducts.length; i++) {
    const product = storedProducts[i];
    const values = Object.values(product);

    const chunks = [];
    for (let j = 0; j < values.length; j += 5) {
      const chunk = values.slice(j, j + 5);
      chunks.push(chunk);
    }
	
    for (let k = 0; k < chunks.length; k++) {
    const chunk = chunks[k];
    const [pdno, pdname, filename, brand, price] = chunk;

    document.write('<a href="../pddetail/pdDetail.jsp?pdno=' + pdno + '">');
    document.write('<div class="col mb-5">');
    document.write('<div class="card h-100">');
    document.write('<img class="card-img-top" src="../../images/' + filename + '" alt="..." />');
    document.write('<div class="card-body p-4">');
    document.write('<div class="text-center">');
    document.write('<h5 class="fw-bolder">' + brand + '</h5>');
    document.write('<p>' + pdname + '</p>');
    document.write('<div class="d-flex justify-content-center small text-warning mb-2">');
    document.write('<div class="bi-star-fill"></div>');
    document.write('<div class="bi-star-fill"></div>');
    document.write('<div class="bi-star-fill"></div>');
    document.write('<div class="bi-star-fill"></div>');
    document.write('<div class="bi-star-fill"></div>');
    document.write('</div>');
    document.write('<span class="text-muted text-decoration-line-through">' + price + '원</span>');
    document.write('</div>');
    document.write('</div>');
    document.write('</a>');
    document.write('<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">');
    document.write('<div class="text-center">');
    document.write('</div>');
    document.write('</div>');
    document.write('</div>');
    document.write('</div>');
 	 }
  }
}
</script>
	<div class="orderinfo">
		<div id="orderinfo-first">찜한 상품
		<a href="<%=request.getContextPath() %>/abmart/mypage/wishList.jsp"><span class="exploreMore">더보기 ▶</span></a>
		</div>
		<%if(list3==null || list3.isEmpty()){ %>
		<div class="mypagerow">내가 찜한 상품이 없습니다.</div>
		<%}else{%>
			<%for(int i=0;i<list3.size();i++){
					vo=list3.get(i);%>
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
							</div>
						</div>
					</div>
				</div>
		<%}//for %>
	<%}//if %>
	</div>
</article>   
<%@ include file="../../inc/bottom.jsp" %>