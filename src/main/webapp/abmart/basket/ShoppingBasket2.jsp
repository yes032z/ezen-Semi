<%@page import="com.semi.member.model.MemberVO"%>
<%@page import="com.semi.member.model.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../inc/top.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OrderPayment.jsp</title>
<style type="text/css">
header {
	font-size: 20px;	
	float: center;	
	margin: 30px 0 0 360px;	
} 

body {
  margin: 0;
}

* {
  box-sizing: border-box;
}

p,
span {
  margin: 0;
}

a {
  color: black;
}

img {
  display: block;
  width: 80%;
  height: 80px;
  margin: auto;
}

.basket {
  width: 80%;
  margin: auto;
  padding: 30px;
}

.basket ul {
  background-color: whitesmoke;
  padding: 30px;
  margin-bottom: 50px;
  border: whitesmoke solid 1px;
  border-radius: 5px;
  font-size: 13px;
  font-weight: 300;
}

table {
  border-top: solid 1.5px black;
  border-collapse: collapse;
  width: 100%;
  font-size: 14px;
}

thead {
  text-align: center;
  font-weight: bold;
}

tbody {
  font-size: 12px;
}

td {
  padding: 15px 0px;
  border-bottom: 1px solid lightgrey;
}

.basket_list_detail :nth-child(3) {
  vertical-align: center;
}

.basket_list_detail :nth-child(3) a {
  font-size: 12px;
}

.basket_list_detail :nth-child(3) p {
  margin-top: 6px;
  font-weight: bold;
}

.basket_list_smartstore {
  font-size: 12px;
  color: gray;
}

.basket_list_option {
  vertical-align: top;
  padding: 20px;
}

.basket_list_option > span {
	float: center;
	font-size : 20px;
}

.basket_list_option p {
  margin-bottom: 25px;
  position: relative;
}

.basket_list_option p::after {
  content: "";
  width: 90%;
  height: 1px;
  background-color: lightgrey;
  left: 0px;
  top: 25px;
  position: absolute;
}

.basket_list_optionbtn {
  background-color: white;
  font-size: 15px;
  border: lightgrey solid 1px;
  padding: 15px;    
  margin-right: 3000px;
  margin-bottom: 20px;
}

.basket_list_detail :nth-child(4),
.basket_list_detail :nth-child(5),
.basket_list_detail :nth-child(6) {
  border-left: 2px solid whitesmoke;
}

.basket_list_detail :nth-child(5),
.basket_list_detail :nth-child(6) {
  text-align: center;
}

.basket_list_detail :nth-child(5) button {
  background-color: limegreen;
  color: white;
  border: none;
  border-radius: 5px;
  padding: 4px 8px;
  font-size: 12px;
  margin-top: 5px;
}

.price {
  font-weight: bold;
}

.basket_mainbtns {
  width: 420px;
  height: 200px;
  padding-top: 40px;
  display: block;
  margin: auto;
}

form>table {
	width: 80%;
	border-top: 2px solid #000;
	border-collapse: collapse;
	border-spacing: 0;
	margin: auto;
}

form>table tr {
	border-bottom: 1px solid #d3d3d3;
}

form>table th {
	padding: 12px 0;
	background: #fff;
	color: #383838;
	font-size: 0.95em;
	text-align: center;
	letter-spacing: -0.1em;
}

form>table .empty {
	display: none;
}

form>table td {
	text-align: center;
}

form>table td:last-child {
	color: #ff006c;
	font-weight: bold;
}

form>table tr>td>input {
	
}
form>table td>article {
	padding: 6px;
	overflow: hidden;
}

form>table td>article>a {
	float: left;
	display: inline-block;
}

form>table td>article>a>img {
	width: 80px;
}

form>table td>article>div {
	float: left;
	margin-left: 10px;
}

form>table td>article>div>h2 {
	text-align: left;	
}

form>table td>article>div>p {
	text-align: left;
	color: #777;
	margin-top: 4px;
}

form>article {
	width: 560px;
	height: auto;
	margin-top: 16px;
}

.final {
	float: right;
	width: 360px;
	height: 450px;
	padding: 20px;
	margin-top: 120px;
	margin-right: 200px;
	background: #fff;
	border: 1px solid #d3d3d3;
	box-sizing: border-box;
}

.final>h2 {
	width: 100%;
	font-weight: bold;
	font-size: 20px;
	margin-bottom: 10px;
	padding-bottom: 10px;
	box-sizing: border-box;
	color: #1e1e1e;
}

