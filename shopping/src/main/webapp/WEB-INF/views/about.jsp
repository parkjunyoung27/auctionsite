<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About - 퀵션</title>
<link href="./css/index.css" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.6.0.js" 
integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" 
crossorigin="anonymous"></script>

<script>
<% for(int i=1; i<5; i++){ %>
	function setThumbnail<%=i%>(event){
		var reader = new FileReader();
		
		reader.onload = function(event){
			var img = document.getElementById("target_img<%=i%>");
			img.setAttribute("src", event.target.result);
			img.setAttribute("class", "col-lg-6");
			img.setAttribute('width', 256);
			document.querySelector("div#target_img<%=i%>").appendChild(img);
		};
		reader.readAsDataURL(event.target.files[0]);
	}
<%}%>
</script>

</head>
<body>
<h1>실험실</h1> 

<h2>이미지 파일 업로드 하기</h2>


<% for( int i=1; i < 5; i++){  %>
<input type=file name='file<%=i %>' onchange="setThumbnail<%=i%>(event);" style='display: none ;'> 
<input type='text' name='file_src<%=i %>'> 
<% } %>
 
	<div id="pimage_area">
		<% for( int i=1; i < 5; i++){  %>
		<div class="pimag_upload">
		<img id="target_img<%=i%>" onclick='document.all.file<%=i %>.click(); document.all.file_src<%=i %>.value=document.all.file<%=i %>.value' 
			src="./resources/images/plus.png" width=128px>
		</div>		
		<% } %>
	</div>

 
<hr>
							


</body>
</html>