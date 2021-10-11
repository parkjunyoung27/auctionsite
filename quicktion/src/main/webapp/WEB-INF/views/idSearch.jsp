<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quicktion | 아이디찾기</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<link href="./resources/css/index.css" rel="stylesheet">
	<link href="./resources/css/header.css" rel="stylesheet">
	<link href="./resources/css/footer.css" rel="stylesheet">
	<link href="./resources/css/idpwSearch.css" rel="stylesheet">
	
	<script>
	// id 중복확인
	function idSearch(){
		var email = $("#email").val();
		alert(email);
		if(email.length < 5){
			alert('이메일을 5자 이상 입력해주세요.');
			return false;
		}
		
		$.ajax({
			type: "POST",
			dataType: 'html',
			cache : false;
			data: {'email' : email},
			url: './idSearch.do',
			success: function(data){
				alert(data);
				if(data != null){//return 
					$("#result").text("등록된 id는 "+data+"입니다.");
				}else{
					alert("이메일을 다시 확인해주세요.");
					$("#email").focus();
				}
			},
			error: function(xhr, status, e){
				alert("문제 발생 : " + e)
			}
		});
	}
	</script>

</head>
<body>
	
	<header>
		<%@ include file="./component/navbar.jsp"%>	
	</header>
	
	<main>
		<div id="idSearchForm">
			<h1>아이디 찾기</h1>
			<form onsubmit="return idSearch">
				<p>가입시 등록한 휴대폰 번호를 입력해주세요.</p>
				<hr style="margin-top:30px; margin-bottom:30px;">
				<input type="text" id="email" name="email" class="text-field" placeholder="이메일을 입력하세요" required="required">
				<button type="submit" id="idSearchBtn" class="submit-btn" onclick="return idSearch()">아이디 찾기</button>
				<span id="result"></span>
			</form>
		</div>
	</main>
	
	<footer>
		<%@ include file="./component/footer.jsp"%>
	</footer>
	
</body>
</html>