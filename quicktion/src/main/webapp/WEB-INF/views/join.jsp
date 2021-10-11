<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quicktion | 회원가입</title>
	<link href="./resources/css/index.css" rel="stylesheet">
	<link href="./resources/css/header.css" rel="stylesheet">
	<link href="./resources/css/footer.css" rel="stylesheet">
	<link href="./resources/css/join.css" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	
	<header>
		<%@ include file="./component/navbar.jsp"%>	
	</header>

	<main>
	<div id= "board">
		<div id ="join_form">
			<h2>회 원 가 입</h2>
							
			<form action="./join" method="post" onsubmit="return join()">
				<div id="jactionp">
					<p id="join_id" class="join_p">
					<span class="jtitle">이메일</span> <!-- ajax로 확인 -->
					<input type="text" name="id" id="id" onchange="return checkID()" placeholder="수신 가능한 E-mail을 입력해주세요.">
					</p>
									
					<p id="join_name" class="join_p">
						<span class="jtitle">닉네임</span>
						<input type="text" name="name" id="name" placeholder="닉네임을 입력해주세요.">
					</p>
									
					<p id="join_pw" class="join_p_pw">
						<span class="jtitle">비밀번호</span>
						<input type="password" id="pw1" name="pw1" class="jpw1" placeholder="비밀번호를 입력해주세요" ><br>
						<input type="password" id="pw2" name="pw2" class="jpw2" placeholder="비밀번호 확인" onchange="isSame()">
						<span id="same"></span>
					</p>
										
					<p id="join_phone" class="join_p">
						<span class="jtitle">핸드폰 번호</span>
						<input type="text" name="phone" id="phone" placeholder="휴대폰 번호 '-'표 없이 입력해주세요.">
					</p>
									
					<p id="join_birth" class="join_p">
						<span class="jtitle">생년월일</span>
						<input type="date" name="birthDate" id="date">
					</p>
				</div>
							
				<div id="jsubb">
						<button type="submit" id="join_join" disabled="disabled">가입하기</button>
						<p id="jsarea">
						<button type="reset" id="join_reset">초기화하기</button> &nbsp;|&nbsp;
						<a href="./login.do" id="join_index">로그인하러가기</a>						
					</p>
				</div>
			</form>
		</div>
	</div>
	</main>
	
	<footer>
		<%@ include file="./component/footer.jsp"%>
	</footer>
	
</body>
</html>