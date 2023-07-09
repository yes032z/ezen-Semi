<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp" %>
<%@ include file="../../inc/mypagenav.jsp" %>
<link href="../../css/mypage.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	

</script>
<article id="mypage">
	<div class="orderinfo">
		<div id="orderinfo-first">재고 알림</div>
		<div id="orderinfo-third">
			<table class="table table-hover">
			<colgroup>
				<col style="width:5%;" />
				<col style="width:30%;" />	
				<col style="width:30%;" />	
				<col style="width:15%;" />	
				<col style="width:20%;" />		
			</colgroup>
    <thead class="thead-dark">
        <tr>
            <th></th>
            <th>이미지</th>
            <th>상품명</th>
            <th>수량</th>
            <th>금액</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><input type="checkbox" name="1" class="chkItem" value=""></td>
            <td>
                <div class="media">
                    <img src="" class="mr-3 pdimgsize" alt="1">
                    <div class="media-body">
                        <h5 class="mt-0"><a href="#">상품명</a></h5>
                    </div>
                </div>
            </td> 
            <td>30,000원</td>
            <td>7%</td>
            <td>2500원</td>
        </tr>
    </tbody>                  
</table>
	<input type="button" class="mypagebtn2" name="del" value="알림삭제하기">
			</div>
		</div>

</article>
<%@ include file="../../inc/bottom.jsp" %>