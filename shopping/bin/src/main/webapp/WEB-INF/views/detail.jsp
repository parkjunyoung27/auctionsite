<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board_detail</title>
<link href="./css/index.css" rel="stylesheet">
<style type="text/css">

#bdetail_area{
	overflow: hidden;
    border-top: 1px solid black;
    margin-top: 25px;
}

#dtitle{
	float: left;
    width: 50%;
}

#dmember{
    float: left;
    width: 25%;
}

#ddate{
    float: left;
    width: 25%;
}

#dtitle_area{
    display: flex;
    height: 40px;
    font-size: 17px;
    border-bottom: 1px solid black;
    background-color: powderblue;
    line-height: 40px;
    padding-left: 5px;
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
		<div id="content_title"> 
			<h2> <c:out value="${boardDTO.category_name }"/> </h2>
		</div>		
		<div id="bdetail_area">
			<div id = "dtitle_area">
				<div id="dtitle">
					NO.<c:out value="${boardDTO.board_no }"/>&ensp;<c:out value="${boardDTO.board_title }"/>
				</div>
		
				<div id="dmember">
					<c:out value="${boardDTO.member_id }"/>(<c:out value="${boardDTO.member_name }"/>)
				</div>	
								
				<div id = "ddate">
					<c:out value="${boardDTO.board_date }"/> &emsp; 조회:<c:out value="${boardDTO.board_count }"/>
				</div>			
			</div>
		

		<div id="dcontent">
			내용<br>
		<c:out value="${boardDTO.board_content }"/><br>
		</div>
		</div>
	</div>
</main>

<footer>
	<%@ include file= "footer.jsp"%>
</footer>	
</body>
</html>