<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp"%>
<%@ include file="../../inc/mypagenav.jsp"%>
<link href="../../css/mypage.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../../js/jquery-3.7.0.min.js"></script>
<script type="text/javascript" src="../../js/jquery-ui.min.js"></script>
<script type="text/javascript">
    $(function () {
    	$(function() {
    		var startDate= new Date();
    		var lastDate 
    		= new Date(startDate.getFullYear(), startDate.getMonth() + 1, startDate.getDate());
    		
    		var startDateValue = startDate.toISOString().split('T')[0];
    		var lastDateValue = lastDate.toISOString().split('T')[0];
    		
    		$('#startDate').val(startDateValue);
    		$('#lastDate').val(lastDateValue);
    	});
	});
</script>
<article id="mypage">
	<div class="orderinfo">
		<div id="orderinfo-first">주문 조회</div>
		<div id="orderinfo-third" class="orderbox">
			온라인 쇼핑몰 구매 내역&nbsp;&nbsp;
			<button type="button" class="btn btnDate" name="size">1개월</button>
			<button type="button" class="btn btnDate" name="size">3개월</button>
			<button type="button" class="btn btnDate" name="size">6개월</button>
			<button type="button" class="btn btnDate" name="size">1년</button>
			<input type="date" id="startDate" /> ~ <input type="date"
				id='lastDate' />
			<button type="button" class="mypagebtn" name="size">조회</button>
		</div>

		<div id="orderinfo-third">
			<table class="table table-hover">
   				 <thead class="thead-dark">
					<tr>
						<th><input type="checkbox" name="all"></th>
						<th>상품명</th>
						<th>총수량</th>
						<th>판매가</th>
						<th>배송비</th>
						<th>금액</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="checkbox" name="1"></td>
						<td>
							<div class="media">
								<img src="" class="mr-3 pdimgsize" alt="1">
								<div class="media-body">
									<h5 class="mt-0">
										<a href="#">상품명</a>
									</h5>
								</div>
							</div>
						</td>
						<td>1개</td>
						<td>30,000원</td>
						<td>5%</td>
						<td>2500원</td>
						<td><input type="button" class="mypagebtn" value="리뷰 쓰기" /></td>
					</tr>
						<tr>
						<td><input type="checkbox" name="1"></td>
						<td>
							<div class="media">
								<img src="" class="mr-3 pdimgsize" alt="1">
								<div class="media-body">
									<h5 class="mt-0">
										<a href="#">상품명</a>
									</h5>
								</div>
							</div>
						</td>
						<td>1개</td>
						<td>30,000원</td>
						<td>5%</td>
						<td>2500원</td>
						<td><input type="button" class="mypagebtn" value="리뷰 쓰기" /></td>
					</tr>
				</tbody>
			</table>
			<input type="button" class="mypagebtn2" name="del" value="반품신청"> 
			<input type="button" class="mypagebtn2" name="del" value="취소하기"> 
		</div>
	</div>

</article>
<%@ include file="../../inc/bottom.jsp"%>