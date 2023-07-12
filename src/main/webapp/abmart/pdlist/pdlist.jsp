<%@page import="com.semi.common.PagingVO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.semi.product.model.ProductVO"%>
<%@page import="java.util.List"%>
<%@page import="com.semi.product.model.ProductService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../inc/top.jsp"%>
<%
	String brand=request.getParameter("brand");
	String kind=request.getParameter("kind");
	String grade=request.getParameter("grade");
	String price=request.getParameter("price");
	
	if(brand==null || brand.isEmpty()){
		brand="";
	}
	if(kind==null || kind.isEmpty()){
		kind="";
	}
	if(grade==null || grade.isEmpty()){
		grade="";
	}
	if(price==null || price.isEmpty()){
		price="";
	}
	
	List<ProductVO> list=null;
	try{
		list=pdService.selectPdAll(brand, kind,grade,price);
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	DecimalFormat df=new DecimalFormat("#,###");
	
	int currentPage=1;
	String cp=request.getParameter("currentPage");
	if(cp!=null && !cp.isEmpty()){
		currentPage=Integer.parseInt(cp);
	}
	int totalRecord=list.size();
	int pageSize=5;
	int blockSize=10;
	PagingVO pagingVo=new PagingVO(currentPage,totalRecord,pageSize,blockSize);
	
%>
<script type="text/javascript">
	$(function() {
		$('button[name=brand]').click(function(){
			var brand=$(this).html();
			
			location.href="pdlist.jsp?brand="+brand;
		});
		
		$('button[name=kind]').click(function(){
			var kind=$(this).html();
			
			location.href="pdlist.jsp?kind="+kind;
		});
		
	});
</script>
<div>
	<section class="py-5">
		<aside style="width: 300px; height: 600px; float: left; margin-left: 150px;">
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
			<div id="searchSort">
				<span class="leftSort">총 </span><span class="leftSort"
					name="searchqty"><%=list.size() %></span><span class="leftSort">개의 상품이
					있습니다.</span><span class="rightSort" id="span2">&nbsp;|&nbsp;<a
					<%if(brand!=null && !brand.isEmpty()){ %>
						href="pdlist.jsp?brand=<%=brand%>&price=price"
					<%}else if(kind!=null && !kind.isEmpty()){ %>
						href="pdlist.jsp?kind=<%=kind%>&price=price"
					<%}else{%>
						href="pdlist.jsp?price=price"
					<%}%>>가격낮은순</a></span>
					<span class="rightSort" id="span1">&nbsp;<a 
					<%if(brand!=null && !brand.isEmpty()){ %>
						href="pdlist.jsp?brand=<%=brand%>&grade=grade"
					<%}else if(kind!=null && !kind.isEmpty()){ %>
						href="pdlist.jsp?kind=<%=kind%>&grade=grade"
					<%}else{%>
						href="pdlist.jsp?grade=grade"
					<%}%>>평점높은순</a>&nbsp;
				</span>
			</div>
			<div style="width: 1000px;float: right;margin-left: 500px;">
				<hr style="clear: both;">
			
			<%
				int num=pagingVo.getNum();
				int curPos=pagingVo.getCurPos();
				for(int i=0;i<list.size();i++){
					if(num<1) break;
					ProductVO vo=list.get(curPos++);
					num--;
					%>
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
						</div>
					</div>
				<%} %>
		</div>
		<div class="div3">
			   <%if(pagingVo.getFirstPage()>1){%>
			      <a href="<%=request.getContextPath()%>/abmart/pdlist/pdlist.jsp?currentPage=<%=pagingVo.getFirstPage()-1%>">
			         <img src="<%=request.getContextPath() %>/images/first.JPG">
			      </a>   
			   <%} %>
			                  
			   <!-- [1][2][3][4][5][6][7][8][9][10] -->
			   <%for(int i=pagingVo.getFirstPage();i<=pagingVo.getLastPage();i++){
			      	if(i>pagingVo.getTotalPage()) break;
			   %>
			   		<%if(i==pagingVo.getCurrentPage()){%>
			            <span style="color: blue;font-weight:bold;font-size:1.1em"><%=i %></span>
			     	<%}else{ %>
			      		<a href="<%=request.getContextPath() %>/abmart/pdlist/pdlist.jsp?currentPage=<%=i%>">[<%=i %>]</a>
			     	<%} %>
			   <%}//for %>
			   
			   <!-- 다음 블럭으로 이동 -->
			   <%if(pagingVo.getLastPage()< pagingVo.getTotalPage()){%>
			      <a href="<%=request.getContextPath()%>/abmart/pdlist/pdlist.jsp?currentPage=<%=pagingVo.getLastPage()+1%>">
			         <img src="<%=request.getContextPath() %>/images/last.JPG">
			      </a>   
   				<%} %>
		</div>
	</section>
	<%@include file="../../inc/bottom.jsp"%>