.final>table {
	width: 100%;
}

.final>table tr:nth-last-child(1) td {
	font-size: 20px;
}

.final>table tr:nth-last-child(1) td:last-child {
	color: #ff006c;
	font-size: 20px;
	font-weight: bold;
}

.final>table td {
	padding: 15px 0;
	font-size: 14px;
	color: #555;
}

form>.final>table td:last-child {
	text-align: right;
}

form>.final>input[type=submit] {
	width: 100%;
	height: 56px;
	font-size: 26px;
	border-width: 1px;
	border-color: #d81818;
	border-bottom-color: #9e1212;
	background: #ed2f2f;
	background-image: -webkit-linear-gradient(#ed2f2f, #dd0e0e);
	color: #fff;
	box-sizing: border-box;
	margin-top: 10px;
}

form>article>h1 {
	font-weight: bold;
	font-size: 20px;
	padding: 6px 0;
	margin-bottom: 12px;
	margin-right: 100px;
}

form>article>div {
	padding: 6px;
	box-sizing: border-box;
}

form>.delivery>table {
	margin-top: 10px;
	margin-left: 150px;
}

form>.delivery>table tr>td:nth-child(1) {
	padding: 6px;
}

form>.delivery>table input[type=button] {
	padding: 4px 6px;
	border: 1px solid #ccc;
	background-color: #f0f4f9;
	border-color: #acc0e0;
	color: #3371c9;
	outline: none;
}

form input {
	color: #555;
	padding: 2px 0;
	border: 1px solid #999;
	box-sizing: border-box;
}

form>.delivery>table input[name=addr] {
	width: 300px;
}


form>.delivery>table input[name=request] {
	width: 300px;
}


form>.discount>div {
	overflow: hidden;
}

form>.discount>div>p {
	float: left;
}

form>.discount>div>label {
	float: right;
}

form>.discount>div>label>input[type=text] {
	display: inline-block;
	outline: none;
}

form>.discount>div>span {
	display: block;
	margin-top: 20px;
	color: #888;
}

form>.discount>div>label>input[type=button] {
	padding: 4px 6px;
	border: 1px solid #ccc;
	background-color: #f0f4f9;
	border-color: #acc0e0;
	color: #3371c9;
	outline: none;
}

form>.payment>div {
	margin-bottom: 10px;
}

form>.payment>div>span {
	display: inline-block;
	color: #3a85c8;
	margin: 6px 0;
}

form>.payment>div label {
	margin-right: 16px;
}

form>.payment>div input {
	vertical-align: bottom;
	margin-right: 4px;
}

form>.Payment_method>table {
	margin-top: 10px;
	margin-left: 150px;
}


form>.alert {
	width: 560px;
	background-color: #f7f7f7;
	padding: 6px;
	padding-left: 20px;
	margin-left: 150px;
	color: #999;
	box-sizing: border-box;
}

form>.alert>ul {
	list-style: inherit;
}

form>.alert>ul>li {
	line-height: 20px;
}

form>.alert>ul>li>span {
	position: relative;
	left: -6px;
}
.alert{
	width: 300px;
}

.alert ul :first-child {
  	color: red;
  	font-weight:bold;  	
}

li{
	text-align: left;
}

.modal {
  display: none;
  position: fixed;
  z-index: 9999;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  overflow: auto;
  background-color: rgba(0, 0, 0, 0.4);
}

.modal-content {
  background-color: #fefefe;
  margin: 15% auto;
  padding: 20px;
  border: 1px solid #888;
  width: 300px;
}

.close {
  color: #aaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: black;
  text-decoration: none;
  cursor: pointer;
}

#paymentPassword {
  width: 100%;
  padding: 10px;
  margin-bottom: 10px;
}

#confirmPayment {
  width: 100%;
  padding: 10px;
}

expiryMonth{
  margin-left: 300px;
}



