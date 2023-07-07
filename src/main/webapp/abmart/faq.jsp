<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ Test</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
<style type="text/css">
	h2 {margin-left: 350px;}
	
	#txtsearch {width: 50%; height: 29px;}
	
	#btsearch {
		background: black;
		color: white;
		padding-left: 30px;
		padding-bottom: 5px;
		padding-top: 5px;
		padding-right: 30px;
	}

	.searchFaq {
		margin-left: 350px;
		background: #8080801c;
		width: 800px;
	}
	
	.searchFaq a {
		margin-left: 10%;
		margin-right: 10%;
	}
	
</style>
</head>
<body>
	<h2>FAQ</h2>
	<div class="searchFaq">
		<hr><br>
		<a>FAQ 검색</a>
		<input type="text" id="txtsearch">
		<button id="btsearch">검색</button><br><br>
		<hr>
	</div>
</body>
</html>