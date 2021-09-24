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
    height: 50px;
    font-size: 17px;
    border-bottom: 1px solid black;
    background-color: #EEEFF1;
    line-height: 50px;
    padding-left: 5px;
}

#dcontent{
	padding: 5px;
	padding-top: 25px;
    border-bottom: 1px solid black;
    min-height: 500px;
}

#detail_btn{
	text-align: end;
}

#detail_btn button{
	height: 30px;
    background-color: whitesmoke;
    font-weight: 700;
    border: 1px solid black;
    margin-top: 5px;
    cursor: pointer;
}
</style>

<script type="text/javascript">
function board_delete(no){
	var result = confirm("정말 삭제하시겠습니까?");
	if(result == true){
		location.href="./delete?board_no="+no;
	}
}
</script>

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
					조회&ensp;:&ensp;<c:out value="${boardDTO.board_count }"/> &emsp;<c:out value="${boardDTO.board_date }"/>
				</div>			
						
			</div>
			
			<div id="dcontent">
				${boardDTO.board_content }
			</div>
			
			<div id="detail_btn">
				<button onclick="location.href='./update'">수정하기</button>
				<c:if test="${sessionScope.id eq boardDTO.member_id}"> <button onclick="return board_delete(${boardDTO.board_no})">삭제하기</button> </c:if>
			</div>
		</div>
	</div>
	
</main>

<footer>
	<%@ include file= "footer.jsp"%>
</footer>	
</body>
</html>