<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quicktion | 비밀번호찾기</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<link href="./resources/css/index.css" rel="stylesheet">
	<link href="./resources/css/header.css" rel="stylesheet">
	<link href="./resources/css/footer.css" rel="stylesheet">
	<link href="./resources/css/idpwSearch.css" rel="stylesheet">

	<style>

	</style>
</head>
<body>

	<header>
		<%@ include file="./component/navbar.jsp"%>	
	</header>
	
	<main>
		<div id="idSearchForm">
			<h1>비밀번호 찾기</h1>
			<form action="${pageContext.request.contextPath}/idSearch.do" method="post">
				<p>가입시 등록한 이메일, 휴대폰 번호를 입력해주세요.</p>
				<hr style="margin-top:30px; margin-bottom:30px;">
				<input type="text" name="email" class="text-field" placeholder="이메일을 입력하세요" required="required">
				<input type="text" name="email" class="text-field" placeholder="휴대폰 번호 '-'표 없이 입력해주세요." required="required">
				<button type= "submit" id="pwSearchBtn" value="아이디찾기" class="submit-btn">아이디 찾기</button>
			</form>
		</div>
	</main>

	<footer>
		<%@ include file="./component/footer.jsp"%>
	</footer>

</body>
</html>