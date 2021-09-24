<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link href="./css/index.css" rel="stylesheet">
<style type = "text/css">

#board{
	margin: 0 auto;
	width: 700px;
	min-height: 600px;
	margin-top:30px;
	border: 2px white solid;
	background-color: #ebebeb66;
	border-radius: 10px;
	margin-bottom: 100px;
}

#board h1{
	text-align: center;
}

#join_form{
    width: 80%;
    min-height: 500px;
    margin: 10px auto 10px;
    padding: 10px 0px 0px 10px;
    position: relative;
    border: 1px solid black;
    border-radius: 10px;
    font-size: 18px;
    font-weight: 700;
}

/*중복확인 버튼*/
#check_id{
	width: 75px;
	position: absolute;
	top: 56px; left: 375px;
	cursor: pointer;
	height: 30px;
	line-height: 30px;
	border-radius: 0 10px 10px 0;
	border:none;
	border-left: 2px solid #1daeb3;
	box-shadow: none;
	background-color: white;
	transition: 0.3s;
	font-size: 13px;
}

#check_id:hover{
	background-color: #D6EAF8;
}

#jaction .join_p{
	margin: 0;
}
	
.jtitle{
	display: block;
	height: 30px;
	padding: 0 15px;
	color: black;
}
#jactionp p input{
	width: 90%;
	height:30px;
	margin: 0 auto;
	padding:0 15px;
	border:1px solid #1daeb3;
	border-radius: 10px;
	box-shadow: none;
}

#birth_p{
	width:400px;
	height:35px;
	padding:0 15px;
}
			
#join_pw .jpw1, #join_pw .jpw2{
	margin-bottom:10px;
}

#jsubb{
	padding: 5px;
}

#resultText{
	margin: 10px;
}

#join_join{
	width: 80%;
	height:35px;
	cursor:pointer;
	background-color:#1daeb3;
	border:none;
	border-radius: 10px;
	letter-spacing:10px;
	font-size:18px;
	transition:0.3s;
	margin: 0 auto;
	display: block;
	color: white;
}

#jsarea{
	text-align: center;
}

#join_reset{
	cursor:pointer;
	border: none;
	transition:0.3s;
	background-color: #B8D7FF;
	color:black;
}

#join_index{
	color:black;
	text-decoration:none;
	font-size:12px;
	transition:0.3s;
}

#join_reset:hover{bcolor:blue;letter-spacing:6px;}
#join_index:hover{color:blue;letter-spacing:6px;}
</style>



<!-- AJAX사용 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js">
</script>
<script type="text/javascript">
/*비밀번호 일치 검사*/
function isSame(){
	if(document.getElementById('pw1').value != '' && document.getElementById('pw2').value != ''){
		if(document.getElementById('pw1').value == document.getElementById('pw2').value){
			document.getElementById('same').innerHTML='비밀번호가 일치합니다.';
			document.getElementById('same').style.color='blue'
		}else{
			document.getElementById('same').innerHTML='비밀번호가 일치하지 않습니다.';
			document.getElementById('same').style.color='red'			
		}
	}
}

function join(){
	var id = document.getElementById('id');
	var name = document.getElementById('name');
	var pw1 = document.getElementById('pw1');
	var pw2 = document.getElementById('pw2');
	var email = document.getElementById('email');
	var address = document.getElementById('address');
	var phone = document.getElementById('phone');
	var year = document.getElementById('year');
	var month = document.getElementById('month');
	var day = document.getElementById('day');
	var date2 = document.getElementById('date2');	
	
	//id가 없거나, 5글자 이하라면
	if(id.value == "" || id.value.length < 5){
		alert('아이디를 5자 이상 입력해주세요.');
		id.focus();
		id.style.backgroundColor = '#F5B7B1';
		return false;
	}
	if(name.value ==""){
		alert("이름을 입력해주세요.");
		name.focus();
		name.style.backgroundColor = '#F5B7B1';
		return false;
	}
	if(pw1.value == ""|| pw1.value.length < 5){
		alert("비밀번호를 5글자 이상 입력해주세요.");
		pw1.focus(); // 마우스 이동
		return false;
	}	
	
	if(pw1.value != pw2.value){
		alert("같은 비밀번호를 입력하세요.");
		//pw1.value = ""; 초기화
		//pw2.value = "";
		pw1.style.backgroundColor='#F5B7B1';
		pw2.style.backgroundCOlor='#F5B7B1';
		pw1.focus();
		return false;
	}
	
	if(address.value == ""){
		alert("주소을 입력하세요.");
		email.style.backgroundColor='#F5B7B1';
		email.focus();
		return false;
	}

	if(phone.value == "" || phone.value.length < 10 ){
		alert("핸드폰 번호를 입력하세요.");
		email.style.backgroundColor='#F5B7B1';
		email.focus();
		return false;
	}
	
	if(email.value == ""){
		alert("email을 입력하세요.");
		email.style.backgroundColor='#F5B7B1';
		email.focus();
		return false;
	}
	
	if(date2.value == ""){
		alert("생일을 입력하세요.");
		date2.style.backgroundColor='#F5B7B1';
		date2.focus();
		return false;
	}		
}

