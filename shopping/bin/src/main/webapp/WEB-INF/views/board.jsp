<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link href="./css/index.css" rel="stylesheet">
<style type="text/css">

.board li a{
	text-decoration : none;
	color : black;
}

</style>

</head>
<body>
<header>
	<%@ include file= "menu.jsp"%>
</header>
<main>
	<div id="container">	
		<c:import url="/sub_board_menu"/>				
		
		<div id="content">
		
			<div id="content_title_border"> 
				<div id="content_title"> 
					<h2> ${category } </h2>
				</div>
			</div>	
				<ul class="board">
					<li class="fl tc w10 title t_line">번호</li>
					<li class="fl tc w50 title t_line">제목</li>
					<li class="fl tc w10 title t_line">글쓴이</li>
					<li class="fl tc w20 title">작성일</li>
				</ul>
				<ul class="board">
				<c:forEach items="${list }" var="l">					 
					 <li class="fl tc w10 list t_line lt_line">${l.board_no} </li>
					 <li class="fl tc w50 list t_line lt_line"><a href="./detail?board_no=${l.board_no }">${l.board_title}(${l.board_count })</a> </li>
					 <li class="fl tc w10 list t_line lt_line">
					 <c:choose><c:when test="${bcno ne 3 }">관리자</c:when><c:otherwise>${l.member_id}</c:otherwise></c:choose>   
					 </li>
					 <li class="fl tc w20 list lt_line">${l.board_date} </li>
				 </c:forEach>
				 </ul>	
				 		
		<div class="pagination">
		</div>
		
		</div>
	</div>
</main>
<footer>
	<%@ include file= "footer.jsp"%>
</footer>	
</body>
</html>