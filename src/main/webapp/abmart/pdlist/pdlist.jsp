<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../inc/top.jsp"%>

<script type="text/javascript">
	$(function() {
		$('#alink1').addClass('active');
		$('#alink1').click(function() {
			$(this).addClass('active');
			$('#alink2').removeClass('active');
			$(this).text('선택');
			$('#alink2').text('미선택');
		});
		$('#alink2').click(function() {
			$(this).addClass('active');
			$('#alink1').removeClass('active');
			$(this).text('선택');
			$('#alink1').text('미선택');
		});
	});
</script>

<div>
<section class="py-5">
	
	<aside style="width:300px;height: 400px;float:left;margin-left:150px;">
		<div>
			<hr>
			<h4>브랜드</h4>
			<hr>
			<div>
				<button type="button" class="btn btn-secondary" style="float:left;margin-left: 50px;">뉴발란스</button>
				<button type="button" class="btn btn-secondary" style="float:right;margin-right: 50px">아이다스</button><br><br>
				<button type="button" class="btn btn-secondary" style="float:left;margin-left: 50px;">캔버스</button>
				<button type="button" class="btn btn-secondary" style="float:right;margin-right: 50px">반스</button><br><br>
				<button type="button" class="btn btn-secondary" style="float:left;margin-left: 50px;">나이키</button>
				<button type="button" class="btn btn-secondary" style="float:right;margin-right: 50px">필라</button><br><br>
			</div>
			<hr>
			<h4>종류</h4>
			<hr>
			<div>
				<button type="button" class="btn btn-secondary">운동화</button><br><br>
				<button type="button" class="btn btn-secondary">슬리퍼</button><br><br>
				<button type="button" class="btn btn-secondary">샌들</button><br><br>
			</div>
		</div>
	</aside>
