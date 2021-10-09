<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
		<title>Quicktion | 중고상품의 가치가 궁금할땐</title>
	<link href="./resources/css/index.css" rel="stylesheet">
	<link href="./resources/css/header.css" rel="stylesheet">
	<link href="./resources/css/footer.css" rel="stylesheet">
</head>
	<header>
		<%@ include file="./component/navbar.jsp"%>
		<%@ include file="./component/searchbar.jsp"%>
	</header>
	<body>
		<div class="hero-header"></div>
		<div class="time-limit">
			<%@ include file="./component/time.jsp"%>	
		</div>
		
		<div class="main_product">
			<div class="main_title">
				<div class="main_title_2">HOT</div>
				<div class="sub_title">인기상품</div>
			</div>
			<div class="product_list_container">
				<div class="product_list"> 
				
					<div class="item">
						<a href='#' class="item_enter">
							<div class="thumbnail_box">
								<div class="product">
									<img src="./resources/images/products/airforce.jpg" class="product_img">
								</div>
							</div>
							<div class="product_info">
								<div class="product_kind">
									<p>운동화</p>
								</div>
								<p class="product_name">나이키 피스마이너스원(블랙) <br> 지드래곤 신발</p>
								<div class="price">
									<div class="prcie_text">
										<b class="num">320,000</b>
										<span class="won">원</span>
									</div>
									<div class="buy_price">
										<p>현재 입찰가</p>
									</div>
								</div>
							</div>		
						</a>
					</div>

				</div>
			 </div>
		</div>

	
		<%@ include file="./component/footer.jsp"%>
		
		
<!--Start of Tawk.to Script, 상담-->

<script type="text/javascript">
	var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
	(function(){
	var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
	s1.async=true;
	s1.src='https://embed.tawk.to/61434888d326717cb681ce58/1ffnd6m4v';
	s1.charset='UTF-8';
	s1.setAttribute('crossorigin','*');
	s0.parentNode.insertBefore(s1,s0);
	})();
</script>
<!--End of Tawk.to Script-->

	</body>
</html>