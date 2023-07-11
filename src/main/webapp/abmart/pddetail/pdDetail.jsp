<%@page import="com.semi.review.model.ReviewService"%>
<%@page import="com.semi.stock.model.StockService"%>
<%@page import="com.semi.review.model.ReviewVO"%>
<%@page import="com.semi.productdetail.model.ProductDetailVO"%>
<%@page import="com.semi.productdetail.model.ProductDetailService"%>
<%@page import="com.semi.productsize.model.ProductSizeVO"%>
<%@page import="com.semi.productsize.model.ProductSizeService"%>
<%@page import="com.semi.stock.model.StockVO"%>
<%@page import="java.util.List"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.semi.product.model.ProductVO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../inc/top.jsp"%>

<%
	String pdno = request.getParameter("pdno");
	String grade=request.getParameter("grade");
	String lately=request.getParameter("lately");
	
	ProductSizeService productSizeService = new ProductSizeService();
	ProductDetailService productDetailService = new ProductDetailService();
	
	if (pdno == null || pdno.isEmpty()) {
	%>
		<script>
			alert("잘못된 url입니다.");
			history.back();
		</script>
		<%return;
	}
	if(grade==null || grade.isEmpty()){
		grade="";
	}
	if(lately==null || lately.isEmpty()){
		lately="";
	}
	StockService stockService =new StockService();
	ReviewService reviewService=new ReviewService();
	
	ProductVO vo = null;
	List<StockVO> list = null;
	List<ProductSizeVO> sizeList = null;
	List<ProductDetailVO> detailList = null;
	List<ReviewVO> reviewList=null;
	
	try {
		//사이즈 가져오기
		list = stockService.stockSelectByPdNo(Integer.parseInt(pdno));
		sizeList = productSizeService.selectAllByNo(Integer.parseInt(pdno));
		vo = pdService.selectPdByNo(Integer.parseInt(pdno));
	
		//상세이미지 가져오기
		detailList = productDetailService.selectByPdNo(Integer.parseInt(pdno));
		
		if(lately.equals("lately")){
			//리뷰 최근 등록순
			reviewList=reviewService.selectLately(Integer.parseInt(pdno));
		}
		
		
		if(grade.equals("low")){
			//리뷰 평점 낮은순
			reviewList=reviewService.selectGradeLow(Integer.parseInt(pdno));	
		}else{
			//리뷰 평점 높은순
			reviewList=reviewService.selectGradeHigh(Integer.parseInt(pdno));
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}
	
	if (vo==null) {%>
		<script>
			alert("해당 상품이 존재하지 않습니다.");
			history.back();
		</script>
	<%return;
	}

	DecimalFormat df = new DecimalFormat("#,###");
%>
<script type="text/javascript">
	$(function() {
		$('.alink1').eq(0).css('border','1px solid black');
		$('.alink1').click(function() {
			$('.alink1').css('border','');
			$(this).css('border','1px solid black');
			$('.alink2').css('border','');
			$('.alink3').css('border','');
			$('.alink1').eq(0).focus();
		});
		$('.alink2').click(function() {
			$('.alink2').css('border','');
			$(this).css('border','1px solid black');
			$('.alink1').css('border','');
			$('.alink3').css('border','');
			$('.alink2').eq(1).focus();
		});
		$('.alink3').click(function() {
			$('.alink3').css('border','');
			$(this).css('border','1px solid black');
			$('.alink1').css('border','');
			$('.alink2').css('border','');
			$('.alink3').eq(2).focus();
		});
		$('#basket').click(function(){
			each();
			if($('#pdqty2').val().length<1){
				alert("장바구니에 담으실 상품을 고르세요");
				event.preventDefault();
			}
		});
		$('#order').click(function(){
			each();
			
			if($('#pdqty2').val().length<1){
				alert("구매하실 상품을 고르세요");
				event.preventDefault();
			}
		});
		
		$('#review').click(function(){
			open('../reviewWrite.jsp?pdno=<%=pdno%>','review','width=600,height=900,top=300,left=700,location=yes,resizable=yes');
		});
		var bool1=false;
		var bool2=false;
		var bool3=false;
		var bool4=false;
		var bool5=false;
		var bool6=false;
		var bool7=false;
		var bool8=false;
		var bool9=false;
		
		$('button[name=size]').click(function(){
			var size=$(this).html();
			if(!bool8){
				if(size==220){
					var tag="<div name='pddetail'>"
						+"<div style='float: left;margin-left: 50px;font-size: 1.2em;'>"+size+"</div>"
						+"<div style='float: left;margin-left: 200px'><button class='btn plus_btn size' name='plus'>+</button>"
						+" <input type='text' class='quantity-input' name=size id='pd"+size+"' style='width: 45px;'>"
						+"<button class='btn minus_btn size' name='minus'>-</button>"
						+"</div>"
						+"<div name='sumprice"+size+"' style='float: left;margin-left: 50px;font-size: 1.2em;'>"
						+"<%=vo.getPrice()%></div><span class='leftSort'>원</span>"
						+"<button class='btn size' name='close'>X</button>"
				        +"</div>";
					$('div[name=pddetail-group]').prepend(tag);
					$('#pd'+size).val(1);
					var price=$('#sumprice').html();
					var sumprice=parseInt(<%=vo.getPrice()%>)+parseInt(price);
					$('#sumprice').text(sumprice);
					bool8=true;
					
					//누르면 input에 사이즈 입력
					var pdsize=$('#pdsize').val();
					$('#pdsize').val(pdsize+size+' ');
				}
			}else{
				if(size==220){
					var pdsizeval=$('#pd'+size).val();
					var qty=parseInt(pdsizeval)+1;
					$('#pd'+size).val(qty);
					var price=$('#sumprice').html();
					var sumprice=parseInt(price)+parseInt(<%=vo.getPrice()%>);
					$('#sumprice').text(sumprice);
					
					var result= parseInt(qty)*parseInt(<%=vo.getPrice()%>);
					$(this).parent().parent().find('div[name=sumprice'+size+']').html(result);
				}
			}
			if(!bool9){
				if(size==225){
					var tag="<div name='pddetail'>"
						+"<div style='float: left;margin-left: 50px;font-size: 1.2em;'>"+size+"</div>"
						+"<div style='float: left;margin-left: 200px'><button class='btn plus_btn size' name='plus'>+</button>"
						+" <input type='text' class='quantity-input' name=size id='pd"+size+"' style='width: 45px;'>"
						+"<button class='btn minus_btn size' name='minus'>-</button>"
						+"</div>"
						+"<div name='sumprice"+size+"' style='float: left;margin-left: 50px;font-size: 1.2em;'>"
						+"<%=vo.getPrice()%></div><span class='leftSort'>원</span>"
						+"<button class='btn size' name='close'>X</button>"
				        +"</div>";
					$('div[name=pddetail-group]').prepend(tag);
					$('#pd'+size).val(1);
					var price=$('#sumprice').html();
					var sumprice=parseInt(<%=vo.getPrice()%>)+parseInt(price);
					$('#sumprice').text(sumprice);
					bool9=true;
					
					var pdsize=$('#pdsize').val();
					$('#pdsize').val(pdsize+size+' ');
				}
			}else{
				if(size==225){
					var pdsizeval=$('#pd'+size).val();
					var qty=parseInt(pdsizeval)+1;
					$('#pd'+size).val(qty);
					var price=$('#sumprice').html();
					var sumprice=parseInt(price)+parseInt(<%=vo.getPrice()%>);
					$('#sumprice').text(sumprice);
					
					var result= parseInt(qty)*parseInt(<%=vo.getPrice()%>);
					$(this).parent().parent().find('div[name=sumprice'+size+']').html(result);
				}
			}
			if(!bool1){
				if(size==230){
					var tag="<div name='pddetail'>"
						+"<div style='float: left;margin-left: 50px;font-size: 1.2em;'>"+size+"</div>"
						+"<div style='float: left;margin-left: 200px'><button class='btn plus_btn size' name='plus'>+</button>"
						+" <input type='text' class='quantity-input' name=size id='pd"+size+"' style='width: 45px;'>"
						+"<button class='btn minus_btn size' name='minus'>-</button>"
						+"</div>"
						+"<div name='sumprice"+size+"' style='float: left;margin-left: 50px;font-size: 1.2em;'>"
						+"<%=vo.getPrice()%></div><span class='leftSort'>원</span>"
						+"<button class='btn size' name='close'>X</button>"
				        +"</div>";
					$('div[name=pddetail-group]').prepend(tag);
					$('#pd'+size).val(1);
					var price=$('#sumprice').html();
					var sumprice=parseInt(<%=vo.getPrice()%>)+parseInt(price);
					$('#sumprice').text(sumprice);
					bool1=true;
					
					var pdsize=$('#pd'+size).val();
					$('#pdsize').val(pdsize+size+' ');
				}
			}else{
				if(size==230){
					var pdsizeval=$('#pd'+size).val();
					var qty=parseInt(pdsizeval)+1;
					$('#pd'+size).val(qty);
					var price=$('#sumprice').html();
					var sumprice=parseInt(price)+parseInt(<%=vo.getPrice()%>);
					$('#sumprice').text(sumprice);
					
					var result= parseInt(qty)*parseInt(<%=vo.getPrice()%>);
					$(this).parent().parent().find('div[name=sumprice'+size+']').html(result);
				}
			}
			
			if(!bool2){
				if(size==235){
					var tag="<div name='pddetail'>"
						+"<div style='float: left;margin-left: 50px;font-size: 1.2em;'>"+size+"</div>"
						+"<div style='float: left;margin-left: 200px'><button class='btn plus_btn size' name='plus'>+</button>"
						+" <input type='text' class='quantity-input' name=size id='pd"+size+"' style='width: 45px;'>"
						+"<button class='btn minus_btn size' name='minus'>-</button>"
						+"</div>"
						+"<div name='sumprice"+size+"' style='float: left;margin-left: 50px;font-size: 1.2em;'>"
						+"<%=vo.getPrice()%></div><span class='leftSort'>원</span>"
						+"<button class='btn size' name='close'>X</button>"
				        +"</div>";
					$('div[name=pddetail-group]').prepend(tag);
					$('#pd'+size).val(1);
					var price=$('#sumprice').html();
					var sumprice=parseInt(<%=vo.getPrice()%>)+parseInt(price);
					$('#sumprice').text(sumprice);
					bool2=true;
					
					var pdsize=$('#pdsize').val();
					$('#pdsize').val(pdsize+size+' ');
				}
			}else{
				if(size==235){
					var pdsizeval=$('#pd'+size).val();
					var qty=parseInt(pdsizeval)+1;
					$('#pd'+size).val(qty);
					var price=$('#sumprice').html();
					var sumprice=parseInt(price)+parseInt(<%=vo.getPrice()%>);
					$('#sumprice').text(sumprice);
					
					var result= parseInt(qty)*parseInt(<%=vo.getPrice()%>);
					$(this).parent().parent().find('div[name=sumprice'+size+']').html(result);
				}
			}
			
			if(!bool3){
				if(size==240){
					var tag="<div name='pddetail'>"
						+"<div style='float: left;margin-left: 50px;font-size: 1.2em;'>"+size+"</div>"
						+"<div style='float: left;margin-left: 200px'><button class='btn plus_btn size' name='plus'>+</button>"
						+" <input type='text' class='quantity-input' name=size"+" id='pd"+size+"' style='width: 45px;'>"
						+"<button class='btn minus_btn size' name='minus'>-</button>"
						+"</div>"
						+"<div name='sumprice"+size+"' style='float: left;margin-left: 50px;font-size: 1.2em;'>"
						+"<%=vo.getPrice()%></div><span class='leftSort'>원</span>"
						+"<button class='btn size' name='close'>X</button>"
				        +"</div>";
					$('div[name=pddetail-group]').prepend(tag);
					$('#pd'+size).val(1);
					var price=$('#sumprice').html();
					var sumprice=parseInt(<%=vo.getPrice()%>)+parseInt(price);
					$('#sumprice').text(sumprice);
					bool3=true;
					
					var pdsize=$('#pdsize').val();
					$('#pdsize').val(pdsize+size+' ');
				}
			}else{
				if(size==240){
					var pdsizeval=$('#pd'+size).val();
					var qty=parseInt(pdsizeval)+1;
					$('#pd'+size).val(qty);
					var price=$('#sumprice').html();
					var sumprice=parseInt(price)+parseInt(<%=vo.getPrice()%>);
					$('#sumprice').text(sumprice);
					
					var result= parseInt(qty)*parseInt(<%=vo.getPrice()%>);
					$(this).parent().parent().find('div[name=sumprice'+size+']').html(result);
				}
			}
			
			if(!bool4){
				if(size==245){
					var tag="<div name='pddetail'>"
						+"<div style='float: left;margin-left: 50px;font-size: 1.2em;'>"+size+"</div>"
						+"<div style='float: left;margin-left: 200px'><button class='btn plus_btn size' name='plus'>+</button>"
						+" <input type='text' class='quantity-input' name=size id='pd"+size+"' style='width: 45px;'>"
						+"<button class='btn minus_btn size' name='minus'>-</button>"
						+"</div>"
						+"<div name='sumprice"+size+"' style='float: left;margin-left: 50px;font-size: 1.2em;'>"
						+"<%=vo.getPrice()%></div><span class='leftSort'>원</span>"
						+"<button class='btn size' name='close'>X</button>"
				        +"</div>";
					$('div[name=pddetail-group]').prepend(tag);
					$('#pd'+size).val(1);
					var price=$('#sumprice').html();
					var sumprice=parseInt(<%=vo.getPrice()%>)+parseInt(price);
					$('#sumprice').text(sumprice);
					bool4=true;
					
					var pdsize=$('#pdsize').val();
					$('#pdsize').val(pdsize+size+' ');
				}
			}else{
				if(size==245){
					var pdsizeval=$('#pd'+size).val();
					var qty=parseInt(pdsizeval)+1;
					$('#pd'+size).val(qty);
					var price=$('#sumprice').html();
					var sumprice=parseInt(price)+parseInt(<%=vo.getPrice()%>);
					$('#sumprice').text(sumprice);
					
					var result= parseInt(qty)*parseInt(<%=vo.getPrice()%>);
					$(this).parent().parent().find('div[name=sumprice'+size+']').html(result);
				}
			}
			
			if(!bool5){
				if(size==250){
					var tag="<div name='pddetail'>"
						+"<div style='float: left;margin-left: 50px;font-size: 1.2em;'>"+size+"</div>"
						+"<div style='float: left;margin-left: 200px'><button class='btn plus_btn size' name='plus'>+</button>"
						+" <input type='text' class='quantity-input' name=size id='pd"+size+"' style='width: 45px;'>"
						+"<button class='btn minus_btn size' name='minus'>-</button>"
						+"</div>"
						+"<div name='sumprice"+size+"' style='float: left;margin-left: 50px;font-size: 1.2em;'>"
						+"<%=vo.getPrice()%></div><span class='leftSort'>원</span>"
						+"<button class='btn size' name='close'>X</button>"
				        +"</div>";
					$('div[name=pddetail-group]').prepend(tag);
					$('#pd'+size).val(1);
					var price=$('#sumprice').html();
					var sumprice=parseInt(<%=vo.getPrice()%>)+parseInt(price);
					$('#sumprice').text(sumprice);
					bool5=true;
					
					var pdsize=$('#pdsize').val();
					$('#pdsize').val(pdsize+size+' ');
				}
			}else{
				if(size==250){
					var pdsizeval=$('#pd'+size).val();
					var qty=parseInt(pdsizeval)+1;
					$('#pd'+size).val(qty);
					var price=$('#sumprice').html();
					var sumprice=parseInt(price)+parseInt(<%=vo.getPrice()%>);
					$('#sumprice').text(sumprice);
					
					var result= parseInt(qty)*parseInt(<%=vo.getPrice()%>);
					$(this).parent().parent().find('div[name=sumprice'+size+']').html(result);
				}
			}
			
			if(!bool6){
				if(size==255){
					var tag="<div name='pddetail'>"
						+"<div style='float: left;margin-left: 50px;font-size: 1.2em;'>"+size+"</div>"
						+"<div style='float: left;margin-left: 200px'><button class='btn plus_btn size' name='plus'>+</button>"
						+" <input type='text' class='quantity-input' name=size id='pd"+size+"' style='width: 45px;'>"
						+"<button class='btn minus_btn size' name='minus'>-</button>"
						+"</div>"
					    +"<div name='sumprice"+size+"' style='float: left;margin-left: 50px;font-size: 1.2em;'>"
					    +"<%=vo.getPrice()%></div><span class='leftSort'>원</span>"
					    +"<button class='btn size' name='close'>X</button>"
				        +"</div>";
					$('div[name=pddetail-group]').prepend(tag);
					$('#pd'+size).val(1);
					var price=$('#sumprice').html();
					var sumprice=parseInt(<%=vo.getPrice()%>)+parseInt(price);
					$('#sumprice').text(sumprice);
					bool6=true;
					
					var pdsize=$('#pdsize').val();
					$('#pdsize').val(pdsize+size+' ');
				}
			}else{
				if(size==255){
					var pdsizeval=$('#pd'+size).val();
					var qty=parseInt(pdsizeval)+1;
					$('#pd'+size).val(qty);
					var price=$('#sumprice').html();
					var sumprice=parseInt(price)+parseInt(<%=vo.getPrice()%>);
					$('#sumprice').text(sumprice);
					
					var result= parseInt(qty)*parseInt(<%=vo.getPrice()%>);
					$(this).parent().parent().find('div[name=sumprice'+size+']').html(result);
				}
			}
			
			if(!bool7){
				if(size==260){
					var tag="<div name='pddetail'>"
						+"<div style='float: left;margin-left: 50px;font-size: 1.2em;'>"+size+"</div>"
						+"<div style='float: left;margin-left: 200px'>"
						+"<button class='btn plus_btn size' name='plus'>+</button>"
						+" <input type='text' class='quantity-input' name=size id='pd"+size+"' style='width: 45px;'>"
						+"<button class='btn minus_btn size' name='minus'>-</button>"
						+"</div>"
					    +"<div name='sumprice"+size+"' style='float: left;margin-left: 50px;font-size: 1.2em;'>"
					    +"<%=vo.getPrice()%></div><span class='leftSort'>원</span>"
					    +"<button class='btn size' name='close'>X</button>"
				        +"</div>";
					$('div[name=pddetail-group]').prepend(tag);
					$('#pd'+size).val(1);
					var price=$('#sumprice').html();
					var sumprice=parseInt(<%=vo.getPrice()%>)+parseInt(price);
					$('#sumprice').text(sumprice);
					bool7=true;
					
					var pdsize=$('#pdsize').val();
					$('#pdsize').val(pdsize+size+' ');
				}
			}else{
				if(size==260){
					var pdsizeval=$('#pd'+size).val();
					var qty=parseInt(pdsizeval)+1;
					$('#pd'+size).val(qty);
					var price=$('#sumprice').html();
					var sumprice=parseInt(price)+parseInt(<%=vo.getPrice()%>);
					$('#sumprice').text(sumprice);
					
					var result= parseInt(qty)*parseInt(<%=vo.getPrice()%>);
					$(this).parent().parent().find('div[name=sumprice'+size+']').html(result);
				}
			}
		});

		$('div[name=pddetail-group]').on('click', 'button[name=plus]',function(){
			var size=$(this).parent().parent().find('div').eq(0).html();
			var qty=$(this).parent().find('input').val();
			var resultqty=parseInt(qty)+1;
			$(this).parent().find('input').val(resultqty);
			
			var price= <%=vo.getPrice()%>;
			var sumprice= parseInt(price)*parseInt(resultqty);
			$(this).parent().parent().find('div[name=sumprice'+size+']').html(sumprice);
			var result=$('#sumprice').html();
			
			var res=parseInt(result)+<%=vo.getPrice()%>;
			$('#sumprice').html(res);
		});
		
		$('div[name=pddetail-group]').on('click', 'button[name=minus]',function(){
			var size=$(this).parent().parent().find('div').eq(0).html();
			var qty=$(this).parent().find('input').val();
			if(qty==1){
				return;
			}
			var resultqty=parseInt(qty)-1;
			$(this).parent().find('input').val(resultqty);
			
			var price=<%=vo.getPrice()%>;
			var sumprice=parseInt(price)*parseInt(resultqty);
			
			$(this).parent().parent().find('div[name=sumprice'+size+']').html(sumprice);
			var result=$('#sumprice').html();
			
			var res=result=parseInt(result)-<%=vo.getPrice()%>;
			$('#sumprice').html(res);
			
		});
		
		$('div[name=pddetail-group]').on('click', 'button[name=close]',function(){
			var size=$(this).parent('div[name=pddetail]').find('div').eq(0).html();
			var sizesumprice=$(this).parent('div[name=pddetail]').find('div[name=sumprice'+size+']').html();
			
			var sumprice=$('#sumprice').html();
			var result=parseInt(sumprice)-parseInt(sizesumprice);
			$('#sumprice').html(result);
			$(this).parent().remove();
			
			var pdsize=$('#pdsize').val();
			var resultSize='';
			if(pdsize.indexOf(size)!=-1){
				var pdsize1=pdsize.substr(0,pdsize.indexOf(size));
				var pdsize2=pdsize.substr(pdsize.indexOf(size)+4);
				
				resultSize=pdsize1+pdsize2;
				$('#pdsize').val(resultSize);
			}
			
			
			if(size==230){
				bool1=false;
			}else if(size==235){
				bool2=false;
			}else if(size==240){
				bool3=false;
			}else if(size==245){
				bool4=false;
			}else if(size==250){
				bool5=false;
			}else if(size==255){
				bool6=false;
			}else if(size==260){
				bool7=false;
			}else if(size==220){
				bool8=false;
			}else if(size==225){
				bool9=false;
			}
			
		});
		
      	const productData = {
    	   pdno: <%=vo.getPdno() %>,
    	   pdname: '<%=vo.getPdname() %>',
    	   filename: '<%=vo.getFilename() %>',
    	   brand: '<%=vo.getBrand() %>',
    	   price: <%=vo.getPrice() %>
    	};
		
	   	const storedData = localStorage.getItem('products');
	    let storedProducts = storedData ? JSON.parse(storedData) : [];

	    const targetIndex = storedProducts.findIndex((product) => product.pdno === productData.pdno);

        // 중복 제거
	    if (targetIndex === -1) {
		    storedProducts.unshift(productData); // 중복되지 않은 경우 배열의 첫 번째에 추가

	        if (storedProducts.length > 4) {
	          storedProducts.pop(); // 4건 이상일 경우 마지막 항목 제거
	        }
	      }

	    localStorage.setItem('products', JSON.stringify(storedProducts));
	    
	});
	
	function each(){
		var sumqty='';
		var sumsize='';
		$('input[name=size]').each(function(index){
			var size=$(this).parent().parent().find('div').eq(0).html();
	    	var qty=$(this).val();
	    	sumsize+=size+' ';
	    	sumqty+=qty+' ';
	    });
		$('#pdsize1').val(sumsize);
		$('#pdsize2').val(sumsize);
		$('#pdqty1').val(sumqty);
		$('#pdqty2').val(sumqty);
	}
</script>
<section class="py-5">
	<!-- 상품 이미지 -->
	<div
		style="width: 500px; height: 900px; margin-left: 100px; float: left;">
		<img class="card-img-top" src="../../images/<%=vo.getFilename()%>"
			alt="상품 이미지" />
	</div>
	<!-- 상품 정보 -->
	<div
		style="float: left; margin-left: 100px; width: 600px; height: 700px;">
		<div
			style="font-size: 1.5em; font-weight: bold; float: left; width: 600px;">
			<span style="float: left;">상품명</span><span><%=vo.getPdname()%></span>
		</div>
		<div
			style="font-size: 1.5em; font-weight: bold; clear: both; float: left; padding-bottom: 30px; margin-top: 50px; width: 600px;">
			<span style="float: left;">가격</span><span><%=df.format(vo.getPrice())%>원</span>
		</div>
		<div
			style="font-size: 1.5em; font-weight: bold; clear: both; float: left; padding-bottom: 30px; margin-top: 50px; width: 600px;">
			<span style="float: left;">사이즈</span>

			<%
			for (int i = 0; i < list.size(); i++) {
				StockVO stockVo = list.get(i);
				ProductSizeVO psVo = sizeList.get(i);
				//해당 사이즈의 재고가 0개면 멈추고 다음 사이즈 찾음
				if (stockVo.getStockqty() == 0) {
					continue;
				}
			%>
			<button class="btn size" name="size" id="<%=psVo.getPdsize()%>"><%=psVo.getPdsize()%></button>
			<%
			}
			%>

		</div>
		<!-- 사이즈 버튼 누르면 추가되는 div -->
		<div name="pddetail-group"></div>
		<div style="width: 600px; height: 100px; float: left;">
			<span style="float: left; margin-top: 15px; margin-left: 20px">총
				결제 금액</span><span style="float: right; margin-top: 15px">원</span><span
				name="searchqty" id="sumprice" style="font-size: 2em; float: right;">0</span>
		</div>
		<div>
			 <form name="frmbasket" method="post" action="../basket/ShoppingBasket.jsp">
			 	<input type="hidden" name="pdno" id="pdno" value="<%=pdno%>" />
				<input type="hidden" name="pdsize" id="pdsize1" />
				<input type="hidden" name="pdqty" id="pdqty1"/>
				<button type="submit" name="btn" id="basket" style="float:left">장바구니</button>
			 </form>
			 <form name="frmorder" method="post" action="../basket/OrderPayment.jsp">
			 	<input type="hidden" name="pdno" id="pdno" value="<%=pdno%>"/>
			 	<input type="hidden" name="pdsize" id="pdsize2"/>
				<input type="hidden" name="pdqty" id="pdqty2"/>
				<button type="submit" name="btn" id="order">바로구매</button>
			 </form>
		</div>
	</div>

	<!-- 상품정보 -->
	<div class="pdtab clearboth">
		<ul class="nav nav-tabs">
			<li class="nav-item"><button class="nav-link alink1"
					style="width: 400px">
					상품정보</a></li>
			<li class="nav-item"><button class="nav-link alink2"
					style="width: 400px">
					상품후기</a></li>
			<li class="nav-item"><button class="nav-link alink3"
					style="width: 400px">
					상품Q&A</a></li>
		</ul>
	</div>
	<%
	for (int i = 0; i < detailList.size(); i++) {
		ProductDetailVO pdVo = detailList.get(i);
		%>
		<div class="div2" style='margin-bottom: 5px;'>
			<img alt="신발 상세이미지" src="../../images/<%=pdVo.getFilename()%>">
		</div>
		<%
	}
	%>

	<!-- 상품후기 -->
	<div class="pdtab clearboth">
		<ul class="nav nav-tabs">
			<li class="nav-item"><button class="nav-link alink1"
					style="width: 400px">
					상품정보</a></li>
			<li class="nav-item"><button class="nav-link alink2"
					style="width: 400px">
					상품후기</a></li>
			<li class="nav-item"><button class="nav-link alink3"
					style="width: 400px">
					상품Q&A</a></li>
		</ul>
	</div>
	<div>
		<div class="div2">
			<img src="../../images/review.png" />
		</div>
		<div class="div2 clearboth border-bottom reviewdiv">
			<span style="float: left;">총 <span name="searchqty"><%=reviewList.size() %></span>개의 리뷰가 있습니다.
			</span> <span class="rightSort" id="span2">&nbsp;|&nbsp;
			<a href="pdDetail.jsp?pdno=<%=pdno %>&lately=lately">최근 등록순</a></span>
			<span class="rightSort" id="span1">&nbsp;|&nbsp;
			<a href="pdDetail.jsp?pdno=<%=pdno %>&grade=low">평점 낮은순</a>&nbsp;</span>
			<span class="rightSort" id="span1">&nbsp;<a href="pdDetail.jsp?pdno=<%=pdno %>&grade=high">평점 높은순</a>&nbsp;</span>
		</div>
	</div>
	<%
		String star="";
		for(int i=0;i<reviewList.size();i++){ 
		 ReviewVO reviewVo=reviewList.get(i);
		 int n=reviewVo.getReviewgrade();
		 
		 if(n==1) star="★";
		 if(n==2) star="★★";
		 if(n==3) star="★★★";
		 if(n==4) star="★★★★";
		 if(n==5) star="★★★★★";%>
		<div>
			<div class="div2 clearboth">
				<span id="star" class="leftSort" style="margin-right: 30px"><%=star %></span>
				<%if(reviewVo.getPdsize()!=0){ %>
				<span class="leftSort gray"> | </span>
				<span class="leftSort gray" style="margin-left: 30px">
					<%=reviewVo.getPdsize() %></span>
				<%} %>
			</div>
			<div class="div2 clearboth">
				<%
				String filename=reviewVo.getFilename();
				if(filename!=null && !filename.isEmpty()){ %>
					<img alt="리뷰이미지" src="../../images/<%=filename%>" width="200px" height="200px" style="float:left">
				<%} %>
			</div>
			<div class="div2 clearboth">
				<span class="leftSort"><%=reviewVo.getReviewbody() %></span> <br> <br>
			</div>
			<div class="div2 clearboth">
				<span class="leftSort gray margin-right20"><%=reviewVo.getId() %></span> <span
					class="leftSort gray margin-right20"> | </span> <span
					class="leftSort gray"><%=reviewVo.getReviewregdate() %></span>
			</div>
			<div class="div2 clearboth border-bottom reviewdiv">
				<button class="btn leftSort size">좋아요</button>
			</div>
		</div>
	<%} %>
	<div class="div2">
		<button class="margin-top20" name="btn" id="review"
			style="float: right;">상품 후기 작성</button>
	</div>
	<!-- 상품Q&A 탭 -->
	<div class="pdtab">
		<ul class="nav nav-tabs">
			<li class="nav-item"><button class="nav-link alink1"
					style="width: 400px">
					상품정보</a></li>
			<li class="nav-item"><button class="nav-link alink2"
					style="width: 400px">
					상품후기</a></li>
			<li class="nav-item"><button class="nav-link alink3"
					style="width: 400px">
					상품Q&A</a></li>
		</ul>
	</div>
	<div class="div2">
		<span class="leftSort small">- 단순 상품비방, 상업적인 내용, 미풍양속 위반, 게시판의
			성격에 맞지 않는 글은 통보 없이 삭제될 수 있습니다.</span><br> <span class="leftSort small">-
			오프라인 매장 재고현황 문의는 ‘</span><span class="leftSort small" name=searchqty>전국오프라인매장</span><span
			class="leftSort small">’ 정보를 참고하시어 해당 매장으로 문의하시면 좀 더 정확한 확인이
			가능합니다.</span><br> <span class="leftSort small">- 주문/배송/반품 및 AS 등
			기타 문의는 </span><span class="leftSort small" name=searchqty>1:1
			상담문의(마이페이지>쇼핑수첩>나의상담)</span><span class="leftSort small">에 남겨주시기
			바랍니다.</span><br> <span class="leftSort small">- (상품 자체에 대한 문의가
			아닌 주문/배송/반품 및 AS 등의 기타문의를 작성하실 경우 나의상담 메뉴로 글이 이동될 수 있습니다.)</span>
	</div>
	<div class="div2 qnafirst clearboth">
		<span class="leftSort margin-top20 margin-left20 bold">QnA 질문
			제목</span> <span class="leftSort margin-top20 margin-left650">i*****d</span>
		<span class="leftSort margin-top20 margin-left100">2023-07-07</span> <span
			class="leftSort margin-top20 margin-left100">답변완료</span>
	</div>
	<div class="div2 clearboth qnadiv">
		<span class="leftSort margin-top20 margin-left20 bold">QnA 질문
			제목</span> <span class="leftSort margin-top20 margin-left650">i*****d</span>
		<span class="leftSort margin-top20 margin-left100">2023-07-07</span> <span
			class="leftSort margin-top20 margin-left100">답변완료</span>
	</div>
	<div class="div2 clearboth qnadiv">
		<span class="leftSort margin-top20 margin-left20 bold">QnA 질문
			제목</span> <span class="leftSort margin-top20 margin-left650">i*****d</span>
		<span class="leftSort margin-top20 margin-left100">2023-07-07</span> <span
			class="leftSort margin-top20 margin-left100">답변완료</span>
	</div>
	<div class="div2">
		<button class="margin-top20" name="btn" id="qna" style="float: right;">Q&A
			작성</button>
	</div>
</section>
<%@include file="../../inc/bottom.jsp"%>