<div id="pdbox">
	<div id="fiteradd">
		<button type="button" class="btn btn-secondary" style="float:left;">필터 초기화</button>
	</div>
	<div id="searchSort">
		<span class="leftSort">총 </span><span class="leftSort" id="searchqty">10</span><span class="leftSort">개의 상품이 있습니다.</span><span class="rightSort" id="span2">&nbsp;|&nbsp;<a href="#">가격순</a></span>  <span class="rightSort" id="span1">&nbsp;<a href="#">평점순</a>&nbsp;</span> 
	</div>
	<div class="div1">
		<hr style="clear:both;">
		<div class="col mb-5">
			<div class="card h-100">
				<!-- Sale badge-->
				<div class="badge bg-dark text-white position-absolute"
					style="top: 0.5rem; right: 0.5rem">Sale</div>
				<!-- Product image-->
				<img class="card-img-top"
					src="https://image.a-rt.com/art/product/2023/03/11678_1678179755820.jpg?shrink=388:388"
					alt="..." />
				<!-- Cart ins-->
				<div class="card-body p-4">
					<div class="text-center">
						<!-- Product name-->
						<h5 class="fw-bolder">나이키</h5>
						<!-- 상품 이름-->
						<p>우먼스 나이키 코트 레거시 캔버스</p>
						<!-- 상품 별점-->
						<div class="d-flex justify-content-center small text-warning mb-2">
							<div class="bi-star-fill"></div>
							<div class="bi-star-fill"></div>
							<div class="bi-star-fill"></div>
							<div class="bi-star-fill"></div>
							<div class="bi-star-fill"></div>
						</div>
						<!-- Product price-->
						<span class="text-muted text-decoration-line-through">69,000원</span>
						47,000원[31%]
					</div>
				</div>
				<!-- Product actions-->
				<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
					<div class="text-center">
						<a class="btn btn-outline-dark mt-auto" href="#">장바구니</a>
					</div>
				</div>
			</div>
		</div>
		<div class="col mb-5">
			<div class="card h-100">
				<!-- Sale badge-->
				<div class="badge bg-dark text-white position-absolute"
					style="top: 0.5rem; right: 0.5rem">Sale</div>
				<!-- Product image-->
				<img class="card-img-top"
					src="https://image.a-rt.com/art/product/2023/03/11678_1678179755820.jpg?shrink=388:388"
					alt="..." />
				<!-- Cart ins-->
				<div class="card-body p-4">
					<div class="text-center">
						<!-- Product name-->
						<h5 class="fw-bolder">나이키</h5>
						<!-- 상품 이름-->
						<p>우먼스 나이키 코트 레거시 캔버스</p>
						<!-- 상품 별점-->
						<div class="d-flex justify-content-center small text-warning mb-2">
							<div class="bi-star-fill"></div>
							<div class="bi-star-fill"></div>
							<div class="bi-star-fill"></div>
							<div class="bi-star-fill"></div>
							<div class="bi-star-fill"></div>
						</div>
						<!-- Product price-->
						<span class="text-muted text-decoration-line-through">69,000원</span>
						47,000원[31%]
					</div>
				</div>
				<!-- Product actions-->
				<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
					<div class="text-center">
						<a class="btn btn-outline-dark mt-auto" href="#">장바구니</a>
					</div>
				</div>
			</div>
		</div>
		<div class="col mb-5">
			<div class="card h-100">
				<!-- Sale badge-->
				<div class="badge bg-dark text-white position-absolute"
					style="top: 0.5rem; right: 0.5rem">Sale</div>
				<!-- Product image-->
				<img class="card-img-top"
					src="https://image.a-rt.com/art/product/2023/03/11678_1678179755820.jpg?shrink=388:388"
					alt="..." />
				<!-- Cart ins-->
				<div class="card-body p-4">
					<div class="text-center">
						<!-- Product name-->
						<h5 class="fw-bolder">나이키</h5>
						<!-- 상품 이름-->
						<p>우먼스 나이키 코트 레거시 캔버스</p>
						<!-- 상품 별점-->
						<div class="d-flex justify-content-center small text-warning mb-2">
							<div class="bi-star-fill"></div>
							<div class="bi-star-fill"></div>
							<div class="bi-star-fill"></div>
							<div class="bi-star-fill"></div>
							<div class="bi-star-fill"></div>
						</div>
						<!-- Product price-->
						<span class="text-muted text-decoration-line-through">69,000원</span>
						47,000원[31%]
					</div>
				</div>
				<!-- Product actions-->
				<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
					<div class="text-center">
						<a class="btn btn-outline-dark mt-auto" href="#">장바구니</a>
					</div>
				</div>
			</div>
		</div>
		<div class="col mb-5">
			<div class="card h-100">
				<!-- Sale badge-->
				<div class="badge bg-dark text-white position-absolute"
					style="top: 0.5rem; right: 0.5rem">Sale</div>
				<!-- Product image-->
				<img class="card-img-top"
					src="https://image.a-rt.com/art/product/2023/03/11678_1678179755820.jpg?shrink=388:388"
					alt="..." />
				<!-- Cart ins-->
				<div class="card-body p-4">
					<div class="text-center">
						<!-- Product name-->
						<h5 class="fw-bolder">나이키</h5>
						<!-- 상품 이름-->
						<p>우먼스 나이키 코트 레거시 캔버스</p>
						<!-- 상품 별점-->
						<div class="d-flex justify-content-center small text-warning mb-2">
							<div class="bi-star-fill"></div>
							<div class="bi-star-fill"></div>
							<div class="bi-star-fill"></div>
							<div class="bi-star-fill"></div>
							<div class="bi-star-fill"></div>
						</div>
						<!-- Product price-->
						<span class="text-muted text-decoration-line-through">69,000원</span>
						47,000원[31%]
					</div>
				</div>
				<!-- Product actions-->
				<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
					<div class="text-center">
						<a class="btn btn-outline-dark mt-auto" href="#">장바구니</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</section>
</div>
<%@include file="../../inc/bottom.jsp"%>