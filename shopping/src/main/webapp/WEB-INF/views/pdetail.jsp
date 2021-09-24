<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
		<title>quicktion - 판매하기</title>
	<link href="./css/index.css" rel="stylesheet">
</head>
<style type="text/css">
#pimage_area{
	width: 50%;
    height: 600px;
    float: left;
    background-color: white;
    padding: 20px;
    opacity: 50%;
}

#pinfo_area{
	width:50%;
	height:800px;
	overflow: hidden;
    padding: 10px;
	border-left: 1px solid #ebebeb;
	border-left: 1px solid #ebebeb;
	
}

#sell_form{
    height: 100%;
}

.pimag_upload{
    background-color: #ebebeb;
    width: 45%;
    height: 45%;
    float: left;
    margin: 2%;
    border: 3px solid #ebebeb;
}

.pimag_upload img{
	margin-top: 25%;
    margin-left: 25%;
}

#sell_main{
	height:15%;
	border-bottom: 1px solid #ebebeb;
}

#sell_price{
	height:10%;
	border-bottom: 1px solid #ebebeb;
}

#trade_method{
	height:10%;
	border-bottom: 1px solid #ebebeb;
}

#sell_product_info{
	height:40%;
	border-bottom: 1px solid #ebebeb;
}

#sell_btn{
	height:10%;
	border-bottom: 1px solid #ebebeb;
}

.product_brand{    
    display: inline-block;
    vertical-align: top;
    line-height: 27px;
    padding-top: 1px;
    margin-bottom: 9px;
    font-size: 20px;
    letter-spacing: -.27px;
    font-weight: 800;
    border-bottom: 2px solid #222;
}

.product_name{
    margin-bottom: 4px;
    letter-spacing: -.09px;
    font-size: 20px;
    font-weight: 800;
    letter-spacing: -.07px;
}

.sell_price_title{
    float: left;
}

.sell_price_title_txt{
    padding-top: 5px;
    display: inline-block;
    font-size: 20px;
    font-weight: 800;
    letter-spacing: -.07px;
    color: rgba(34,34,34,.8);
    margin-top: 20px;
}

.sell_price_input{
    float: right;
}

.sell_price_input_txt{
    padding-top: 5px;
    display: inline-block;
    font-size: 20px;
    font-weight: 800;
    letter-spacing: -.07px;
    color: rgba(34,34,34,.8);
    margin-top: 20px;
}

.trade_method_title{
    float: left;
}

.trade_method_title_txt{
	padding-top: 5px;
    display: inline-block;
    font-size: 20px;
    font-weight: 800;
    letter-spacing: -.07px;
    color: rgba(34,34,34,.8);
    margin-top: 20px;
}

.trade_method_input{
    float: right;
    padding-top: 2px;
    text-align: right;
    width: 30%;
}

.trade_method_input.txt{
	display: inline-block;
    line-height: 26px;
    vertical-align: top;
}

#product_content{
    display: block;
    width: 100%;
    height: 83%;
    background-color: #ebebeb;
    border: none;
    opacity: 50%;
}


#sell_btn button{
	margin: 0 auto;
    display: block;
    vertical-align: middle;
    margin-top: 10%;
    width: 50%;
    height: 90%;
    background-color: #1daeb3;
    font-size: 23px;
    letter-spacing: -.27px;
    color: white;
    font-weight: 900;
    border-radius: 10px;
    border: none;
}

#trade_method_select{
	padding-top: 5px;
    display: inline-block;
    font-size: 15px;
    font-weight: 800;
    letter-spacing: -.07px;
    color: rgba(34,34,34,.8);
    margin-top: 20px;
    width: 62%;
    text-align: center;
    letter-spacing: 3px;
}
.sell_product_info{
    float: left;
}

.sell_product_info_txt{
	padding-top: 5px;
    display: inline-block;
    font-size: 20px;
    font-weight: 800;
    letter-spacing: -.07px;
    color: rgba(34,34,34,.8);
    margin-top: 20px;
}


</style>
<header>
	<jsp:include page="menu.jsp"/>
</header>
<body>
	<div id="container">
	<h1>판매하기</h1>
		<div id="pimage_area">
			<div class="pimag_upload"><a><img src="./resources/images/plus.png" width=128px></a></div>
			<div class="pimag_upload"><img src="./resources/images/plus1.png"></div>
			<div class="pimag_upload"><img src="./resources/images/plus1.png"></div>
			<div class="pimag_upload"><img src="./resources/images/plus1.png"></div>
		</div>
		<div id="pinfo_area">
			<!-- 상품명, 상품이름 -->
		
		<form id="sell_form">
			<div id="sell_main">
				<p class="product_brand">브랜드명</p>			
				
				<p class="product_name">상품이름</p>				
				
			</div>
		
			<!-- 입찰시작가 설정 -->
			<div id="sell_price">
				<div class="sell_price_title">
					<span class="sell_price_title_txt">시작가</span>
				</div>
				<div class="sell_price_input">
					<span class="sell_price_input_txt">10,000원</span>				
				</div>
			</div>
			
			<!-- 입찰시작가 설정 -->
			<div id="sell_price">
				<div class="sell_price_title">
					<span class="sell_price_title_txt">시작가</span>
				</div>
				<div class="sell_price_input">
					<span class="sell_price_input_txt">10,000원</span>				
				</div>
			</div>
			
			<!-- 거래 방법 설정 -->
			<div id="trade_method">
				<div class="trade_method_title">
					<span class="trade_method_title_txt">거래방법</span>
				</div>
				<div class="trade_method_input">
					<select id="trade_method_select">
						<option value="self">직접거래</option>
						<option value="delivery">택배거래</option>
						<option value="both">둘 다</option>
					</select>			
				</div>
			</div>
			
			<!-- 상품 설명 -->
			<div id="sell_product_info">
				<div class="sell_product_info">
					<span class="sell_product_info_txt">상품설명</span>
				</div>
				<input type="text" name="product_content" id="product_content">
			</div>
			
			<!-- 등록 버튼 -->
			<div id="sell_btn">
				<button type="submit" id="sell_btn">등록하기</button>
			</div>
		
		</form>	

		</div>
	</div>
	
	<%@ include file= "footer.jsp"%>

</body>
</html>