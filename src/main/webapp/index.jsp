<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title> Main Test </title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
    </head>
    <body>
    <!-- 한글 인코딩이 깨져서 영어로 표시  -->
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="#!">AB-MART</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="#!">로그인</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">마이페이지</a></li>
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
				    <input class="form-control mr-sm-2" type="search" placeholder="검색어를 입력해주세요" aria-label="Search" style="width: 600px;">
				    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>


                    <form class="d-flex">
                        <button class="btn btn-outline-dark" type="submit" style="width:120px;height:65px">
                            <i class="bi-cart-fill me-1" ></i>장바구니
                            <span class="badge bg-dark text-white ms-1 rounded-pill">0</span> <!-- 장바구니 안에 담긴 수량 체크  -->
                        </button>
                    </form>
                </div>
            </div>
        </nav>
        <!-- Headerd이미지-->
        <header class="bg-dark py-5">
            <div class="container px-5 px-lg-5 my-5">
                <div class="text-center text-white">
                <img class="card-img-top" src="https://image.a-rt.com//art/display/gs/contents/202306/20230626115213680.jpg?fitting=large|1920:600" alt="..." />
                </div>
            </div>
        </header>
        <!-- Section-->        
        <section class="py-5">
        <h1 class="container px-4 px-lg-5 mt-5"> Sales 상품</h1>        
            <div class="container px-4 px-lg-5 mt-5">            
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <div class="col mb-5">
                        <div class="card h-100">
                             <!-- Sale badge-->
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                            <!-- Product(상품) image 이미지 사이즈 450 X 300-->
                            <img class="card-img-top" src="https://image.a-rt.com/art/product/2023/05/95624_1684127463243.jpg?shrink=388:388" alt="..." />
                            <!-- Cart ins-->
                            <div class="card-body p-3">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder"> 아키클래식</h5>
                                    <!-- 상품 이름-->
                                    <p>퀵슬라이드2 트리플 블랙</p>
									<!-- 상품 별점-->
                                    <div class="d-flex justify-content-center small text-warning mb-2">
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
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">장바구니</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Sale( 세일 표시) -->
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                            <!-- Product image-->
                            <img class="card-img-top" src="https://image.a-rt.com/art/product/2022/07/31594_1657260332781.jpg?shrink=388:388" alt="..." />
                            <!-- Cart ins-->
                            <div class="card-body p-3">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">나이키</h5>
                                    <!-- 상품 이름-->
                                    <p>우먼스 나이키 에어 맥스 시스템</p>
                                    <!-- Product reviews-->
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div> <!-- 별점 표시  -->
                                    </div>
                                    <!-- Product price-->
                                    <!-- 상품 가격 할인 표시  -->
                                    <span class="text-muted text-decoration-line-through">119,000원</span>
                                    83,000원[30%]
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">장바구니</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Sale badge-->
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                            <!-- Product image-->
                            <img class="card-img-top" src="https://image.a-rt.com/art/product/2022/11/17087_1667897429957.jpg?shrink=388:388" alt="..." />
                            <!-- Cart ins-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">푸마</h5>
  									<!-- 상품 이름-->
                                    <p>CA프로 타이티 AOP 프리스쿨</p>
                                    <!-- 상품 별점-->
                                    <div class="d-flex justify-content-center small text-warning mb-2">
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
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">장바구니</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                             <!-- Sale badge-->
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                            <!-- Product image-->
                            <img class="card-img-top" src="https://image.a-rt.com/art/product/2022/10/87894_1665563300308.jpg?shrink=388:388" alt="..." />
                            <!-- Cart ins-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">나이키</h5>
                                    <!-- 상품 이름-->
                                    <p>우먼스 나이키 리뉴 세리니티 런 2</p>
                                    <!-- Product reviews-->
                                    <div class="d-flex justify-content-center small text-warning mb-2">
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
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">장바구니</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Sale badge-->
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                            <!-- Product image-->
                            <img class="card-img-top" src="https://image.a-rt.com/art/product/2022/02/34705_1643943288328.jpg?shrink=388:388" alt="..." />
                            <!-- Cart ins-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">나이키</h5>
                                    <!-- 상품 이름-->
                                    <p>먼스 나이키 코트 레거시 넥스트 네이처</p>
                                    <!-- 상품 별점-->
                                    <div class="d-flex justify-content-center small text-warning mb-2">
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
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">장바구니</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                             <!-- Sale badge-->
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                            <!-- Product image-->
                            <img class="card-img-top" src="https://image.a-rt.com/art/product/2023/03/11678_1678179755820.jpg?shrink=388:388" alt="..." />
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
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">장바구니</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Sale badge-->
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                            <!-- Product image-->
                            <img class="card-img-top" src="https://image.a-rt.com/art/product/2020/05/06991_1590654666755.jpg?shrink=388:388" alt="..." />
                            <!-- Cart ins-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">푸마</h5>
                                    <!-- 상품 이름-->
                                    <p>다이브캣 v2 인젝스 프리스쿨</p>
                                    <!-- 상품 별점-->
                                    <div class="d-flex justify-content-center small text-warning mb-2">
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
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">장바구니</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                             <!-- Sale badge-->
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                            <!-- Product image-->
                            <img class="card-img-top" src="https://image.a-rt.com/art/product/2021/10/06142_1634025702044.jpg?shrink=388:388" alt="..." />
                            <!-- Cart ins-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">프로스펙스</h5>
                                    <!-- 상품 이름-->
                                    <p>빅스타 104</p>
                                    <!-- 상품 별점-->
                                    <div class="d-flex justify-content-center small text-warning mb-2">
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
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">장바구니</a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- New 상품 보여주기(메인페이지) -->            
            <h1 class="container px-4 px-lg-5 mt-5"> New 상품</h1>        
            <div class="container px-4 px-lg-5 mt-5">            
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <div class="col mb-5">
                        <div class="card h-100">
                             <!-- New 배지-->
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">New</div>
                            <!-- 상품 이미지 사이즈 450 X 300-->
                            <img class="card-img-top" src="https://image.a-rt.com/art/product/2023/06/54284_1687230300394.jpg?shrink=224:224" alt="..." />
                            <!-- 장바구니 ins-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- 상품 브랜드-->
                                    <h5 class="fw-bolder"> 아디다스</h5>
                                    <!--  상품 이름 -->
                                    <p>듀라모 RC U</p>
                                    <!-- 상품 가격-->
                                    69,900원                                                                     
                                </div>
                            </div>
                            <!-- 장바구니 버튼-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">장바구니</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                             <!-- New 배지-->
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">New</div>
                            <!-- 상품 이미지 사이즈 450 X 300-->
                            <img class="card-img-top" src="https://image.a-rt.com/art/product/2023/06/54790_1687250005865.jpg?shrink=224:224" alt="..." />
                            <!-- 장바구니 ins-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- 상품 브랜드-->
                                    <h5 class="fw-bolder"> 아디다스</h5>
									<!--  상품 이름 -->
                                    <p>듀라모 RC U</p>
                                    <!-- 상품 가격-->
                                    69,900원                                                                     
                                </div>
                            </div>
                            <!-- 장바구니 버튼-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">장바구니</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                             <!-- New 배지-->
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">New</div>
                            <!-- 상품 이미지 사이즈 450 X 300-->
                            <img class="card-img-top" src="https://image.a-rt.com/art/product/2023/06/99231_1686902830355.jpg?shrink=224:224" alt="..." />
                            <!-- 장바구니 ins-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- 상품 브랜드-->
                                    <h5 class="fw-bolder"> 아디다스</h5>
                                    <!--  상품 이름 -->
                                    <p>듀라모 RC U</p>
                                    <!-- 상품 가격-->
                                    69,900원                                                                     
                                </div>
                            </div>
                            <!-- 장바구니 버튼-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">장바구니</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                             <!-- New 배지-->
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">New</div>
                            <!-- 상품 이미지 사이즈 450 X 300-->
                            <img class="card-img-top" src="https://image.a-rt.com/art/product/2023/06/73757_1687250720658.jpg?shrink=224:224" alt="..." />
                            <!-- 장바구니 ins-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- 상품 브랜드-->
                                    <h5 class="fw-bolder"> 아디다스</h5>
                                    <!-- 상품 이름 -->
                                    <p>듀라모 RC U 우먼스</p>
                                    <!-- 상품 가격-->
                                    69,900원                                                                     
                                </div>
                            </div>
                            <!-- 장바구니 버튼-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">장바구니</a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>                    
        </section>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white"> AB-MART &copy; SemiProject 4 </p><br>
				<div>
					<span class="m-0 text-center text-white">고객센터</span>
					<span class="m-0 text-center text-white">1521-1521</span>
					<span class="m-0 text-center text-white">월~금 09:00 ~ 12:00 / 13:00 ~ 18:00(주말,공휴일 휴무)</span>
				</div>
				<div>
					<span class="m-0 text-center text-white">(주)에이비마트 | 대표이사 : 송영은 | 주소: 서울 서초구 서초대로77길 55 에이프로스퀘어 3층</span><br>
					<span class="m-0 text-center text-white">사업자등록번호 : 123-45-67890 | 통신판매업신고:제 2023-서울서초구-1000호</span><br>
					<span class="m-0 text-center text-white">개인정보보호 책임자:최곽두 | 이메일:abmart@abmart.com</span>
				</div>
			</div>
	</footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="../js/scripts.js"></script>
    </body>
>>>>>>> branch 'master' of https://github.com/pjm0209/semiProject.git
</html>