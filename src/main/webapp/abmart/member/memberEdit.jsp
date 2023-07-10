<%@page import="java.sql.SQLException"%>
<%@page import="com.semi.member.model.MemberVO"%>
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
</style>

<script src="../../js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#btnZipcode').click(function(){
			open("../zipcode/zipcode.jsp", "", "width=500, height=700, left=150, location=1");
	});
});
</script>
<jsp:useBean id="memService" class="com.semi.member.model.MemberService" scope="session"></jsp:useBean>
<%
	//1
	String id = (String)session.getAttribute("id");
	
	//2
	MemberVO vo = null;
	try{
	    vo = memService.selectMember(id);
	}catch(SQLException e){
	   e.printStackTrace();
	}
	
	//3
	String zipno = Integer.toString(vo.getZipno());
	String detailaddress = vo.getDetailaddress();
	
	if(zipno==null) zipno = "";
	if(detailaddress==null) detailaddress = "";
	
	//010-100-2000, ""
	String tel = vo.getTel();
	String hp1="", hp2="", hp3="";
	if(tel != null && !tel.isEmpty()){
		String[] hpArr=tel.split("-");
		hp1=hpArr[0];
		hp2=hpArr[1];
		hp3=hpArr[2];		
	}
	
	String email = vo.getEmail();
	String email1="", email2="";
	  
	String[] emailList={"naver.com", "hanmail.net","nate.com","gmail.com"};
	boolean isEtc=false;
    if(email!=null && !email.isEmpty()){
    	String[] emailArr=email.split("@");
    	email1=emailArr[0];
    	email2=emailArr[1];         
    	
    	int count=0;
    	for(int i=0;i<emailList.length;i++){
    		if(email2.equals(emailList[i])){
    			count++;
    			break;
    		}
    	}//for
    	
    	if(count==0){
    		isEtc=true;
    	}
    }
   
    
%>

<meta charset="UTF-8">
<title>회원정보 수정 페이지</title>
</head>
<body>
<form id="accesspanel" action="memberEdit_ok.jsp" method="post">
  <h1 id="litheader">AB - MART</h1>
  <div class="inset">
    <p>
      <input type="text" name="name" id="name" placeholder="<%=vo.getName()%>">
    </p>
    <p>
      <input type="text" name="id" id="id" placeholder="<%=id%>">
    </p>
    <p>
      <input type="password" name="pwd" id="pwd" placeholder="User pwd">
    </p>
    <p>
      <input type="password" name="pwd" id="pwdchk" placeholder="User pwdck">
    </p>
    <p>
  	  <input type="number" name="footsize" id="footsize" placeholder="<%=vo.getFootsize() %>">    
  	  <input type="text" name="birth" id="birth" placeholder="<%=vo.getBirth()%>">    
    </p>
    <p id="zip">
    <!-- 우편번호 검색 넣기 -->
     	
        <input type="text" name="zipno" id=zipno ReadOnly  placeholder ="<%=zipno%>">
        <input type="Button" value="우편번호 찾기" id="btnZipcode" ><br />
        <input type="text" name="detailaddress"id ="detailaddress" ReadOnly placeholder="<%=detailaddress%>" ><br />
        <span class="sp1">&nbsp;</span>
    </p>
    <p id ="tel"><!--  -->
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

        <input type="text" name="email1"  id="email1" placeholder="email">@
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
     <input type="submit" name="member_edit" id="member_edit" value="회원정보수정"  >
  	</p> 
  </div>
</form>
</body>
</html>
