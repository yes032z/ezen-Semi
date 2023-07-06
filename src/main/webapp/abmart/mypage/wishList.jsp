<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp" %>
<%@ include file="../../inc/mypagenav.jsp" %>
<link href="../../css/mypage.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	$(function() {
	    $(".minus_btn").on("click", function() {
	        var quantity = parseInt($(this).siblings(".quantity-input").val());
	        if (quantity > 1) {
	            $(this).siblings(".quantity-input").val(quantity - 1);
	        }
	    });
	
	    $(".plus_btn").on("click", function() {
	        var quantity = parseInt($(this).siblings(".quantity-input").val());
	        $(this).siblings(".quantity-input").val(quantity + 1);
	    });
	    
	    $('#chkAll').click(function(){
			$('.chkItem').prop('checked',this.checked);
		});
	    
	});
</script>
<article id="mypage">
	<div class="orderinfo">
		<div id="orderinfo-first">찜한 상품</div>
		<div class="subtitle">나의 찜 목록</div>
		<div id="orderinfo-third">
			<table class="table table-hover">
    <thead class="thead-dark">
        <tr>
            <th><input type="checkbox" name="all" id="chkAll"></th>
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
            <td><input type="checkbox" name="1" class="chkItem"></td>
            <td>
                <div class="media">
                    <img src="../../images/test.jpg" class="mr-3 pdimgsize" alt="1">
                    <div class="media-body">
                        <h5 class="mt-0"><a href="#">상품명</a></h5>
                    </div>
                </div>
            </td>
            <td>
           	 <div class="quantity-adjustment">
	            <button class="plus_btn btn mypagebtn3">+</button>
	            <input type="text" class="quantity-input" value="1" style="width: 45px; height: 35px">
	            <button class="minus_btn btn mypagebtn3">-</button>
       		</div>
            </td>            
            <td>30,000원</td>
            <td>5%</td>
            <td>25000원</td>
            <td>28,500원</td>
        </tr>
        
        <tr>
            <td><input type="checkbox" name="1" class="chkItem"></td>
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
	            <button class="plus_btn btn mypagebtn3">+</button>
	            <input type="text" class="quantity-input" value="1" style="width: 45px; height: 35px">
	            <button class="minus_btn btn mypagebtn3">-</button>
       		</div>
            </td>
            <td>30,000원</td>
            <td>5%</td>  
            <td>2500원</td>          
            <td>28,500원</td>
        </tr>
        
        <tr>
            <td><input type="checkbox" name="1" class="chkItem"></td>
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
		            <button class="plus_btn btn mypagebtn3">+</button>
		            <input type="text" class="quantity-input" value="1" style="width: 45px; height: 35px">
		            <button class="minus_btn btn mypagebtn3">-</button>
        		</div>
        	</td>	
            <td>1개</td>
            <td>30,000원</td>
            <td>5%</td>   
            <td>2500원</td>         
        </tr> 
    </tbody>                  
</table>
	<input type="button" class="mypagebtn2" name="del" value="삭제하기">
	<input type="button" class="mypagebtn2" name="order" value="주문하기">

			</div>
		</div>

</article>
<%@ include file="../../inc/bottom.jsp" %>