</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$(function(){
		$('#btnZipcode').click(function(){
			open("../zipcode/zipcode.jsp", "", "width=500, height=700, left=150, location=1");
		});
	});
	
    $("#email2").change(function() {
        var selectedOption = $(this).val();
        if (selectedOption === "etc") {
            $("#email3").css("visibility", "visible");
        } else {
            $("#email3").css("visibility", "hidden");
        }
    });
    
    $(".delivery select[name='request']").change(function() {
        var selectedOption = $(this).val();
        if (selectedOption === "request5") {
            $(".delivery input[name='request']").css("display", "block");
        } else {
            $(".delivery input[name='request']").css("display", "none");
        }
    });
    
    $(".final input[type='submit']").click(function(event) {
      event.preventDefault();

      var modal = document.getElementById("paymentModal");
      modal.style.display = "block";
    });


    $(".close").click(function() {
      var modal = document.getElementById("paymentModal");
      modal.style.display = "none";
    });

    
    $("#confirmPayment").click(function() {
      
      var paymentPassword = $("#paymentPassword").val();

      if (paymentPassword !== "1234") {
        alert("결제 비밀번호가 올바르지 않습니다. 다시 확인해주세요.");
        
        $("#paymentPassword").val("");
        return;
      }      
      location.href = "OrderCompleted.jsp"; 
    });
 
});
</script>
</head>
<%
	String id = (String)session.getAttribute("id");

	MemberService service = new MemberService();
	MemberVO vo = service.selectMember(id); 
	
	String pdsize=request.getParameter("pdsize");
	String pdqty=request.getParameter("pdqty");
	
	String[] pdsizeArr=pdsize.split(" ");
	String[] pdpriceArr=pdqty.split(" ");
	
	String size="";
	for(int i=0;i<pdsizeArr.length;i++){
		size=pdsizeArr[i];%>
		<script>
			alert(<%=pdqty%>);
		</script><%
	}
