<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp" %>
	<!-- Headerd이미지-->
	<header class="bg-dark py-5">
		< <!-- 기존 배너 -->
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
          <img src="https://image.a-rt.com//art/display/gs/contents/202306/20230629143044736.jpg?fitting=large|1920:600" class="d-block w-100" alt="..."  />
        </div>
        <div class="carousel-item">
          <img src="https://image.a-rt.com//art/display/gs/contents/202307/20230701104256906.jpg?fitting=large|1920:600" class="d-block w-100" alt="..." />
        </div>
        <div class="carousel-item">
          <img src="https://image.a-rt.com//art/display/gs/contents/202306/20230602100214370.jpg?fitting=large|1920:600" class="d-block w-100" alt="..." />
        </div>
      </div>
      <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
      </button>
      <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
      </button>
    </div>
	</header>
	<!-- Section-->
	<section class="py-5">
		<h1 class="container px-4 px-lg-5 mt-5">Sales 상품</h1>
		<div class="container px-4 px-lg-5 mt-5">
			<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Sale badge-->
						<div class="badge bg-dark text-white position-absolute"
							style="top: 0.5rem; right: 0.5rem">Sale
						</div>
						<!-- Product(상품) image 이미지 사이즈 450 X 300-->
						<img class="card-img-top"
							src="https://image.a-rt.com/art/product/2023/05/95624_1684127463243.jpg?shrink=388:388"
							alt="..." />
						<!-- Cart ins-->
						<div class="card-body p-3">
							<div class="text-center">
								<!-- Product name-->
								<h5 class="fw-bolder">아키클래식</h5>
								<!-- 상품 이름-->
								<p>퀵슬라이드2 트리플 블랙</p>
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
								<span class="text-muted text-decoration-line-through">59,000원</span>
								29,900원[49%]
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							
						</div>
					</div>
				</div>
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Sale( 세일 표시) -->
						<div class="badge bg-dark text-white position-absolute"
							style="top: 0.5rem; right: 0.5rem">Sale</div>
						<!-- Product image-->
						<img class="card-img-top"
							src="https://image.a-rt.com/art/product/2022/07/31594_1657260332781.jpg?shrink=388:388"
							alt="..." />
						<!-- Cart ins-->
						<div class="card-body p-3">
							<div class="text-center">
								<!-- Product name-->
								<h5 class="fw-bolder">나이키</h5>
								<!-- 상품 이름-->
								<p>우먼스 나이키 에어 맥스 시스템</p>
								<!-- Product reviews-->
								<div
									class="d-flex justify-content-center small text-warning mb-2">
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<!-- 별점 표시  -->
								</div>
								<!-- Product price-->
								<!-- 상품 가격 할인 표시  -->
								<span class="text-muted text-decoration-line-through">119,000원</span>
								83,000원[30%]
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
						
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
							src="https://image.a-rt.com/art/product/2022/11/17087_1667897429957.jpg?shrink=388:388"
							alt="..." />
						<!-- Cart ins-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 class="fw-bolder">푸마</h5>
								<!-- 상품 이름-->
								<p>CA프로 타이티 AOP 프리스쿨</p>
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
								<span class="text-muted text-decoration-line-through">79,000원</span>
								31,000원[60%]
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
						
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
							src="https://image.a-rt.com/art/product/2022/10/87894_1665563300308.jpg?shrink=388:388"
							alt="..." />
						<!-- Cart ins-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 class="fw-bolder">나이키</h5>
								<!-- 상품 이름-->
								<p>우먼스 나이키 리뉴 세리니티 런 2</p>
								<!-- Product reviews-->
								<div
									class="d-flex justify-content-center small text-warning mb-2">
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
								</div>
								<!-- Product price-->
								<span class="text-muted text-decoration-line-through">99,000원</span>
								49,000원[50%]
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
						
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
							src="https://image.a-rt.com/art/product/2022/02/34705_1643943288328.jpg?shrink=388:388"
							alt="..." />
						<!-- Cart ins-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 class="fw-bolder">나이키</h5>
								<!-- 상품 이름-->
								<p>먼스 나이키 코트 레거시 넥스트 네이처</p>
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
								<span class="text-muted text-decoration-line-through">79,000원</span>
								39,000원[50%]
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							
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
								<div
									class="d-flex justify-content-center small text-warning mb-2">
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
							src="https://image.a-rt.com/art/product/2020/05/06991_1590654666755.jpg?shrink=388:388"
							alt="..." />
						<!-- Cart ins-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 class="fw-bolder">푸마</h5>
								<!-- 상품 이름-->
								<p>다이브캣 v2 인젝스 프리스쿨</p>
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
								<span class="text-muted text-decoration-line-through">49,000원</span>
								15,000원[69%]
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							
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
							src="https://image.a-rt.com/art/product/2021/10/06142_1634025702044.jpg?shrink=388:388"
							alt="..." />
						<!-- Cart ins-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 class="fw-bolder">프로스펙스</h5>
								<!-- 상품 이름-->
								<p>빅스타 104</p>
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
								<span class="text-muted text-decoration-line-through">79,000원</span>
								47,400원[40%]
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
						
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- New 상품 보여주기(메인페이지) -->
		<h1 class="container px-4 px-lg-5 mt-5">New 상품</h1>
		<div class="container px-4 px-lg-5 mt-5">
			<div
				class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
				<div class="col mb-5">
					<div class="card h-100">
						<!-- New 배지-->
						<div class="badge bg-dark text-white position-absolute"
							style="top: 0.5rem; right: 0.5rem">New</div>
						<!-- 상품 이미지 사이즈 450 X 300-->
						<img class="card-img-top"
							src="https://image.a-rt.com/art/product/2023/06/54284_1687230300394.jpg?shrink=224:224"
							alt="..." />
						<!-- 장바구니 ins-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- 상품 브랜드-->
								<h5 class="fw-bolder">아디다스</h5>
								<!--  상품 이름 -->
								<p>듀라모 RC U</p>
								<!-- 상품 가격-->
								69,900원
							</div>
						</div>
						<!-- 장바구니 버튼-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							
						</div>
					</div>
				</div>
				<div class="col mb-5">
					<div class="card h-100">
						<!-- New 배지-->
						<div class="badge bg-dark text-white position-absolute"
							style="top: 0.5rem; right: 0.5rem">New</div>
						<!-- 상품 이미지 사이즈 450 X 300-->
						<img class="card-img-top"
							src="https://image.a-rt.com/art/product/2023/06/54790_1687250005865.jpg?shrink=224:224"
							alt="..." />
						<!-- 장바구니 ins-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- 상품 브랜드-->
								<h5 class="fw-bolder">아디다스</h5>
								<!--  상품 이름 -->
								<p>듀라모 RC U</p>
								<!-- 상품 가격-->
								69,900원
							</div>
						</div>
						<!-- 장바구니 버튼-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
						
						</div>
					</div>
				</div>
				<div class="col mb-5">
					<div class="card h-100">
						<!-- New 배지-->
						<div class="badge bg-dark text-white position-absolute"
							style="top: 0.5rem; right: 0.5rem">New</div>
						<!-- 상품 이미지 사이즈 450 X 300-->
						<img class="card-img-top"
							src="https://image.a-rt.com/art/product/2023/06/99231_1686902830355.jpg?shrink=224:224"
							alt="..." />
						<!-- 장바구니 ins-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- 상품 브랜드-->
								<h5 class="fw-bolder">아디다스</h5>
								<!--  상품 이름 -->
								<p>듀라모 RC U</p>
								<!-- 상품 가격-->
								69,900원
							</div>
						</div>
						<!-- 장바구니 버튼-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
						
						</div>
					</div>
				</div>
				<div class="col mb-5">
					<div class="card h-100">
						<!-- New 배지-->
						<div class="badge bg-dark text-white position-absolute"
							style="top: 0.5rem; right: 0.5rem">New</div>
						<!-- 상품 이미지 사이즈 450 X 300-->
						<img class="card-img-top"
							src="https://image.a-rt.com/art/product/2023/06/73757_1687250720658.jpg?shrink=224:224"
							alt="..." />
						<!-- 장바구니 ins-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- 상품 브랜드-->
								<h5 class="fw-bolder">아디다스</h5>
								<!-- 상품 이름 -->
								<p>듀라모 RC U 우먼스</p>
								<!-- 상품 가격-->
								69,900원
							</div>
						</div>
						<!-- 장바구니 버튼-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
<%@include file="../inc/bottom.jsp" %>
</body>
</html>


