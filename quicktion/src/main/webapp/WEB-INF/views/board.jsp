<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quicktion | 게시판</title>
	<link href="./resources/css/index.css" rel="stylesheet">
	<link href="./resources/css/header.css" rel="stylesheet">
	<link href="./resources/css/footer.css" rel="stylesheet">
	<link href="./resources/css/board.css" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
<style type="text/css">

</style>

</head>
<body>
	<header>
		<%@ include file="./component/navbar.jsp"%>
	</header>
	
	<main>
	<!-- board -->
	<div id="boardContainer">

		<!--서브메뉴바 -->
		<c:import url="./sub_board_menu.jsp" />
		<!-- 게시판 내용 -->
		<div id="content">

			<div id="content_title_border">
				<div id="content_title">
					<h2></h2><!-- 게시판 이름 연결 -->
					<!-- <h2> ${category } </h2> -->
				</div>
			</div>
			<ul class="board">
				<li class="fl tc w10 title t_line">번호</li>
				<li class="fl tc w50 title t_line">제목</li>
				<li class="fl tc w10 title t_line">글쓴이</li>
				<li class="fl tc w20 title">작성일</li>
			</ul>
			<ul id="boardLine" onclick="location.href='./detail?board_no=${board_no}'">
				<c:forEach items="${list }" var="l">
					<li class="fl tc w10 list t_line lt_line">${l.board_no }</li>
					<li class="fl tc w50 list t_line lt_line" id="boardLineClick">${l.board_title}[${l.board_count }]</li>
					<li class="fl tc w10 list t_line lt_line">
						<c:choose>
							<c:when test="${user_level eq 3 }">관리자</c:when>
							<c:otherwise>${l.member_name}</c:otherwise>
						</c:choose>
					</li>
					<li class="fl tc w20 list lt_line">${l.board_date}</li>
				</c:forEach>
			</ul>
		</div>
		
		<form action="./board.do" id="board_search_form">
			<select name="searchName">
				<option value="title" <c:if test="${searchName eq 'title' }">selected="selected"</c:if>>
				제목</option>
				<option value="content" <c:if test="${searchName eq 'content' }">selected="selected"</c:if>>
				내용</option>
				<option value="writer"<c:if test="${searchName eq 'writer' }">selected="selected"</c:if>>
				글쓴이</option>
			</select>
			<input type="text" name="search" value="${search}">
			<button type="submit">검색</button>
		</form>
		
	</div>
		
	</main>
	
	<footer>
		<%@ include file="./component/footer.jsp"%>
	</footer>
		
</body>
</html>