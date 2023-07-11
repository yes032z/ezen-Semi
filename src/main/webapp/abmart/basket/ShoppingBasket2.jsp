<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../inc/top.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../../css/basket.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function() { 		
    // 상품 주문 수량 증가
    $(document).on("click", ".plus_btn", function() {
        var quantityInput = $(this).siblings(".quantity-input");
        var quantity = parseInt(quantityInput.val());
        quantityInput.val(quantity + 1);
        quantity++;
        updateSumPrice($(this));
    });

    // 상품 주문 수량 감소
    $(document).on("click", ".minus_btn", function() {
        var quantityInput = $(this).siblings(".quantity-input");
        var quantity = parseInt(quantityInput.val());
        if (quantity > 1) {
            quantityInput.val(quantity - 1);
            quantity--;
            updateSumPrice($(this));
        }
    });
    
    // 합계 금액 
    function updateSumPrice(element) {
        var quantity = parseInt(element.closest(".basket_list_detail").find(".quantity-input").val());
        var price = parseInt(element.closest(".basket_list_detail").find(".price").text().replace(/,/g, "").replace("원", ""));
        var sumPrice = quantity * price;
        element.closest(".basket_list_detail").find(".sum-price").text(sumPrice.toLocaleString() + "원");
    }
		
    $(".basket_list_optionbtn").on("click", function() {
        var checkedRows = $("input[type='checkbox'][name!='all']:checked").parents("tr");
        checkedRows.remove();
    }); 
        
    $(".basket_bigbtn.left").click(function() {
    	location.href = "http://localhost:9090/semiProject/index.jsp";
    }); 
    
    $(".basket_bigbtn.right").click(function() {
    	location.href = "OrderPayment.jsp";
    });
    
    $(".plus_btn").on("click", function() {
        var quantity = parseInt($(this).siblings(".quantity-input").val());
        $(this).siblings(".quantity-input").val(quantity + 1);
        quantity++;
        updateSumPrice($(this));/
    });
 
});
</script>
</head>
<body>
    <div id="shopping">
        <header><strong>01.장바구니 ></strong>02.주문결제 > 03.주문완료</header>
        <hr>
    </div>
    <section class="basket">
        <table class="basket_list">
            <form>            	 
            	<input type="button" class="basket_list_optionbtn" name="delete_btn" value="선택 상품 삭제">
                <thead>
                    <tr>
                        <td></td>
                        <td colspan="2">상품정보</td>
                        <td>상품 주문 수량</td>
                        <td>상품금액</td>
                        <td>배송비</td>      
                        <td>합계</td>                                         
                    </tr>
                </thead>
                <tbody>                
                    <tr class="basket_list_detail">
						<td><input type="checkbox"></td>
                        <td><img src="https://image.a-rt.com/art/product/2023/05/73554_1683853295803.jpg?shrink=590:590" alt="1"></td>
                        <td>아디다스<span class="basket_list_smartstore"></span>
                            <p>아디코드</p>                       
                        </td>
                       	<td class="basket_list_option">
	                        <button class="plus_btn">+</button>
	                        <input type="text" class="quantity-input" value="1" style=width:30px>
	                        <button class="minus_btn">-</button>                        
                        </td>
                        <td><span class="price">63,000원</span><br>                            
                        </td>
                        <td>무료</td>
                         <td class="sum-price">63,000원</td>	
                    </tr>
                    
                    <tr class="basket_list_detail">
                        <td style="width: 2%;"><input type="checkbox"></td>
                        <td style="width: 13%;">
                            <img src="https://image.a-rt.com/art/product/2020/10/29855_1603086614649.jpg?shrink=590:590" alt="1">
                        </td>
                        <td style="width: 27%;">나이키<span class="basket_list_smartstore"></span>
                            <p>스탠 스미스</p>
                        </td>
                        <td class="basket_list_option" style="width: 27%;">
                        	<div class="quantity-adjustment">
	                           	<button class="plus_btn">+</button>
		                        <input type="text" class="quantity-input" value="1" style=width:30px>
		                        <button class="minus_btn">-</button>    
		                    </div>                       
                        </td>
                        <td style="width: 15%;"><span class="price">29,000원</span><br>                            
                        </td>
                        <td style="width: 15%;">무료</td>
                        <td class="sum-price">29,000원</td>
                    </tr>                                     
                </tbody>                
            </form>
        </table>
        <div class="basket_mainbtns">
            <input type="button" class="basket_bigbtn left" name="shop_btn" value="계속 쇼핑하기">                        
            <input type="button" class="basket_bigbtn right" name="ord_btn" value="상품 주문하기">            
        </div>
        
        <!-- 장바구니페이지 하단 설명 -->
        <div class="basket_information">
        	<ul>
				<li>상품 주문 전 꼭 확인해주세요!</li>
				<li>AB-RT 배송 상품은 AB-MART 온라인 물류센터 또는 AB-MART 매장에서 발송되는 상품입니다</li>
				<li>On the spot배송 상품은 AB-MART 온라인 물류센터 또는 On the spot 매장에서 발송되는 상품입니다.</li>
				<li>매장에서 발송되는 경우 온라인 물류센터 상품보다 평균 배송기간이 2~3일 정도 더 소요될 수 있습니다.</li>
				<li>발송 매장 정보는 주문 완료 후 ‘마이페이지 > 쇼핑내역 > 주문/배송 현황조회’에서 확인 가능합니다.</li>
				<li>업체 배송 상품의 경우 업체별 배송비 정책에 따라 배송비가 부과됩니다.</li>
				<li>업체 배송 상품은 매장 픽업, 편의점 픽업이 불가능합니다.</li>
				<li>2개 이상의 상품 주문 시 재고 여부에 따라 분리 발송될 수 있습니다.</li>
				<li>매장 픽업이 불가능한 상품을 포함하여 주문할 경우 주문서 작성/결제 페이지에서 매장픽업 선택이 불가능합니다.</li>
	     	</ul>
        </div>
    </section>
</body>
<%@include file="../../inc/bottom.jsp" %>
