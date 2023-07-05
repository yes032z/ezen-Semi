<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../../inc/top.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>ShoppingBasket.jsp</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style type ="text/css">
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
</style>
<script type="text/javascript">
	$(".minus_btn").on("click", function()){
		quantity-adjustment = $(this).parent("div").find("input").val();
		$(this).parent("div").find("input").val(++quantity);
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
            <th >배송비</th>
            <th>금액</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><input type="checkbox" name="1"></td>
            <td>
                <div class="media">
                    <img src="" class="mr-3" alt="1">
                    <div class="media-body">
                        <h5 class="mt-0"><a href="#">상품명</a></h5>
                    </div>
                </div>
            </td>
            <td>1개</td>            
            <td>30,000원</td>
            <td>5%</td>
            <td>2500원</td>
            <td>28,500원</td>
        </tr>
        
        <tr>
            <td><input type="checkbox" name="1"></td>
            <td>
                <div class="media">
                    <img src="" class="mr-3" alt="1">
                    <div class="media-body">
                        <h5 class="mt-0"><a href="#">상품명</a></h5>
                    </div>
                </div>
            </td>
            <td>1개</td>
            <td>30,000원</td>
            <td>5%</td>  
            <td>2500원</td>          
            <td>28,500원</td>
        </tr>
        
        <tr>
            <td><input type="checkbox" name="1"></td>
            <td>
                <div class="media">
                    <img src="" class="mr-3" alt="1">
                    <div class="media-body">
                        <h5 class="mt-0"><a href="#">상품명</a></h5>
                    </div>
                </div>
            </td>
            <td>
	            <div class="quantity-adjustment">
		            <button class="plus_btn">+</button>
		            <input type="text" class="quantity-input" value="1">
		            <button class="minus_btn">-</button>
        		</div>
        	</td>	
            <td>1개</td>
            <td>30,000원</td>
            <td>5%</td>   
            <td>2500원</td>         
            <td>28,500원</td>
        </tr>
        
        <tr>
            <td><input type="checkbox" name="1"></td>
            <td>
                <div class="media">
                    <img src="" class="mr-3" alt="1">
                    <div class="media-body">
                        <h5 class="mt-0"><a href="#">상품명</a></h5>
                    </div>
                </div>
            </td>
            <td>1개</td>
            <td>30,000원</td>
            <td>5%</td>  
            <td>2500원</td>          
            <td>28,500원</td>
        </tr>
        
        <tr>
            <td><input type="checkbox" name="1"></td>
            <td>
                <div class="media">
                    <img src="" class="mr-3" alt="1">
                    <div class="media-body">
                        <h5 class="mt-0"><a href="#">상품명</a></h5>
                    </div>
                </div>
            </td>
            <td>1개</td>
            <td>30,000원</td>
            <td>5%</td>     
            <td>2500원</td>       
            <td>28,500원</td>
        </tr>
        
        <tr>
            <td><input type="checkbox" name="1"></td>
            <td>
                <div class="media">
                    <img src="" class="mr-3" alt="1">
                    <div class="media-body">
                        <h5 class="mt-0"><a href="#">상품명</a></h5>
                    </div>
                </div>
            </td>
            <td>1개</td>
            <td>30,000원</td>
            <td>5%</td>   
            <td>2500원</td>         
            <td>28,500원</td>
        </tr>                
    </tbody>                  
</table>
	<!-- 전체 삭제버튼, 선택삭제, 주문하기 버튼 -->
	<input type="button" name="alldel" value="전체삭제">
	<input type="button" name="del" value="선택삭제">
	<input type="button" name="order" value="주문하기">
<%@include file="../../inc/bottom.jsp" %>
</body>               
