<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<link href="./css/index.css" rel="stylesheet">
<style type="text/css">

#login-form{
	margin: 0 auto;
	height: 350px;
	width: 500px;
	margin-top: 150px;
	border: none;
	padding:20px;
	border-radius: 5px;
	background-color:#EEEFF1;
	margin-bottom: 200px;
}

#login-form p{
	margin-top: 15px;
	text-align: center;
	font-size: xx-large;
}

.text-field{
	width: 460px;
	height: 50px;
	border: none;
	border-radius: 5px;
	font-size: 14px;
	margin-bottom: 10px;
	padding: 10px;
}

.submit-btn{
	width: 100%;
	height: 50px;
	border: none;
	background-color: #0064CD;
	border-radius: 5px;
	font-size: 14px;
	color: white;
	margin-bottom: 30px;
	padding: 10px;
}

.links{
	width: 100%;
	text-align: center;
}

.links a {
	font-size: 15px;
	color: #9B9B98;
}

</style>
</head>
<body>
<header>
	<%@ include file= "menu.jsp"%>
</header>
<main>
	<div id="login-form">
		
		<p><strong>Quicktion</strong></p>
		
		<form action="./" method="post">
			<input type="text" id="id" name="id" class="text-field" placeholder="아이디를 입력하세요" required="required">
			<input type="password" id="pw" name="pw" class="text-field" placeholder="암호를 입력하세요" required="required">
			<button type= "submit" value="로그인" class="submit-btn">LOGIN</button>
			<div class="links">
				<a href="./join">회원 가입</a> &emsp;|&emsp;
				<a href="./idpw">ID/PW 찾기</a>
			</div>
		</form>
	</div>
		
</main>
<footer>
	<%@ include file= "footer.jsp"%>
</footer>	
</body>
</html>