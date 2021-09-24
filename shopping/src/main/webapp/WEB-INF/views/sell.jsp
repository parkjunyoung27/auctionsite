<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
		<title>quicktion - 판매하기</title>
	<link href="./css/index.css" rel="stylesheet">
</head>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

<script type="text/javascript">
function sellCheck(){
	var result = confirm("이대로 작성하시겠습니까?");
	return result;
}

<% for(int i=1; i<5; i++){ %>
function setThumbnail<%=i%>(event){
	var reader = new FileReader();
	
	reader.onload = function(event){
		var img = document.getElementById("target_img<%=i%>");
		img.setAttribute("src", event.target.result);
		img.setAttribute("class", "col-lg-6");
		img.setAttribute('width', 247);
		img.setAttribute('height', 247);
		img.setAttribute('style', 'margin:0; padding:5px; opacity:100%');
		document.querySelector("div#target_img<%=i%>").appendChild(img);
	};
	reader.readAsDataURL(event.target.files[0]);
}
<%}%>
</script>

<header>
	<jsp:include page="menu.jsp"/>
</header>
<body>
	<div id="container">
	<h1>판매하기</h1>

		<form id="sell_form" onsubmit="return sellCheck();" action="./sell" method="post" enctype="multipart/form-data">

	 
		<div id="pimage_area">
			
			<% for( int i=1; i < 5; i++){  %>
			<div class="pimag_upload">
			<img id="target_img<%=i%>" onclick="document.getElementById('file<%=i %>').click();" 
				src="./resources/images/plus.png" width=128px>
			<input type="file" id="file<%=i %>" name='files' onchange="setThumbnail<%=i%>(event);" accept=".png, .jpg, .gif, .jpeg, .bmp" style='display: none ;'> 
			<!-- 상품 보낼 파일은 file1, file2, file3, file4 -->
			</div>		
			<% } %>
			
			<p>최대 4개의 상품이미지를 올릴 수 있습니다.</p>
		</div>
		
		<div id="pinfo_area">		

			<!-- 물건 분류 -->


			<!-- 브랜드명 설정 -->
			<div class="sell_write_area" style="height:10%;">
				<div class="sell_title">
					<span class="sell_title_txt">브랜드명</span>
				</div>
				<div class="sell_write_input">
					<input type="text" name="product_brand" class="sell_write_input_txt" placeholder="내용을 입력해주세요.">				
				</div>
			</div>
			
			<!-- 상품이름 설정 -->
			<div class="sell_write_area" style="height:10%;">
				<div class="sell_title">
					<span class="sell_title_txt">상품명</span>
				</div>
				<div class="sell_write_input">
					<input type="text" name="product_name" class="sell_write_input_txt" placeholder="내용을 입력해주세요." required="required">				
				</div>
			</div>
			
			<!-- 물건 상태 -->
			
			
			<!-- 입찰시작가 설정 -->
			<div class="sell_write_area" style="height:10%;">
				<div class="sell_title">
					<span class="sell_title_txt">시작가</span>
				</div>
				<div class="sell_write_input">
					<input type="text" name="start_price" class="sell_write_input_txt" placeholder="입찰 시작가를 입력해주세요." required="required">원				
				</div>
			</div>
			
			<!-- 거래 방법 설정 -->
			<div class="sell_write_area" style="height:10%;">
				<div class="sell_title">
					<span class="sell_title_txt">거래방법</span>
				</div>
				<div class="trade_method_input">
					<select id="trade_method_select" name="trade_method">
						<option value="0">직접거래</option>
						<option value="1">택배거래</option>
						<option value="2">둘 다</option>
					</select>			
				</div>
			</div>
			
			<!-- 상품 설명 -->
			<div class="sell_write_area" style="height:40%;">
				<div class="sell_title">
					<span class="sell_title_txt">상품설명</span>
				</div>
				<textarea name="product_content" id="product_content" placeholder="내용을 입력해주세요."></textarea>
			</div>
			
			<!-- 등록 버튼 -->
			<div id="sell_btn" style="height:10%;">
				<button type="submit" id="sell_btn">등록하기</button>
			</div>
		

		</div>

		</form>	
	</div>
	
	<%@ include file= "footer.jsp"%>

</body>
</html>