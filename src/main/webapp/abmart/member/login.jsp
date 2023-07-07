<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../../css/loginstyle.css">
<script type="text/javascript">
	
</script>
<meta charset="EUC-KR">
<title>로그인 페이지</title>
</head>
<body>
<!-- <div class="background-wrap">
  <div class="background"></div>
</div>
 -->
<form id="accesspanel" action="../../index.jsp" method="post">
  <h1 id="litheader">AB - MART</h1>
  <div class="inset">
    <p>
      <input type="text" name="username" id="email" placeholder="userid">
    </p>
    <p>
      <input type="password" name="password" id="password" placeholder="user pwd">
    </p>
    <div style="text-align: center;">
      <div class="checkboxouter">
        <input type="checkbox" name="rememberme" id="remember" value="Remember">
        <label class="checkbox"></label>
      </div>
      <label for="remember">아이디를 기억하시겠습니까?</label>
    </div>
    <input class="loginLoginValue" type="hidden" name="service" value="login" />
  </div>
  <p class="p-container" >
  <!-- jq에서 클릭 링크걸기 -->
     <input type="submit" name="Login" id="go" value="로그인" width="40%">
     <input type="submit" name="register" id="register_go" value="회원가입" width="40%" >
  </p>
</form>
</body>
</html>