/*ajax*/
$(function(){
	$("#join_join").prop("disabled", true); //가입하기 버튼 비활성화
	$("#resultText").css("color","red");
});

// id 중복확인
function checkID(){
	var id = $("#id").val();
	
	if(id.length < 5){
		alert('아이디를 5자 이상 입력해주세요.');
		return false;
	}
	
	$.ajax({
		type: "POST",
		dataType: 'text',
		data: 'id='+id,
		url: './idCheck',
		success: function(rData,textStatus, xhr){
			var checkResult = textStatus;
			//alert("성공 : "+ rData); //rData = result
			
			if(rData == 1){//return 값
				alert(id+"는 이미 등록되어 있습니다.");
				$("#resultText").css("color","red");
				$("#resultText").text(id+"는 이미 등록되어 있습니다.");
				$("#join_join").attr("disabled",true);
			}else{
				alert("사용할 수 있는 ID 입니다.");
				$("#join_join").attr("disabled", false);
				$("#resultText").css("color","blue");
				$("#resultText").text(id+"는 가입할 수 있습니다.");
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
	<%@ include file= "menu.jsp"%>
</header>

<main>
<div id = "board">
	<h1>회 원 가 입</h1>
	<div id ="join_form">
		<button onclick="return checkID()" id="check_id">중복확인</button>
			
		<form action="./join" method="post" onsubmit="return join()">
			<div id="jactionp">
				<p id="join_id" class="join_p">
				<span class="jtitle">아이디</span>
				<input type="text" name="id" id="id" onchange="checkID()">
				</p>
								
				<p id="join_name" class="join_p">
					<span class="jtitle">이름</span>
					<input type="text" name="name" id="name">
				</p>
								
				<p id="join_pw" class="join_p">
					<span class="jtitle">비밀번호</span>
					<input type="password" id="pw1" name="pw1" class="jpw1" placeholder="비밀번호를 입력해주세요" >
					<input type="password" id="pw2" name="pw2" class="jpw2" placeholder="비밀번호 확인" onchange="isSame()">
						&nbsp;&nbsp;<span id="same"></span>
				</p>
								
				<p id="join_email" class="join_p">
					<span class="jtitle">이메일</span>
					<input type="email" name="email" id="email" >
				</p>
				
				<p id="join_address" class="join_p">
					<span class="jtitle">주소</span>
					<input type="text" name="address" id="address" >
				</p>
				
				<p id="join_phone" class="join_p">
					<span class="jtitle">핸드폰 번호</span>
					<input type="text" name="phone" id="phone" >
				</p>
								
				<p id="join_birth" class="join_p">
					<span class="jtitle">생일</span>
					<input type="date" name="date2" id="date2">
				</p>
			</div>
						
			<div id="jsubb">
				<p id="resultText">ID중복확인을 먼저 실행하셔야 가입가능합니다.</p>
					<button type="submit" id="join_join" disabled="disabled">가입하기</button>
					<p id="jsarea">
					<button type="reset" id="join_reset">reset</button> &nbsp;|&nbsp;
					<a href="./login" id="join_index">로그인하러가기</a>						
				</p>
			</div>
		</form>
	</div>
</div>

</main>
<footer>
	<%@ include file= "footer.jsp"%>
</footer>	
</body>
</html>