%>
<body>
	<div id="Payment">
	<!-- header  -->
	<header> 01.장바구니 > <strong>02.주문결제 ></strong>03.주문완료</header>
	<hr>
	</div>
	<div id="Paymentbody">
		<section class="pt_table">
				<nav>
				</nav>
				<form action="#">
        <table class="basket_list">
            <form>            	             	
                <thead>
                    <tr>
                        <td></td>
                        <td>상품정보</td>
                        <td>상품 주문 수량</td>
                        <td>총 상품금액</td>
                        <td>배송비</td>                                               
                    </tr>
                </thead>
                <tbody>
                    <tr class="basket_list_detail">
                        <td><img src="https://image.a-rt.com/art/product/2023/05/73554_1683853295803.jpg?shrink=590:590" alt="1"></td>
                        <td>아디다스<span class="basket_list_smartstore"></span>
                            <p>아디코드</p>                       
                        </td>
                       	<td>1개</td>                  
                        <td><span class="sumprice">63,000원</span><br>                            
                        </td>
                        <td>무료</td>
                    </tr>
                    <tr class="basket_list_detail">
                        <td style="width: 13%;">
                            <img src="https://image.a-rt.com/art/product/2020/10/29855_1603086614649.jpg?shrink=590:590" alt="1">
                        </td>
                        <td style="width: 27%">나이키<span class="basket_list_smartstore"></span>
                            <p>스탠 스미스</p>
                        </td>
                        <td>1개</td>    
                        <td style="width: 15%;"><span class="sumprice">29,000원</span><br>                            
                        </td>
                        <td style="width: 15%;">무료</td>
                    </tr>
                </tbody>                
            </form>
        </table><br><br>
        
        <!-- 최종 결제 정보 -->
		<div class="final">
			<h2>&& 최종결제 정보 &&</h2>
			<table>
				<tr>
					<td>상품 수량</td>
					<td>2건</td>
				</tr>
				<tr>
					<td>상품 금액</td>
					<td>92,000원</td>
				</tr>
				<tr>
					<td>배송비</td>
					<td>무료</td>
				</tr>
				<tr>
					<td>합계</td>
					<td>92,000원</td>
				</tr>
			</table>
			<input type="submit" value="결제하기">
		</div>
		<!-- 주문 고객정보 -->
		
		<!-- 배송정보 -->
			<article class="delivery">
				<h1>&& 배송정보 &&</h1>	
				<table>
					<tr>					
						<td>주문인</td>
						<td style="text-align: left;"><input type="text" name="name" value="<%=vo.getName()%>"></td>
					</tr>
					<tr>
						<td>휴대폰</td>
						<td style="text-align: left;">
							<select name="phone" style="width: 50px; height:25px;">
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="012">012</option>							
							</select> -
						  	<input type="text" name="phone2" id="phone2" maxlength="4" style="width: 50px;"> -
                			<input type="text" name="phone3" id="phone3" maxlength="4" style="width: 50px;">
                		</td>
					</tr>
					<tr>
						<td>이메일</td>
						<td style="text-align: left;">
							<input type="text" name="email" value="<%=vo.getEmail()%>">@ 
						    <select name="email2" id="email2"  title="이메일주소 뒷자리">
				            <option value="naver.com">naver.com</option>
				            <option value="hanmail.net">hanmail.net</option>
				            <option value="nate.com">nate.com</option>
				            <option value="gmail.com">gmail.com</option>
				            <option value="etc">직접입력</option>
				            </select>
				            <input type="text" name="email3" id="email3" title="직접입력인 경우 이메일주소 뒷자리" style="visibility:hidden;">      				
						</td>
					</tr>
					<tr>
						<td>우편번호</td>
						<td style="text-align: left;"><input type="text" name="zip" value="<%=vo.getZipno()%>">
							<input type="button" value="우편번호찾기" id="btnZipcode">
						</td>
					</tr>
					<tr>
						<td>주소</td>
						<td style="text-align: left;">
						<input type="text" name="addr" value="<%=vo.getDetailaddress()%>">
						</td>
					</tr>
                    <tr>
                        <td>배송시 요청사항</td>
                        <td style="text-align: left;">
                        <select name="request" style="width: 300px; height:25px;">
							<option value="request1">배송전에 연락주세요</option>
							<option value="request2">부재실 경비실에 맡겨주세요</option>
							<option value="request3">부재실 문앞에 놓아주세요</option>
							<option value="request4">직접 수령 하겠습니다</option>							
							<option value="request5">직접입력</option>							
						</select><br>
                        <input type="text" name="request" style="display: none;">                        
                        
                        </td>
                    </tr>					
				</table>
			</article>		
			
		<!-- 결제 수단선택 -->
			<article class="Payment_method"><br>
				<h1> && 카드정보 && </h1>
				<table>
					<tr>
						<td>카드사</td>
						<td style="text-align: left;">
						<select name="card_company" style="width: 200px;">
							<option value="국민은행">국민은행</option>
							<option value="하나은행">하나은행</option>
							<option value="신한은행">신한은행</option>
							<option value="우리은행">우리은행</option>
						</select>
						</td>	
					</tr>
					<tr>
						<td>카드번호</td>
						<td style="text-align: left;">
						<input type="text" name="card_number1" id="card_number1" maxlength="4" style="width: 50px;"> -
						<input type="text" name="card_number2" id="card_number2" maxlength="4" style="width: 50px;"> -
						<input type="text" name="card_number3" id="card_number3" maxlength="4" style="width: 50px;"> -				
						<input type="text" name="card_number4" id="card_number4" maxlength="4" style="width: 50px;"> 				
						</td>
					</tr>
					<tr>
                        <td>유효기간</td>                        
                        <td style="float: left;">                                                    
                            <select name="expiryYear">
                                <option value="2023">2023</option>
                                <option value="2024">2024</option>
                                <option value="2025">2025</option>
                                <option value="2026">2026</option>
                                <option value="2027">2027</option>
                                <option value="2028">2028</option>
                                <option value="2029">2029</option>
                                <option value="2030">2030</option>
                            </select>
                            <span>년</span>
                            <select name="expiryMonth">
                                <option value="01">01</option>
                                <option value="02">02</option>
                                <option value="03">03</option>
                                <option value="04">04</option>
                                <option value="05">05</option>
                                <option value="06">06</option>
                                <option value="07">07</option>
                                <option value="08">08</option>
                                <option value="09">09</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                            </select>
                            <span>월</span>
                        </td>                       
					</tr>	
					<tr>
					<td>CVC</td>
					<td style="text-align: left;">	
					<input type="text" name="cvc_number" id="cvc_number" maxlength="3" style="width: 50px;">				
					</td>
					</tr>			
				</table>
			</article>		
		
		
		<!-- 하단 설명 -->
           <article class="alert">
                <ul>
			        <li>품절 취소 안내!</li>
					<li>상품 품절로 인해 주문 후 취소될 수 있습니다. 품절 취소 시 결제하신 수단으로 자동 환불되며,</li>
					<li>품절 보상 쿠폰을 발급해드립니다. (일부 상품은 쿠폰 발급이 제외될 수 있습니다.) </li>
					<li>※ 결제하신 수단으로 환불이 불가능할 경우 별도 안내드립니다.</li>
                </ul>
           </article>					
		</form>
	</section>
</div>
<div id="paymentModal" class="modal">
  <div class="modal-content">
    <span class="close">&times;</span>
    <h2>결제 비밀번호</h2>
    <input type="password" id="paymentPassword" placeholder="결제 비밀번호를 입력하세요">
    <button id="confirmPayment">확인</button>
  </div>
</div>
</body>
</html>
<%@include file="../../inc/bottom.jsp" %>
