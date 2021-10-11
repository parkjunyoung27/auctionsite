<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class ="searchbar">
	
	<div id="search">
		<div id="searchform">
			<input type="search" id="search">
			<button type="submit"><img src="./resources/images/search.png"></img></button>
		</div>
		<c:if test="${id ne null }">
			<a id="sell" href="./sell"><img src="./resources/images/sell.png">판매하기</a>
		</c:if>
	</div>
	
</div>