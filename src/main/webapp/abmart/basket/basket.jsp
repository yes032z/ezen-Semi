<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>장바구니 홈페이지</title>
<!--  스타일 -->
<style type= "text/css">
     #product > .cart > form {}

     #product > .cart > form > table {
    width: 100%;
    border-bottom: 1px solid #d3d3d3;
    border-collapse: collapse;
    border-spacing: 0;
}

#product > .cart > form > table tr { border-bottom: 1px solid #d3d3d3 ;}

#product > .cart > form > table th:first-child {width: 60px;}

#product > .cart > form > table th {
    padding: 12px 0;
    border-top: 2px solid #000;
    border-bottom: 1px solid #d3d3d3;
    background: #fff;
    color: #383838;
    font-size: 0.95em;
    text-align: center;
    letter-spacing: -0.1em;
}

#product > .cart > form > table .empty { display: none ;}

#product > .cart > form > table td { text-align: center;}

#product > .cart > form > table td:last-child {
    color: #ff006c;
    font-weight: bold;
}

#product > .cart > form > table th > input {}



#product > .cart > form > table tr > td > input {}

#product > .cart > form > table td > article {
    padding: 6px;
    overflow: hidden;
}

#product > .cart > form > table td > article > a {
    float: left;
    display: inline-block;
}

#product > .cart > form > table td > article > a > img { width: 80px;}

#product > .cart > form > table td > article > div {
    float: left;
    margin-left: 10px;
}

#product > .cart > form > table td > article > div > h2 { text-align: left; }

#product > .cart > form > table td > article > div > p {
    text-align: left;
    color: #777;
    margin-top: 4px;
}

#product > .cart > form > input[name=del] {
    border-color: #bdbdbd;
    border-bottom-color: #828282;
    background: #fafafa;
    color: #4d4d4d;
    padding: 6px 11px;
    border-width: 1px;
    margin-top: 6px;
}

#product > .cart > form > .total {
    float: right;
    width: 360px;
    height: 412px;
    padding: 20px;
    margin-top: 12px;
    background: #fff;
    border: 1px solid #d3d3d3;
    box-sizing: border-box;
}

#product > .cart > form > .total > h2 {
    width: 100%;
    font-weight: bold;
    font-size: 16px;
    border-bottom: 1px solid #111;
    margin-bottom: 10px;
    padding-bottom: 10px;
    box-sizing: border-box;
    color: #1e1e1e;
}

#product > .cart > form > .total > table { width: 100%; }

#product > .cart > form > .total > table tr:nth-last-child(1) td {
    font-size: 20px;
}

#product > .cart > form > .total > table tr:nth-last-child(1) td:last-child {
    color: #ff006c;
    font-size: 20px;
    font-weight: bold;
}

#product > .cart > form > .total > table td {
    padding: 10px 0;
    font-size: 14px;
    color: #555;
}

#product > .cart > form > .total > table td:last-child { text-align: right; }

#product > .cart > form > .total > input[type=submit] {
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
</style>
<!-- 기능 -->
<script type="text/javascript" src="../js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('sumbit').click(function(){
			
		});
	});

</script>
</head>
<body>
<!-- 보여주기 -->
<main id="product">
	<!--  제목 -->
	<h1>장바구니</h1>
	<!--  장바구니함 -->
    <section class="cart">
       <form action="#">
            <table border="0">
                <tr>
                    <th><input type="checkbox" name="all"></th>
                    <th>상품명</th>
                    <th>총수량</th>
                    <th>판매가</th>
                    <th>할인</th>
                    <th>포인트</th>
                    <th>배송비</th>
                    <th>소계</th>
                </tr>
                <tr class="empty">
                    <td colspan="7">장바구니에 상품이 없습니다.</td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="1"></td>
                    <td><article>
                        <a href="#">
                            <img src="	https://via.placeholder.com/80x80" alt="1">
                        </a>
                    </article></td>
                    <td>1개</td>
                    <td>27,000원</td>
                    <td>5%</td>
                    <td>256.5P</td>
                    <td>2500원</td>
                    <td>25,650원</td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="1"></td>
                    <td><article>
                        <a href="#">
                            <img src="	https://via.placeholder.com/80x80" alt="1">
                        </a>
                    </article></td>
                    <td>1개</td>
                    <td>27,000원</td>
                    <td>5%</td>
                    <td>256.5P</td>
                    <td>2500원</td>
                    <td>25,650원</td>
                </tr>
            </table>
            <input type="button" name="del" value="전체삭제">
            <input type="button" name="del" value="선택삭제">
            <div class="total">
            	<!-- 주문 확인 -->
                <h2>전체합계</h2>
                <table>
                    <tr>
                        <td>상품수</td>
                        <td>2개</td>
                    </tr>
                    <tr>
                        <td>상품금액</td>
                        <td>51,300원</td>
                    </tr>
                    <tr>
                        <td>할인금액</td>
                        <td>2700원</td>
                    </tr>
                    <tr>
                        <td>배송비</td>
                        <td>2500원</td>
                    </tr>
                    <tr>
                        <td>포인트</td>
                        <td>513P</td>
                    </tr>
                    <tr>
                        <td>전체주문금액</td>
                        <td>26,000원</td>
                    </tr>
                </table>
                <input type="submit" value="주문하기">
            </div>
       </form>
    </section>
</main>
</body>
</html>
