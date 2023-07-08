<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../../inc/top.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>ShoppingBasket.jsp</title>
<style type="text/css">
header {
	font-size: 20px;	
	float: center;	
	margin: 30px 0 0 50px;	
}

table {
	margin: 30px;	
}

p {
	text-align: left;
	color: #777;
	margin-top: 4px;
}

total {
	width: 360px;
	height: 412px;
	padding: 20px;
	margin-top: 12px;
	background: #fff;
	border: 1px solid #d3d3d3;
	box-sizing: border-box;
}

img {
	width: 100px;
	height: 100px;
}

input[type="button"] {  
	margin-bottom: 100px;
}

.delete_btn {
	margin-left: 30px;       
}

.order_btn {
	margin-left: 5px;
}



</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    $(".minus_btn").on("click", function() {
        var quantity = parseInt($(this).siblings(".quantity-input").val());
        if (quantity > 1) {
            $(this).siblings(".quantity-input").val(quantity - 1);
            quantity--;
        }
        updateSumPrice($(this));
    });
    
    $(".plus_btn").on("click", function() {
        var quantity = parseInt($(this).siblings(".quantity-input").val());
        $(this).siblings(".quantity-input").val(quantity + 1);
        quantity++;
        updateSumPrice($(this));
    });
    
    function updateSumPrice(btn) {
        var quantity = parseInt(btn.siblings(".quantity-input").val());
        var price = parseInt(btn.parents("tr").find(".price").text());
        var sumprice = price * quantity;
        btn.parents("tr").find(".sumprice").text(sumprice + "원");
    };
    
    $(".delete_btn").on("click", function() {
        var checkedRows = $("input[type='checkbox'][name!='all']:checked").parents("tr");
        checkedRows.remove();
    });  
    
    $(".order_btn").click(function() {
    	location.href = "OrderPayment.jsp"
    });   
});

</script>
</head>
<body>
    <div id="shopping">
        <header><strong>01.장바구니</strong> > 02.주문결제 > 03.주문완료</header>
        <hr>
    </div>
    <br>
   
   <div class = "container">
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
                <td class="price">28000</td>
                <td>5%</td>
                <td>2500원</td>
                <td class="sumprice">28000원</td>
            </tr>
                                                                 
        </tbody>
    </table>
    </div>
    <input type="button" class="delete_btn" name="del_btn" value="선택삭제">
    <input type="button" class="order_btn" name="ord_btn" value="상품 주문하기">
<%@include file="../../inc/bottom.jsp" %>
</body>
