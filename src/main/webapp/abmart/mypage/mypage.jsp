<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp" %>
<%@ include file="../../inc/mypagenav.jsp" %>
<style type="text/css">
.orderinfo {
    margin-bottom: 10px;
    padding-top: 30px;
    width: 800px;
    float: left;
}
#mypage{
	text-align: center;
	overflow: hidden;
    padding: 20px 20px 20px 80px;
}

#orderinfo-second div{
	float: left;
}
div#orderinfo-first {
    border-bottom: 2px solid black;
    padding: 0 0 15px 15px;
    font-size: 20px;
    font-weight: bold;
    width: 800px;
    text-align: left;
}
div#orderinfo-second {
	text-align: center;
    margin: 10px 10px 10px 10px;
 	width: 1000px;
}
div#orderinfo-second div {
    padding: 10px 45px 10px 40px;
    text-align: center;
}
div#orderinfo-second div a{
	font-size: 40px;
	font-weight: bold;
	text-decoration: none;
}
.gt{
	font-size: 40px;
	color: #eee;
	position: absolute;
	margin: 25px 0px 0px 58px;
	font-weight: bold;
}
.col.mb-5 {
	width: 250px;
	height: 500px;
	float: left;
	margin: 15px 0 0 15px;
}

footer{
clear: both;
}

</style>
<article id="mypage">
	<div class="orderinfo">
		<div id="orderinfo-first">최근 주문내역</div>
		<div id="orderinfo-second">
			<div>
				<a href="#">0</a><span class="gt">&gt;</span><br>입금대기
			</div>
			<div>
				<a href="#">0</a><span class="gt">&gt;</span><br>결제완료
			</div>
			<div>
				<a href="#">0</a><span class="gt">&gt;</span><br>상품준비중
			</div>
			<div>
				<a href="#">0</a><span class="gt">&gt;</span><br>배송중<br>픽업준비완료
			</div>
			<div>
				<a href="#">0</a><br>배송<br>수령완료
			</div>
		</div>
	</div>
	<div class="orderinfo" id="orderinfo2">
		<div id="orderinfo-first">최근 본 상품</div>
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
	<div class="orderinfo">
		<div id="orderinfo-first">찜한 상품</div>
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
</article>   
<%@ include file="../../inc/bottom.jsp" %>