<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
		<title>Quicktion | 중고상품의 가치가 궁금할땐</title>
	<link href="./css/index.css" rel="stylesheet">
</head>
	<header>
		<jsp:include page="menu.jsp"/>
		<!--<c:import url="/menu" />-->	
	</header>
	<body>
		<div class="hero-header"></div>
		<div class="time-limit">
			<jsp:include page="time.jsp"/>	
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
									<img src="./images/products/airforce.jpg" class="product_img">
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

	
		<%@ include file= "footer.jsp"%>

	</body>
</html>