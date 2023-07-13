<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../../css/loginstyle.css">
<style type="text/css">
form#accesspanel {
	width: 624px;
	padding-top: 109px;
	height: 778px;
}

input#zipno {
	width: 295px;
}

input#detailaddress {
	width: 295px;
}

select#hp1 {
	width: 78px;
	height: 38px;
	text-align: center;
}

input#hp2 {
	width: 170px;
}

input#hp3 {
	width: 170px;
}

input#email1 {
	width: 132px;
}

select#email2 {
	width: 133px;
	height: 31px;
}

input#email3 {
	width: 155px;
}

input#footsize {
	width: 280px;
	margin-right: 12px;
	height: 33px;
	text-align: center;
	font-size: 1.2em;
}

input#birth {
	width: 280px;
}

.inset {
	color: black;
}

input#btnChkId {
	float: left;
	margin-left: 30px;
	width: 150px;
	height: 31px;
}

input#id {
	float: left;
	width: 400px;
}
</style>
<script src="../../js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#btnZipcode').click(function(){
			open("../zipcode/zipcode.jsp", "", "width=500, height=700, left=150, location=1");
		});
		
		
		$('#btnChkId').click(function(){
	    	var id = $('#id').val();
	        open('Idcheck.jsp?id='+id,'dup','width = 550, height=300, location=yes, resizable=yes, left=0, top=0');
	    });
		
		
		$("#email2").change(function() {
		        var selectedOption = $(this).val();
		        if (selectedOption === "etc") {
		            $("#email3").css("visibility", "visible");
		        } else {
		            $("#email3").css("visibility", "hidden");
		        }
		});
		 $("#register_go").click(function() {
			if ($('#name').val().length < 1) {
				alert("이름을 입력하세요");
				$('#name').focus();				
				return false;
			}
			if ($('#pwd').val().length < 1) {
				alert("비밀번호를 입력하세요");
				$('#pwd').focus();
				return false;
			}
			if ($('#pwd').val() != $('#pwdchk').val()) {
				alert("비밀번호가 일치하지 않습니다.확인하세요");
				$("#pwdchk").focus();
				return false;
			}
		}); 
		
	});

</script>
<meta charset="EUC-KR">
<title>회원가입 페이지</title>
</head>
<body>
	<form id="accesspanel" action="register_ok.jsp" method="post">
		<h1 id="litheader">AB - MART</h1>
		<div class="inset">
			<p>
				<input type="text" name="name" id="name" placeholder="Name">
			</p>
			<p>
				<input type="text" name="id" id="id" placeholder="userid">
				<input type="button" value="중복확인" id="btnChkId">
			</p>
			<p>
				<input type="password" name="pwd" id="pwd" placeholder="User pwd">
			</p>
			<p>
				<input type="password" name="pwd" id="pwdchk" placeholder="User pwdck">
			</p>
			<p>
				<input type="number" name="footsize" id="footsize"
					placeholder="발 사이즈"> <input type="text" name="birth"
					id="birth" placeholder="생일">
			</p>
			<p id="zip">
				<!-- 우편번호 검색 넣기 -->

				<input type="text" name="zipno" id=zipno ReadOnly placeholder="우편번호">
				<input type="Button" value="우편번호 찾기" id="btnZipcode"><br />
				<input type="text" name="detailaddress" id="detailaddress" ReadOnly
					placeholder="주소"><br /> <span class="sp1">&nbsp;</span>
			</p>
			<p id="tel">
				<select name="hp1" id="hp1" title="휴대폰 앞자리">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">017</option>
					<option value="018">018</option>
					<option value="019">019</option>
				</select> &nbsp - &nbsp <input type="text" name="hp2" id="hp2" maxlength="4"
					title="휴대폰 가운데자리">&nbsp - &nbsp <input type="text"
					name="hp3" id="hp3" maxlength="4" title="휴대폰 뒷자리">
			</p>
			<p>

				<input type="text" name="email1" id="email1" placeholder="email">&nbsp
				@ &nbsp <select name="email2" id="email2" title="이메일주소 뒷자리">
					<option value="naver.com">naver.com</option>
					<option value="hanmail.net">hanmail.net</option>
					<option value="nate.com">nate.com</option>
					<option value="gmail.com">gmail.com</option>
					<option value="etc">직접입력</option>
				</select> <input type="text" name="email3" id="email3"
					title="직접입력인 경우 이메일주소 뒷자리" style="visibility: hidden;">
			</p>

			<p class="p-container">
				<input type="submit" name="register" id="register_go" value="회원가입">
			</p>
		</div>
		<input type="text" name="chkId" id="chkId">
	</form>
</body>
</html>
