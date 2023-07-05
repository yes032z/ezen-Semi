<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="../../css/loginstyle.css">
<style type="text/css">
form#accesspanel {
    width: 600px;
    padding-top: 109px;
    height: 740px;
}
input#btnZipcode {
    float: right;
}

input#zipcode {
    width: 295px;
}
input#address {
    width: 295px;
}
input#btnZipcode {
    float: right;
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

</style>
<script type="text/javascript">
	
</script>
<meta charset="EUC-KR">
<title>회원가입 페이지</title>
</head>
<body>
<form id="accesspanel" action="../../index.jsp" method="post">
  <h1 id="litheader">AB - MART</h1>
  <div class="inset">
    <p>
      <input type="text" name="username" id="name" placeholder="Name">
    </p>
    <p>
      <input type="text" name="userid" id="userid" placeholder="Userid">
    </p>
    <p>
      <input type="password" name="password" id="pwd" placeholder="User pwd">
    </p>
    <p>
      <input type="password" name="password" id="pwdchk" placeholder="User pwdck">
    </p>
    <p id="zip">
    <!-- 우편번호 검색 넣기 -->
         
        <input type="text" name="zipcode" id="zipcode" ReadOnly  value ="우편번호">
        <input type="Button" value="우편번호 찾기" id="btnZipcode" ><br />
        <span class="sp1">&nbsp;</span>
        <input type="text" name="address"id ="address" ReadOnly value="주소" ><br />
        <span class="sp1">&nbsp;</span>
    </p>
    <p id ="tel">
    <select name="hp1" id="hp1" title="휴대폰 앞자리">
            <option value="010">010</option>
            <option value="011">011</option>
            <option value="016">016</option>
            <option value="017">017</option>
            <option value="018">018</option>
            <option value="019">019</option>
       	</select>
        -
        <input type="text" name="hp2" id="hp2" maxlength="4" title="휴대폰 가운데자리">-
        <input type="text" name="hp3" id="hp3" maxlength="4" title="휴대폰 뒷자리">
    </p>
    <p>
     <label for="email1">이메일 주소</label>
        <input type="text" name="email1"  id="email1" title="이메일주소 앞자리">@
        <select name="email2" id="email2"  title="이메일주소 뒷자리">
            <option value="naver.com">naver.com</option>
            <option value="hanmail.net">hanmail.net</option>
            <option value="nate.com">nate.com</option>
            <option value="gmail.com">gmail.com</option>
            <option value="etc">직접입력</option>
        </select>
        <input type="text" name="email3" id="email3" title="직접입력인 경우 이메일주소 뒷자리"
        	style="visibility:hidden;">
    </p>
    
 	<p class="p-container" >
     <input type="submit" name="register" id="register_go" value="회원가입"  >
  	</p> 
  </div>
</form>
</body>
</html>
