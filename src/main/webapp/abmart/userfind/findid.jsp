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

<form id="accesspanel" action="findid_ok.jsp" method="post">
  <h1 id="litheader">AB - MART</h1>
  <div class="inset">
    <p>
      <input type="text" name="name" id="name" placeholder="name" >
      <input type="password" name="pwd" id="pwd" placeholder="pwd">
    </p>
   </div>
 
  <p class="p-container" >
     <input type="submit" name="fnid" id="fnid" value="아이디 찾기">
  </p>
  <p class ="links">
  <a href="<%=request.getContextPath()%>/abmart/member/login.jsp">로그인</a> | 
  <a href="<%=request.getContextPath()%>/abmart/userfind/findpwdjsp.jsp">비밀번호 찾기</a> |
  <a href="<%=request.getContextPath()%>/abmart/member/register.jsp">회원가입</a>
  </p>
</form>

</body>
</html>