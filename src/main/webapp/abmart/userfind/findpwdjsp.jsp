<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="../../css/loginstyle.css">

<style type="text/css">
  .links{
        text-align: center;
        margin-bottom: 10px;
        font-size: 1.5em;
        color:black;
    }
    a {
    color: #7e4016;
}
</style>
<meta charset="UTF-8">
<title>아이디 찾기 </title>
</head>
<body>

<form id="accesspanel" action="findpwdjsp_ok.jsp" method="post">
  <h1 id="litheader">AB - MART</h1>
  <div class="inset">
    <p>
      <input type="text" name="id" id="id" placeholder="id" >
      <input type="text" name="email" id="email" placeholder="email">
    </p>
   </div>
  <p class="p-container" >
     <input type="submit" name="fnpw" id="fnpw" value="비밀번호 찾기">
  </p>
  <p class ="links">
  <a href="<%=request.getContextPath()%>/abmart/member/login.jsp">로그인</a> | 
  <a href="<%=request.getContextPath()%>/abmart/userfind/findid.jsp">아이디 찾기</a> |
  <a href="<%=request.getContextPath()%>/abmart/member/register.jsp">회원가입</a>
  </p>
</form>

</body>
</html>