<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>	

	<script>
	function onLogoutClick() {
		location.href = '${pageContext.request.contextPath}/logout.do';
		}
	
	$(function(){
		$(".son").hide();
		   $("#menu li").on("mouseover focusin",function(){
		      $(this).children(".son").stop().slideDown(500);
		   }).on("mouseout focusout",function(){
		      $(this).children(".son").stop().slideUp(500);
		   });
	});
	
	</script>
	
<div class ="navbar">
	<a href = "./" id = "logo">
	QuickTion
	</a>
	<ul id ="menu">
		<li class="menuli"><a href="./about">About</a></li>
		<li class="menuli"><a href="#">Cart</a></li>
		<li class="menuli"><a href="./board">Board</a>
				<ul class="son">
					<li><a href="./board.do?boardNo=0">공지사항</a></li>
					<li><a href="./board.do?boardNo=1">가맹점주</a></li>
					<li><a Href="./board.do?boardNo=2">문의사항</a></li>
				</ul>
		</li>
		<li class="menuli">
			<c:choose>
				<c:when test="${sessionScope.id eq null }">
					<a href="./login">Login</a>						
				</c:when>			
				<c:otherwise>
				    <a href="./message.do" class="">${sessionScope.name}님 ${sessionScope.authUser}</a>
					<ul class="son">
						<li><a href="./board">내정보</a></li>
						<li><a href="./board">주문내역</a></li>
						<li><a href="./logout">Logout</a></li>	
					</ul>
				</c:otherwise>
			</c:choose>
		</li>	
	</ul>
</div>