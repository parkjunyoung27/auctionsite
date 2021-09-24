<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class ="navbar">
	<a href = "./" id = "logo">
	QuickTion
	</a>
	<ul id ="menu">
		<li><a href="#">About</a></li>
		<li><a href="#">Product</a></li>
		<li><a href="#">Cart</a></li>
		<li><a href="./board">Board</a></li>
	<c:choose>
		<c:when test="${id eq null }">
			<li><a href="./login">Login</a></li>						
		</c:when>			
		<c:otherwise>
			<li><a href="./board">Profile</a></li>
			<li><a href="./logout">Logout</a></li>						
		</c:otherwise>
	</c:choose>
	
	</ul>
</div>