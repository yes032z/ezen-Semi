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
    <p>
    <!-- 우편번호 검색 넣기 -->
      <input type="text" name="addres" id="addres" placeholder="addres">
    </p>
    <p>
      <input type="text" name="tel" id="tel" placeholder="Tel">
    </p>
    
  </div>
 <p class="p-container" >

     <input type="submit" name="register" id="register_go" value="회원가입"  >
  </p> 
</form>
</body>
</html>
