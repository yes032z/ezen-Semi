<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../../css/loginstyle.css">
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
      <input type="password" name="password" id="password" placeholder="User pwd">
    </p>
    <p>
      <input type="password" name="password" id="password" placeholder="User pwd">
    </p>
  </div>
  <p class="p-container" >
  <!-- jq에서 클릭 링크걸기 -->
     <input type="submit" name="register" id="register_go" value="회원가입" width="40%" >
  </p>
</form>
</body>
</html>
