<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../../inc/top.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>ShoppingBasket.jsp</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style type ="text/css">
.header{
	margin-top: 50px;
	margin-left: 30px;
}

table{
	margin: 30px;	
}

p{
	text-align: left;
	color: #777;
	margin-top: 4px;
}

total{
	width: 360px;
	height: 412px;
	padding: 20px;
	margin-top: 12px;
	background: #fff;
	border: 1px solid #d3d3d3;
	box-sizing: border-box;
}

img{
	width : 100px;
	hegiht :100px;
}

input[type="button"] {  
  margin-bottom: 100px;
}


.delete_btn{
	margin-left: 30px;       
}

.order_btn{
	margin-left: 5px;
}

</style>
<script type="text/javascript">
$(document).ready(function() {
	//
    var price = parseInt($('#price').html()); // 상품 가격을 가져와서 정수로 변환하여 price 변수에 저장함
    var quantity = parseInt($('.quantity-input').val()); // 현재 수량을 가져와서 정수로 변환하여 quantity 변수에 저장함
    var sumprice = price * quantity; // 초기 총 가격을 계산함 (가격 * 수량)
    $('#sumprice').html(sumprice+"원"); // 초기 총 가격을 화면에 출력함

    //수량감소하면, 금액도 감소
    $(".minus_btn").on("click", function() {
        var quantity = parseInt($(this).siblings(".quantity-input").val()); // 현재 수량을 가져와서 정수로 변환하여 quantity 변수에 저장함
        if (quantity > 1) { // 수량이 1보다 큰 경우에만 실행함
            $(this).siblings(".quantity-input").val(quantity - 1); // 수량을 1 감소시킴
            quantity--; // 감소된 수량을 변수에 반영함
        }
        var sumprice = price * quantity; // 총 가격을 계산함 (가격 * 수량)
        $('#sumprice').html(sumprice+"원"); // 총 가격을 화면에 출력함
    });
    
	//수량증가하면, 금액도 증가
    $(".plus_btn").on("click", function() {
        var quantity = parseInt($(this).siblings(".quantity-input").val()); // 현재 수량을 가져와서 정수로 변환하여 quantity 변수에 저장함
        $(this).siblings(".quantity-input").val(quantity + 1); // 수량을 1 증가시킴
        quantity++; // 증가된 수량을 변수에 반영합니다.
        var sumprice = price * quantity; // 총 가격을 계산함 (가격 * 수량)
        $('#sumprice').html(sumprice+"원"); // 총 가격을 화면에 출력함
    });

 
});
</script>
</head>
<body>
    <div class = "header">        
  		<span>HOME > <strong>장바구니</strong> > 주문결제 > 주문완료</span>         
    </div><br>
   
<table class="table table-bordered">
    <thead>
        <tr>
            <th><input type="checkbox" name="all" onclick="selectAll()"></th>
            <th>상품명</th>
            <th>총수량</th>
            <th>판매가</th>
            <th>할인</th>
            <th>배송비</th>
            <th>금액</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><input type="checkbox" name="1"></td>
            <td>
                <div class="media">
                    <img src="https://image.a-rt.com/art/product/2023/06/18154_1686895862787.jpg?shrink=224:224" class="mr-3" alt="1">
                    <div class="media-body">
                        <h5 class="mt-0"><a href="#">척테일러올스타 1벨크로 하이</a></h5>
                    </div>
                </div>
            </td>
            <td>
            	<div class="quantity-adjustment">
		            <button class="plus_btn">+</button>
		            <input type="text" class="quantity-input" value="1" style=width:30px>
		            <button class="minus_btn">-</button>
        		</div>
        	</td>	
			<td><span id="price">28000</span>원</td>
            <td>5%</td>  
            <td>2500</td>          
            <td>
            	<span id="sumprice"></span>
            	<span id="divprice"></span>                    
            </td>
        </tr>
  
        <tr>
            <td><input type="checkbox" name="1"></td>
            <td>
                <div class="media">
                    <img src="https://image.a-rt.com/art/product/2023/06/14712_1687503790541.jpg?shrink=224:224" class="mr-3" alt="1">
                    <div class="media-body">
                        <h5 class="mt-0"><a href="#">코트 보로우 로우 리크래프트 보이그레이드</a></h5>
                    </div>
                </div>
            </td>
            <td>
            	<div class="quantity-adjustment">
		            <button class="plus_btn">+</button>
		            <input type="text" class="quantity-input" value="1" style=width:30px>
		            <button class="minus_btn">-</button>
        		</div>
            </td>
            <td><span id="price2">28000</span></td>
            <td>5%</td>     
            <td>2500</td>       
            <td>
            	<span id="sumprice2"></span>
            	<span id="divprice2"></span>             
            </td>
        </tr>  
        
         <tr>
            <td><input type="checkbox" name="1"></td>
            <td>
                <div class="media">
                    <img src="https://image.a-rt.com/art/product/2023/06/91937_1688017522910.jpg?shrink=590:590" class="mr-3" alt="1">
                    <div class="media-body">
                        <h5 class="mt-0"><a href="#">듀엣 맥스 II 클로그</a></h5>
                    </div>
                </div>
            </td>
            <td>
            	<div class="quantity-adjustment">
		            <button class="plus_btn">+</button>
		            <input type="text" class="quantity-input" value="1" style=width:30px>
		            <button class="minus_btn">-</button>
        		</div>                   
            </td>
            <td><span id="price3">28000</span></td>
            <td>5%</td>     
            <td>2500</td>       
            <td>
            	<span id="sumprice3"></span>
            	<span id="divprice3"></span>                                   	
            </td>
        </tr>                    
    </tbody>                  
</table>
	<!--삭제, 주문하기 버튼 -->		
	<input type="button" class="delete_btn" name="del_btn" value="삭제">
	<input type="button" class="order_btn" name="ord_btn" value="주문하기.">
<%@include file="../../inc/bottom.jsp" %>
</body>               
