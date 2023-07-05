<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp" %>
<%@ include file="../../inc/mypagenav.jsp" %>
<link href="../../css/mypage.css" rel="stylesheet" type="text/css">
<article id="mypage">
	<div class="orderinfo">
		<div id="orderinfo-first">재고 알림</div>
		<div id="orderinfo-third">
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
                    <img src="" class="mr-3 pdimgsize" alt="1">
                    <div class="media-body">
                        <h5 class="mt-0"><a href="#">상품명</a></h5>
                    </div>
                </div>
            </td>
            <td>
           	 <div class="quantity-adjustment">
	            <button class="plus_btn btn">+</button>
	            <input type="text" class="quantity-input" value="1" style="width: 45px">
	            <button class="minus_btn btn">-</button>
       		</div>
            </td>            
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
	            <button class="plus_btn btn">+</button>
	            <input type="text" class="quantity-input" value="1" style="width: 45px">
	            <button class="minus_btn btn">-</button>
       		</div>
            </td>
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
		            <button class="plus_btn btn">+</button>
		            <input type="text" class="quantity-input" value="1" style="width: 45px">
		            <button class="minus_btn btn">-</button>
        		</div>
        	</td>	
            <td>1개</td>
            <td>30,000원</td>
            <td>5%</td>   
            <td>2500원</td>         
        </tr> 
    </tbody>                  
</table>
	<!-- 전체 삭제버튼, 선택삭제, 주문하기 버튼 -->
	<input type="button" name="alldel" value="전체삭제">
	<input type="button" name="del" value="선택삭제">
	<input type="button" name="order" value="주문하기">

			</div>
		</div>

</article>
<%@ include file="../../inc/bottom.jsp" %>