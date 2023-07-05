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
	margin-top: 30px;
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

</style>
<script type="text/javascript">
$(document).ready(function() {
	var price = $('#price').html();
	
	$(".minus_btn").on("click", function() {
        var quantity = parseInt($(this).siblings(".quantity-input").val());
        $(this).siblings(".quantity-input").val(quantity - 1);
        var qty=$(this).next('input').val();    
        
        var sumprice= parseInt(price)*parseInt(qty);
        $('#sumprice').html(sumprice);
	    
	});
	
	//수량이 증가하면 총금액도 증가
    $(".plus_btn").on("click", function() {
        var quantity = parseInt($(this).siblings(".quantity-input").val());
        $(this).siblings(".quantity-input").val(quantity + 1);
        var qty=$(this).next('input').val();        
        var sumprice= parseInt(qty)*parseInt(price);
        $('#sumprice').html(sumprice);
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
            <th><input type="checkbox" name="all"></th>
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
            <td>2500원</td>          
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
            <td>28,000원</td>
            <td>5%</td>     
            <td>2500원</td>       
            <td>
            	<input type="text" class="salesprice-input" value="1" style=width:30px>            
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
            <td>28,000원</td>
            <td>5%</td>     
            <td>2500원</td>       
            <td>
            	<input type="text" class="salesprice-input" value="1" style=width:30px>                                    	
            </td>
        </tr>                    
    </tbody>                  
</table>
	<!-- 전체선택, 삭제, 주문하기 버튼 -->
	<input type="button" name="allcheck_btn" value="전체선택">	
	<input type="button" name="del_btn" value="삭제">
	<input type="button" name="order_btn" value="주문하기">
<%@include file="../../inc/bottom.jsp" %>
</body>               
