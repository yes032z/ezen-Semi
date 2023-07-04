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
<style>
section {
	position: relative;
}

.col.mb-5 {
	width: 250px;
	height: 500px;
	float: left;
}

.div1 {
	width: 1000px;
	margin-left: 315px;
}

footer {
	clear: both;
}
</style>
<section class="py-5"
	style="text-align: center; margin: 0 auto;width: 1300px">
	<div style="text-align: center">
		<div style="width: 1300px;">
			<ul class="nav nav-tabs">
				<li class="nav-item" style="width: 650px"><a class="nav-link "
					id="alink1" aria-current="page" href="#">선택</a></li>
				<li class="nav-item" style="width: 650px"><a class="nav-link "
					id="alink2" href="#">미선택</a></li>
			</ul>
		</div>
	</div>
	<div class="div1">
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
</section>
<%@include file="../../inc/bottom.jsp"%>